ARG BASE_IMAGE
FROM ${BASE_IMAGE}

ARG BASE_IMAGE
LABEL description="Base dev container on ${BASE_IMAGE}"

ENV DEBIAN_FRONTEND=noninteractive

# Debian 11 (bullseye) is EOL: deb.debian.org/security.debian.org no
# longer serve it, and archive.debian.org alone doesn't work either --
# it has no bullseye-security counterpart, so packages baked into this
# base image (libc6, perl-base, gpgv) have dependencies (libc6-dbg,
# perl-base at an exact version) that simply don't exist in the
# archive-only index, downgrade or not. Pinning all three suites to the
# same snapshot.debian.org timestamp is the only source that still has
# a matching bullseye-security snapshot.
ARG BULLSEYE_SNAPSHOT=20260830T191451Z
RUN if [ -f /etc/os-release ] && grep -q '^VERSION_CODENAME=bullseye' /etc/os-release; then \
        printf '%s\n' \
            "deb [check-valid-until=no] http://snapshot.debian.org/archive/debian/${BULLSEYE_SNAPSHOT}/ bullseye main" \
            "deb [check-valid-until=no] http://snapshot.debian.org/archive/debian/${BULLSEYE_SNAPSHOT}/ bullseye-updates main" \
            "deb [check-valid-until=no] http://snapshot.debian.org/archive/debian-security/${BULLSEYE_SNAPSHOT}/ bullseye-security main" \
            > /etc/apt/sources.list; \
    fi

RUN apt-get update -y\
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

# see: https://stackoverflow.com/a/76469774/4691843
ENV PIP_CACHE_DIR=/tmp/pip/.cache \
    PIP_BREAK_SYSTEM_PACKAGES=1

# we need a fixed CMake version
COPY tools/install-cmake.sh ./
RUN chmod +x ./install-cmake.sh \
  && ./install-cmake.sh \
  && rm install-cmake.sh \
