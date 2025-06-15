ARG BASE_IMAGE
FROM ${BASE_IMAGE}

ARG BASE_IMAGE
ARG COMPILER_VERSION
LABEL description="GCC-${COMPILER_VERSION} dev container on ${BASE_IMAGE}"

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update -y \
  && apt-get remove -y gcc g++ \
  && apt-get autoremove -y

ARG COMPILER_VERSION
RUN apt-get install -y \
        gcc-${COMPILER_VERSION} \
        g++-${COMPILER_VERSION} \
        gcc-${COMPILER_VERSION}-multilib \
        g++-${COMPILER_VERSION}-multilib \
  && update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-${COMPILER_VERSION} 10000 \
                        --slave /usr/bin/g++ g++ /usr/bin/g++-${COMPILER_VERSION} \
  && update-alternatives --install /usr/bin/gcov gcov /usr/bin/gcov-${COMPILER_VERSION} 10000

ARG PACKAGE_LIST
RUN apt-get install -y ${PACKAGE_LIST} \
    && apt-get clean -y

ENV CC=/usr/bin/gcc \
    CXX=/usr/bin/g++ \
    CMAKE_GENERATOR=Ninja
