#!/usr/bin/env bash

set -e -x

cd "$(dirname "$0")"

test -f .env
source .env
export PLOTS_TMP_DIR PLOTS_FINAL_DIR PLOT_K PLOT_N

parallel "test -d {} || mkdir -p {}" ::: "$PLOTS_TMP_DIR" "$PLOTS_FINAL_DIR" "$SETUP_STATE"

docker-compose up -d full_node
