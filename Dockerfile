ARG UBUNTU_VERSION
ARG ROS_DISTRO

FROM zhuoqiw/ros-pylon:6.2.0-${UBUNTU_VERSION} AS pylon

FROM ros:${ROS_DISTRO}

COPY --from=pylon /setup /
RUN ldconfig

RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends \
    nano \
    && rm -rf /var/lib/apt/lists/*

# RUN git clone -c http.sslverify=false https://github.com/
