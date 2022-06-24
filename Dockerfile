ARG UBUNTU_VERSION

FROM zhuoqiw/ros-tis:1.0.0-${UBUNTU_VERSION} AS tis

FROM ubuntu:${UBUNTU_VERSION}

COPY --from=tis /tiscamera.deb tiscamera.deb

RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends \
    nano \
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
