#!/bin/bash
sudo apt update
sudo apt upgrade

sudo apt install neovim zsh

sudo update-alternatives --set editor $(which nvim)
sudo update-alternatives --set vim $(which nvim)
sudo update-alternatives --set vi $(which nvim)

git config --global user.email "stuxcrystal@encode.moe"
git config --global user.name "StuxCrystal"

git --git-dir=$HOME/.dotfiles --work-tree=$HOME init $HOME
git --git-dir=$HOME/.dotfiles --work-tree=$HOME remote add origin git@github.com:stuxcrystal/dotfiles
git --git-dir=$HOME/.dotfiles --work-tree=$HOME config --local status.showUntrackedFiles no
git --git-dir=$HOME/.dotfiles --work-tree=$HOME pull origin master
git --git-dir=$HOME/.dotfiles --work-tree=$HOME git submodules update --init --recursive

chsh -s $(which zsh) $(id -un)
zsh
