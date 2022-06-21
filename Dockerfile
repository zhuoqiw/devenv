FROM ubuntu:22.04

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

RUN git clone https://github.com/TheImagingSource/tiscamera.git

# Install TIS dependencies
RUN sed -i 's?"sudo", "apt"?"apt-get"?g' tiscamera/scripts/dependency-manager \
    && export DEBIAN_FRONTEND=noninteractive \
    && ./tiscamera/scripts/dependency-manager install --yes --compilation --modules base,gstreamer,v4l2 \
    && rm -rf /var/lib/apt/lists/*

