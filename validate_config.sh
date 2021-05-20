#!/usr/bin/env bash

set -e -x

cd "$(dirname "$0")"

test -f .env
source .env
export TMP VAR

docker-compose config
