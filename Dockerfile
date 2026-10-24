#18.04 Версия где есть python2 в репозиториях, можно использовать по новее, и собирать питон из исходников
FROM ubuntu:18.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
  build-essential \
  gcc-arm-none-eabi \
  git \
  make \
  picocom \
  python2.7 \
  python-pip \
  python-setuptools \
  python-wheel \
  ca-certificates \
  && rm -rf /var/lib/apt/lists/*

RUN update-alternatives --install /usr/bin/python python /usr/bin/python2.7 1

RUN python -m pip install --upgrade pip==20.3.4 && \
  pip install nrfutil

WORKDIR /project

CMD ["/bin/bash"]
