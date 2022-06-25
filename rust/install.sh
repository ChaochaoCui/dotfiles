#!/usr/bin/env bash

set -eu

NAME=rust

if [[ -e .done ]]; then
	echo " $NAME has Installed!"
else
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
	touch .done
	echo "Install $NAME Done"
fi
