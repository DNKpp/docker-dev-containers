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
	pip \
	pipx

COPY tools/install-cmake.sh ./
RUN chmod +x ./install-cmake.sh
RUN ./install-cmake.sh
RUN rm install-cmake.sh
	
RUN apt-get clean
