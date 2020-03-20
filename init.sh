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
ln -s $DOTFILES_PATH/tmux.conf.local .tmux.conf.local


echo "source \$HOME/.bashrc.local" >> $HOME/.bashrc

echo $OS_TYPE
if [[ "$OS_TYPE" == "Linux" ]]; then
    sudo dpkg-reconfigure bash
	sudo apt install -y vim uncrustify gitlint tmux tig tree curl wget
	sudo apt install -y zeal
	sudo apt install -y flameshot lnav icdiff
	sudo apt install -y copyq adb
    sudo apt install -y python3-pip python-pip
    sudo apt install -y python3-tk
    pip2 install -i https://pypi.tuna.tsinghua.edu.cn/simple pip -U
    pip3 install -i https://pypi.tuna.tsinghua.edu.cn/simple pip -U
    pip2 config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple
    pip3 config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple
    sudo apt install -y ibus-rime
    sudo apt install -y net-tools # ifconfig
    sudo apt install -y lnav

    sudo apt install -y openjdk-8-jdk lib32z-dev m4 libxml2-utils
    sudo apt install -y flex
    sudo apt install -y p7zip-full

    sudo apt install -y scratch 

    sudo apt install -y npm
    sudo npm install picgo -g

    sudo apt install -y jq shellcheck yapf ccache cloc

    sudo apt install protobuf-compiler

    if [ ! -d "$HOME/.local/share/fonts" ]; then
        mkdir -p ~/.local/share/fonts/
        wget -c https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/SourceCodePro.zip /tmp/
        unzip /tmp/SourceCodePro.zip -d ~/.local/share/fonts/
        fc-cache -f -v
    fi

    sudo add-apt-repository ppa:phoerious/keepassxc -y
    sudo apt install keepassxc -y
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
	brew cask install font-sourcecodepro-nerd-font
    brew install lnav
fi

