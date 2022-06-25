#!/usr/bin/env bash

set -eu

if [[ -e .done ]]; then
	echo "Emacs has Installed!"
else
	git clone https://github.com/ChaochaoCui/doom.d ~/.doom.d
	git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.emacs.d
	export PATH=~/.emacs.d/bin:$PATH
	doom install --force
	echo "export PATH=~/.emacs.d/bin:\$PATH" >> ~/.bashrc
	touch .done
	echo "Install Emacs Done"
fi
