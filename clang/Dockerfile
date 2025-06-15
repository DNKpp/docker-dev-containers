ARG BASE_IMAGE
FROM ${BASE_IMAGE}

ARG BASE_IMAGE
ARG COMPILER_VERSION
LABEL description="Clang-${COMPILER_VERSION} dev container on ${BASE_IMAGE}"

ENV DEBIAN_FRONTEND=noninteractive
RUN dpkg --add-architecture i386 \
  && apt-get update -y \
  && apt-get remove -y gcc g++ \
  && apt-get autoremove -y

ARG COMPILER_VERSION
RUN apt-get install -y \
      clang-${COMPILER_VERSION} \
      clang-tools-${COMPILER_VERSION} \
  && update-alternatives --install /usr/bin/clang clang /usr/bin/clang-${COMPILER_VERSION} 10000 \
                        --slave /usr/bin/clang++ clang++ /usr/bin/clang++-${COMPILER_VERSION}

ARG PACKAGE_LIST
RUN apt-get install -y ${PACKAGE_LIST} \
    && apt-get clean -y

ENV CC=/usr/bin/clang \
    CXX=/usr/bin/clang++ \
    CMAKE_GENERATOR=Ninja
