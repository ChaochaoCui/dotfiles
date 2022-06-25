#!/usr/bin/env bash

set -euo pipefail

export BIN_DIR=$HOME/.local/bin
export APPS_DIR=$HOME/.local/share/applications
export ICONS_DIR=$HOME/.local/share/icons/hicolor/scalable/mimetypes
export FONTS_DIR=$HOME/.local/share/fonts

mkdir -p ${BIN_DIR}
mkdir -p ${APPS_DIR}
mkdir -p ${ICONS_DIR}
mkdir -p ${FONTS_DIR}


for d in *; do
    if [[ -d $d ]]; then
        if [[ -x $d/install.sh ]]; then
            cd $d
            ./install.sh
            cd -
        fi
    fi
done
