#!/usr/bin/env bash

set -eu

NAME=rust

if [[ -e .done ]]; then
	echo " $NAME has Installed!"
else
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
	rustup component add rust-src
	curl -L https://github.com/rust-analyzer/rust-analyzer/releases/latest/download/rust-analyzer-x86_64-unknown-linux-gnu.gz | gunzip -c - > $BINS_DIR/rust-analyzer
	chmod a+x $BINS_DIR/rust-analyzer
	touch .done
	echo "Install $NAME Done"
fi
