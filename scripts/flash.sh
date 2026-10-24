#!/bin/bash
set -e

if [ -f .env ]; then
  export $(cat .env | xargs)
fi

docker-compose run --rm nrf-env bash -c "nrfutil dfu usb-serial -p ${NRF_PORT} -pkg /workspace/build/nrf52840_xxaa.zip"
