#!/usr/bin/env bash
set -eou pipefail

VERSION="3.31.8"

ARCH="$(uname -m)"
MIRROR_URL="https://github.com/Kitware/CMake/releases/download/v${VERSION}/"
DOWNLOAD_SH="cmake-${VERSION}-linux-${ARCH}.sh"
DOWNLOAD_FILE="cmake.sh"

# Download
echo "Downloading ${DOWNLOAD_SH}"
wget -nv -O "${DOWNLOAD_FILE}" "${MIRROR_URL}/${DOWNLOAD_SH}"

# Install
echo "Installing CMake"
bash "${DOWNLOAD_FILE}" --skip-license --prefix=/usr/local --exclude-subdir

# Cleanup
rm "${DOWNLOAD_FILE}"
