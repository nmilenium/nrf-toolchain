#!/bin/bash

if [ -f .env ]; then
  export $(cat .env | xargs)
fi

docker compose run -rm nrf-env picocom -b 115200 {NRF-PORT}
