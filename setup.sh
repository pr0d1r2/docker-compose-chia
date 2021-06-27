#!/usr/bin/env bash

set -e -x

cd "$(dirname "$0")"

case $@ in
  *--linux* | *--macos*)
    test -f .env || cp .env.example .env
    ;;
esac
case $@ in
  *--linux*)
    sed -i='' -e 's|$HOME/tmp|/tmp|g' -i='' -e 's|$HOME/var|/var/lib|g' .env
    ;;
esac

test -f .env
source .env
export PLOTS_TMP_DIR PLOTS_FINAL_DIR PLOT_K PLOT_N TMP VAR SETUP_STATE

parallel "test -d {} || mkdir -p {}" ::: "$PLOTS_TMP_DIR" "$PLOTS_FINAL_DIR" "$SETUP_STATE"

if [ ! -f "$SETUP_STATE/chia.built" ]; then
  bash build.sh && touch "$SETUP_STATE/chia.built"
fi

if [ ! -f "$SETUP_STATE/init.done" ]; then
  # Init your config
  docker-compose run init && touch "$SETUP_STATE/init.done"
fi

if [ ! -f "$SETUP_STATE/generate_keys.done" ]; then
  # Generate your keys
  docker-compose run generate_keys && touch "$SETUP_STATE/generate_keys.done"
fi

case $@ in
  *--skip-plots*)
    ;;
  *)
    if [ ! -f "$SETUP_STATE/generate_plots.done" ]; then
      # Start Generating some Plots
      docker-compose up -d -e "PLOT_K=$PLOT_K" -e "PLOT_N=$N" create_plots && touch "$SETUP_STATE/generate_plots.done"
    fi
    ;;
esac

case $@ in
  *--linux*)
    cp chia-blockchain.service /etc/systemd/system/
    systemctl enable chia-blockchain
    systemctl start chia-blockchain
    ;;
esac
