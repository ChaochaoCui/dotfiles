#!/bin/bash

DOTFILES_PATH=`pwd`
OS_TYPE=`uname`
cd $HOME
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

#git config --global user.name "OSer916"
#git config --global user.email "cuichaochao916@gmail.com"
git config --global core.editor vim
git config --global merge.tool meld
git config --global diff.tool icdiff

ln -s $DOTFILES_PATH/vimrc .vimrc
ln -s $DOTFILES_PATH/bashrc.local .bashrc.local
ln -s $DOTFILES_PATH/gdbinit .gdbinit
ln -s $DOTFILES_PATH/tmux.conf .tmux.conf
ls -s $DOTFILES_PATH/tmux.conf.local .tmux.conf.local


echo "source \$HOME/.bashrc.local" >> $HOME/.bashrc

echo $OS_TYPE
if [[ "$OS_TYPE" == "Linux" ]]; then
    sudo dpkg-reconfigure bash
	sudo apt install -y vim uncrustify gitlint tmux tig tree curl wget
	sudo apt install -y zeal
	sudo apt install -y flameshot lnav icdiff
	sudo apt install -y copyq
fi


# rclone nitroshare

if [[ "$OS_TYPE" == "Darwin" ]]; then
	/bin/bash -c "$(curl -fsSl https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
	brew cask install iterm2
	brew install tree
	brew install tig
	brew install vim
	brew install python3
	brew install icdiff
	brew install cmake
	brew install git
	brew install tmux
	brew install wget
	brew install android-platform-tools
	brew cask install virtualbox
	brew cask install keepassxc
	brew tap homebrew/cask-fonts
	brew cask install font-hack-nerd-font
fi

