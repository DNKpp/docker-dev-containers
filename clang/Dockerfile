ARG BASE_IMAGE
FROM ${BASE_IMAGE}

ARG BASE_IMAGE
ARG COMPILER_VERSION
LABEL description="Clang-${COMPILER_VERSION} dev container on ${BASE_IMAGE}"

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update -y \
  && apt-get remove -y gcc g++ \
  && apt-get autoremove -y

ARG COMPILER_VERSION
RUN apt-get install -y \
      clang-${COMPILER_VERSION} \
      clang-tools-${COMPILER_VERSION} \
      libc++-${COMPILER_VERSION}-dev \
      libc++abi-${COMPILER_VERSION}-dev

ARG GCC_TOOLCHAIN_VERSION
ARG TARGETPLATFORM
RUN TOOLCHAIN_FLAG=""; \
    if [ -n "$GCC_TOOLCHAIN_VERSION" ]; then \
        apt-get install -y \
                gcc-${GCC_TOOLCHAIN_VERSION} \
                g++-${GCC_TOOLCHAIN_VERSION}; \
        TOOLCHAIN_FLAG="--gcc-install-dir=/usr/lib/gcc/x86_64-linux-gnu/${GCC_TOOLCHAIN_VERSION}"; \
        if [ "$TARGETPLATFORM" = "linux/amd64" ]; then \
            apt-get install -y \
                    gcc-${GCC_TOOLCHAIN_VERSION}-multilib \
                    g++-${GCC_TOOLCHAIN_VERSION}-multilib; \
        fi; \
    fi; \
    printf '#!/bin/sh\nexec /usr/bin/clang-%s %s "$@"\n' "${COMPILER_VERSION}" "${TOOLCHAIN_FLAG}" > /usr/local/bin/clang && \
    chmod +x /usr/local/bin/clang && \
    printf '#!/bin/sh\nexec /usr/bin/clang++-%s %s "$@"\n' "${COMPILER_VERSION}" "${TOOLCHAIN_FLAG}" > /usr/local/bin/clang++ && \
    chmod +x /usr/local/bin/clang++

RUN apt-get clean -y

ENV CC=/usr/local/bin/clang \
    CXX=/usr/local/bin/clang++ \
    CMAKE_GENERATOR=Ninja
