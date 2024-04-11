ARG BASE_IMAGE
FROM ${BASE_IMAGE}

ARG BASE_IMAGE
LABEL description="${COMPILER_NAME}-${COMPILER_VERSION} dev container on ${BASE_IMAGE}"

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update

ARG COMPILER_NAME
ARG COMPILER_VERSION
RUN apt-get install -y ${COMPILER_NAME}-${COMPILER_VERSION}
RUN apt-get install -y gdb rsync zip openssh-server make cmake git ninja-build

ENV CC              ${COMPILER_NAME}-${CLANG_VERSION}
ENV CXX             ${COMPILER_NAME}++-${CLANG_VERSION}
ENV CMAKE_GENERATOR Ninja
