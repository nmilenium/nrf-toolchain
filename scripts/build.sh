#!/bin/bash

set -e

if [ -f .env]; then
  export $(cat .env | xargs)
fi

BUILD_DIR=${MAKEFILE_PATH}

docker-compose run --rm nrf-env make -C /project/${BUILD_DIR} "$@"
