#!/usr/bin/env bash

set -eux

if [[ -e .done ]]; then
	echo "Fonts has Installed!"
else
	unzip -o Hack.zip -d ${FONTS_DIR}/Hack/
	fc-cache -f -v
	touch .done
	echo "Install Fonts Done"
fi
