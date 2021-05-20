#!/usr/bin/env bash

set -e -x

cd "$(dirname "$0")"

test -f .env
source .env
export PLOTS_TMP_DIR PLOTS_FINAL_DIR PLOT_K PLOT_N

docker-compose config
