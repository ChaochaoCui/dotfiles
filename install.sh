#!/usr/bin/env bash


set -euxo pipefail

export BIN_DIR=$HOME/.local/bin
export APPS_DIR=$HOME/.local/share/applications
export ICONS_DIR=$HOME/.local/share/icons/hicolor/scalable/mimetypes
export FONTS_DIR=$HOME/.local/share/fonts

mkdir -p ${BIN_DIR}
mkdir -p ${APPS_DIR}
mkdir -p ${ICONS_DIR}
mkdir -p ${FONTS_DIR}

cd alacritty/
./install.sh
cd -

cd fonts/
./install.sh
