FROM ubuntu:22.04

RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends \
    build-essential \
    gdb \
    cmake \
    && rm -rf /var/lib/apt/lists/*
