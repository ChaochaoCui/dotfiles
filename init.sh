#!/bin/sh

DOTFILES_PATH=`pwd`
cd $HOME
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

git config --global user.name "OSer"
git config --global user.email "cuichaochao916@gmail.com"
git config --global core.editor vim
git config --global merge.tool meld

ln -s $DOTFILES_PATH/vimrc .vimrc

echo "source .basrc.local" >> $HOME/.bashrc
ln -s $DOTFILES_PATH/bashrc.local

