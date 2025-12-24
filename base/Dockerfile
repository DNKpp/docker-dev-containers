ARG BASE_IMAGE
FROM ${BASE_IMAGE}

ARG BASE_IMAGE
LABEL description="Base dev container on ${BASE_IMAGE}"

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update -y \
    && apt-get upgrade -y \
    && apt-get install -y \
        gdb \
        curl \
        gpg \
        rsync \
        zip \
        openssh-server \
        make \
        wget \
        git \
        ninja-build \
        valgrind \
        python3 \
        python3-pip \
    && update-alternatives --install /usr/bin/python python /usr/bin/python3 300 \
    && apt-get clean

# circumvent the insufficient permissions during install in ci scripts
RUN mkdir -p /tmp/pip/.cache \
    && chmod -R a+rwx /tmp/pip
ENV PIP_CACHE_DIR=/tmp/pip/.cache \
    # see: https://stackoverflow.com/a/76469774/4691843
    PIP_BREAK_SYSTEM_PACKAGES=1

# we need a fixed CMake version
COPY tools/install-cmake.sh ./
RUN chmod +x ./install-cmake.sh \
  && ./install-cmake.sh \
  && rm install-cmake.sh \
