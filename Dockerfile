FROM ubuntu:22.04

RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends \
    build-essential \
    gdb \
    cmake \
    python3.10-dev \
    && rm -rf /var/lib/apt/lists/*
