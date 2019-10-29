#!/bin/sh

DOTFILES_PATH=`pwd`
cd $HOME
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

git config --global user.name "OSer916"
git config --global user.email "cuichaochao916@gmail.com"
git config --global core.editor vim
git config --global merge.tool meld

ln -s $DOTFILES_PATH/vimrc .vimrc
ln -s $DOTFILES_PAH/bashrc.local .bashrc.local

echo "source .bashrc.local" >> $HOME/.bashrc

sudo apt install -y vim uncrustify gitlint

