ARG BASE_IMAGE
FROM ${BASE_IMAGE}

ARG BASE_IMAGE
LABEL description="${COMPILER_NAME}-${COMPILER_VERSION} dev container on ${BASE_IMAGE}"

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update

ARG COMPILER_NAME
ARG COMPILER_VERSION
RUN apt-get install -y ${COMPILER_NAME}-${COMPILER_VERSION}
RUN update-alternatives --install /usr/bin/${COMPILER_NAME} ${COMPILER_NAME} /usr/bin/${COMPILER_NAME}-${COMPILER_VERSION} 10000 --slave /usr/bin/${COMPILER_NAME}++ ${COMPILER_NAME}++ /usr/bin/${COMPILER_NAME}++-${COMPILER_VERSION}

RUN apt-get install -y gdb rsync zip openssh-server make wget git ninja-build

COPY tools/install-cmake.sh ./
RUN chmod +x ./install-cmake.sh
RUN ./install-cmake.sh
RUN rm install-cmake.sh
	
RUN apt-get clean

ENV CC              ${COMPILER_NAME}
ENV CXX             ${COMPILER_NAME}++
ENV CMAKE_GENERATOR Ninja
