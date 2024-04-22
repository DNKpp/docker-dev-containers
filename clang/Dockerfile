ARG BASE_IMAGE
FROM ${BASE_IMAGE}

ARG BASE_IMAGE
LABEL description="Clang-${COMPILER_VERSION} dev container on ${BASE_IMAGE}"

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update

ARG COMPILER_VERSION
RUN apt-get install -y clang-${COMPILER_VERSION}
RUN update-alternatives --install /usr/bin/clang clang /usr/bin/clang-${COMPILER_VERSION} 10000 \
	--slave /usr/bin/clang++ clang++ /usr/bin/clang++-${COMPILER_VERSION}

ARG PACKAGE_LIST
RUN apt-get install -y ${PACKAGE_LIST}
	
RUN apt-get clean

ENV CC              /usr/bin/clang
ENV CXX             /usr/bin/clang++
ENV CMAKE_GENERATOR Ninja
