#!/bin/bash

#set -x
set -euo pipefail

if [ -L "$0" ]; then
    readonly SCRIPT_HOME="$(dirname "$(readlink "$0")")"
else
    readonly SCRIPT_HOME="$(cd "$(dirname "$0")" && pwd)"
fi

readonly LIBFLAME_DIR="${SCRIPT_HOME}/libflame"
readonly LIBFLAME_BUILD_DIR="${SCRIPT_HOME}/build/libflame"
readonly LIBFLAME_INSTALL_DIR="${HOME}/libflame"

rm -rf "${LIBFLAME_BUILD_DIR}"
mkdir -p "${LIBFLAME_BUILD_DIR}"
(cd "${LIBFLAME_BUILD_DIR}" && "${LIBFLAME_DIR}/configure" --prefix="${LIBFLAME_INSTALL_DIR}")
make -C "${LIBFLAME_BUILD_DIR}" -j
make -C "${LIBFLAME_BUILD_DIR}" install
