#!/usr/bin/env bash

set -eu

if [[ -e .done ]]; then
	echo "Alacritty has Installed!"
else
	mkdir -p ~/.config/alacritty
	ln -srfv Alacritty.desktop ${APPS_DIR}/
	ln -srfv Alacritty.svg ${ICONS_DIR}/
	ln -srfv alacritty.yml ~/.config/alacritty/
	touch .done
	echo "Install Alacritty Done"
fi
