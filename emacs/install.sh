#!/usr/bin/env bash

set -eu

NAME=emacs

if [[ -e .done ]]; then
	echo "$NAME has Installed!"
else
	git clone https://github.com/ChaochaoCui/doom.d ~/.doom.d
	cd ~/.doom.d/
	git remote set-url origin git@github.com:ChaochaoCui/doom.d.git
	cd -
	git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.emacs.d
	export PATH=~/.emacs.d/bin:$PATH
	doom install --force
	echo "export PATH=~/.emacs.d/bin:\$PATH" >> ~/.bashrc
	touch .done
	echo "Install $NAME Done"
fi
