#!/bin/bash

sudo apt-get update
sudo apt-get -y install vim
sudo apt-get -y install tmux
sudo apt-get -y install git-core
sudo apt-get -y install zsh

mkdir ~/src
cd src

git clone https://github.com/jwhiteman/dotfiles.git

cd dotfiles

declare -a arr=("ackrc" "gemrc" "irbrc" "tmux.conf" "vimrc")
for i in "${arr[@]}"
do
  cp $i ~/.$i
done

curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
echo "consider changing your zsh theme to sporty_256"
