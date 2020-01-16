#!/bin/bash

#set -x
set -euo pipefail

if [ -L "$0" ]; then
    readonly SCRIPT_HOME="$(dirname "$(readlink "$0")")"
else
    readonly SCRIPT_HOME="$(cd "$(dirname "$0")" && pwd)"
fi

readonly BLIS_DIR="${SCRIPT_HOME}/blis"
readonly BLIS_BUILD_DIR="${SCRIPT_HOME}/build/blis"
readonly BLIS_INSTALL_DIR="${HOME}/blis"

rm -rf "${BLIS_BUILD_DIR}"
mkdir -p "${BLIS_BUILD_DIR}"
(cd "${BLIS_BUILD_DIR}" && "${BLIS_DIR}/configure" -t openmp -p "${BLIS_INSTALL_DIR}" auto)
make -C "${BLIS_BUILD_DIR}" -j
make -C "${BLIS_BUILD_DIR}" -j check
make -C "${BLIS_BUILD_DIR}" install
