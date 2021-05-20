#!/usr/bin/env bash

set -e

cd "$(dirname "$0")"

test -f .env
source .env
export PLOTS_TMP_DIR PLOTS_FINAL_DIR PLOT_K PLOT_N

source functions.d/script_load_directory.sh
script_load_directory functions.d

silently docker-compose config

echo "docker-compose.yml: OK"
