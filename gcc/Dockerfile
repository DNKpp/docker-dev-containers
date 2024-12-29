ARG BASE_IMAGE
FROM ${BASE_IMAGE}

ARG BASE_IMAGE
ARG COMPILER_VERSION
LABEL description="GCC-${COMPILER_VERSION} dev container on ${BASE_IMAGE}"

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update -y

RUN apt-get remove -y gcc g++
RUN apt-get autoremove -y

ARG COMPILER_VERSION
RUN apt-get install -y gcc-${COMPILER_VERSION} g++-${COMPILER_VERSION}
RUN update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-${COMPILER_VERSION} 10000 \
                        --slave /usr/bin/g++ g++ /usr/bin/g++-${COMPILER_VERSION}
RUN update-alternatives --install /usr/bin/gcov gcov /usr/bin/gcov-${COMPILER_VERSION} 10000

ARG PACKAGE_LIST
RUN apt-get install -y ${PACKAGE_LIST}
	
RUN apt-get clean -y

ENV CC=/usr/bin/gcc
ENV CXX=/usr/bin/g++
ENV CMAKE_GENERATOR=Ninja
