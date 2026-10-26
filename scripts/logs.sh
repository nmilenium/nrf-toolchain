#!/bin/bash

if [ -f .env ]; then
  export $(cat .env | xargs)
fi

docker run --rm -it --device ${NRF_PORT} --group-add keep-groups \
  ghcr.io/picocom-ng/picocom:latest -b 115200 ${NRF_PORT}
