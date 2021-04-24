#!/usr/bin/env bash

set -e -x

cd "$(dirname "$0")"

test -f .env
source .env
export PLOTS_TMP_DIR PLOTS_FINAL_DIR PLOT_K PLOT_N TMP VAR SETUP_STATE

parallel "test -d {} || mkdir -p {}" ::: "$PLOTS_TMP_DIR" "$PLOTS_FINAL_DIR" "$SETUP_STATE"

if [ ! -f "$SETUP_STATE/chia.built" ]; then
  sh build.sh && touch "$SETUP_STATE/chia.built"
fi

if [ ! -f "$SETUP_STATE/init.done" ]; then
  # Init your config
  docker-compose run init && touch "$SETUP_STATE/init.done"
fi

if [ ! -f "$SETUP_STATE/generate_keys.done" ]; then
  # Generate your keys
  docker-compose run generate_keys && touch "$SETUP_STATE/generate_keys.done"
fi

if [ ! -f "$SETUP_STATE/generate_keys.done" ]; then
  # Start Generating some Plots
  docker-compose up -d -e "PLOT_K=$PLOT_K" -e "PLOT_N=$N" create_plots && touch "$SETUP_STATE/generate_keys.done"
fi