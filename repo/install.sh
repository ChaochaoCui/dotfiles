#!/usr/bin/env bash

set -eu

NAME=repo

if [[ -e .done ]]; then
	echo " $NAME has Installed!"
else
	curl https://mirrors.tuna.tsinghua.edu.cn/git/git-repo -o $BINS_DIR/repo
	chmod a+x $BINS_DIR/repo
	echo "export REPO_URL='https://mirrors.tuna.tsinghua.edu.cn/git/git-repo'" >> ~/.bashrc
	touch .done
	echo "Install $NAME Done"
fi
