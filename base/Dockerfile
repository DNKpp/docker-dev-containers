ARG BASE_IMAGE
ARG COMPILER_NAME
ARG COMPILER_VERSION
FROM ${BASE_IMAGE}

LABEL description="${COMPILER_NAME}-${COMPILER_VERSION} dev container on ${BASE_IMAGE}"

RUN apt-get update
RUN apt-get install -y ${COMPILER_NAME}-${COMPILER_VERSION}

RUN apt-get install -y gdb rsync zip openssh-server make cmake git ninja-build

ENV CC              ${COMPILER_NAME}-${CLANG_VERSION}
ENV CXX             ${COMPILER_NAME}++-${CLANG_VERSION}
ENV CMAKE_GENERATOR Ninja
