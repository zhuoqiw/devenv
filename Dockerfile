ARG ubuntu_version

FROM ubuntu:${ubuntu_version:-latest}

RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends \
    lsb-release \
    build-essential \
    gdb \
    cmake \
    python3 \
    python3-dev \
    git \
    && rm -rf /var/lib/apt/lists/*

# RUN git clone -c http.sslverify=false https://github.com/
