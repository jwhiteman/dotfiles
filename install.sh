#!/bin/bash

# fight the urge to run this script as root.

sudo apt-get update
sudo apt-get -y install vim
sudo apt-get -y install tmux
sudo apt-get -y install git-core
sudo apt-get -y install zsh
sudo apt-get -y install ack-grep

mkdir ~/src
cd src

git clone https://github.com/jwhiteman/dotfiles.git

cd dotfiles

declare -a arr=("ackrc" "gemrc" "irbrc" "tmux.conf" "vimrc")
for i in "${arr[@]}"
do
  cp $i ~/.$i
done

cd ~
mkdir -p ~/.vim/autoload ~/.vim/bundle && curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

cd ~/.vim/bundle
git clone git://github.com/altercation/vim-colors-solarized.git

git clone git://github.com/tpope/vim-fugitive.git
vim -u NONE -c "helptags vim-fugitive/doc" -c q

git clone https://github.com/thoughtbot/vim-rspec.git

git clone git://github.com/tpope/vim-surround.git

git clone https://github.com/kchmck/vim-coffee-script.git ~/.vim/bundle/vim-coffee

# will need your vim compiled w/ ruby support.
# git clone git://git.wincent.com/command-t.git

cd ~
sudo curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh

# some alterations to remind me I'm not local
sed -i 's/robbyrussell/sporty_256/' ~/.zshrc
sed -i 's/background=light/background=dark/' ~/.vimrc
