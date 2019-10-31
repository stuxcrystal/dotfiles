#!/bin/bash
sudo apt update
sudo apt upgrade

sudo apt install neovim zsh

sudo update-alternatives --set editor $(which nvim)
sudo update-alternatives --set vim $(which nvim)
sudo update-alternatives --set vi $(which nvim)

git config --global user.email "stuxcrystal@encode.moe"
git config --global user.name "StuxCrystal"

git --git-dir=/home/netzschr/.dotfiles --work-tree=/home/netzschr init /home/netzschr
git --git-dir=/home/netzschr/.dotfiles --work-tree=/home/netzschr remote add origin git@github.com:stuxcrystal/dotfiles
git --git-dir=/home/netzschr/.dotfiles --work-tree=/home/netzschr config --local status.showUntrackedFiles no
git --git-dir=/home/netzschr/.dotfiles --work-tree=/home/netzschr pull origin master
git --git-dir=/home/netzschr/.dotfiles --work-tree=/home/netzschr git submodules update --init --recursive

chsh -s $(which zsh) $(id -un)
zsh
