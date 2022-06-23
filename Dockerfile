ARG UBUNTU_VERSION

FROM zhuoqiw/ros-tis:1.0.0-22.04 AS tis

FROM ubuntu:${UBUNTU_VERSION:-latest}

COPY --from=tis /tiscamera.deb tiscamera.deb

RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends \
    lsb-release \
    build-essential \
    gdb \
    cmake \
    python3 \
    python3-dev \
    python3-gi \
    git \
    ./tiscamera.deb \
    && rm -rf /var/lib/apt/lists/* ./tiscamera.deb

# RUN git clone -c http.sslverify=false https://github.com/
