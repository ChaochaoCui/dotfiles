#!/usr/bin/env bash

set -eu

NAME=tmux

if [[ -e .done ]]; then
	echo " $NAME has Installed!"
else
	git clone https://github.com/gpakosz/.tmux.git ~/.tmux
	ln -srvf ~/.tmux/.tmux.conf ~/
	ln -srvf tmux.conf.local ~/.tmux.conf.local
	touch .done
	echo "Install $NAME Done"
fi
