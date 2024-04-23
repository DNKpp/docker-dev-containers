ARG BASE_IMAGE
FROM ${BASE_IMAGE}

ARG BASE_IMAGE
LABEL description="Base dev container on ${BASE_IMAGE}"

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update

RUN apt-get install -y \
	gdb \
	rsync \
	zip \
	openssh-server \
	make \
	wget \
	git \
	ninja-build \
	valgrind \
	python3 \
	python3-pip
RUN update-alternatives --install /usr/bin/python python /usr/bin/python3 300

# see: https://stackoverflow.com/a/76469774/4691843
ENV PIP_BREAK_SYSTEM_PACKAGES 1

# circumvent the insufficient permissions during install in ci scripts
RUN mkdir -p /tmp/pip/.cache
RUN chmod -R a+rwx /tmp/pip
ENV PIP_CACHE_DIR=/tmp/pip/.cache

# we need an fixed CMake version
COPY tools/install-cmake.sh ./
RUN chmod +x ./install-cmake.sh
RUN ./install-cmake.sh
RUN rm install-cmake.sh
	
RUN apt-get clean
