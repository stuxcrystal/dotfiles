#!/bin/bash

install_pkgs() {
  echo "=> Installing packages"
  DIST="$(cat /etc/*-release | grep ^ID= | tr '=' '\n' | tail --lines=1)"
  case "$DIST" in
    arch)
      sudo pacman -Syu neovim zsh git fzf
      if [ ! -f $(dirname $(which nvim))/vim ]; then
        sudo ln -s $(which nvim) $(dirname $(which nvim))/vim 
      fi
      
      if [ ! -f $(dirname $(which nvim))/vim ]; then
        sudo ln -s $(which nvim) $(dirname $(which nvim))/vi
      fi
      
      if 
      ;;
    ubuntu)
      sudo apt update
      sudo apt upgrade
    
      sudo apt install neovim zsh git fzf
    
      sudo update-alternatives --set editor $(which nvim)
      sudo update-alternatives --set vim $(which nvim)
      sudo update-alternatives --set vi $(which nvim)
      ;;
    *)
      echo Unsupported distribution $DIST
      exit 1
      ;;
  esac
}


install_conf() {
  echo "=> Loading Shell configuration"

  git config --global user.email "stuxcrystal@encode.moe"
  git config --global user.name "StuxCrystal"

  if [ -d $HOME/.dotfiles ]; then
      rm -rf $HOME/.dotfiles
  fi

  git --git-dir=$HOME/.dotfiles --work-tree=$HOME init $HOME
  git --git-dir=$HOME/.dotfiles --work-tree=$HOME remote add origin git@github.com:stuxcrystal/dotfiles
  git --git-dir=$HOME/.dotfiles --work-tree=$HOME config --local status.showUntrackedFiles no
  git --git-dir=$HOME/.dotfiles --work-tree=$HOME pull origin master
  pushd $HOME
  git --git-dir=$HOME/.dotfiles --work-tree=$HOME submodule update --init --recursive
  popd

  sudo chsh -s $(which zsh) $(id -un)
  zsh
}

run() {
  install_pkgs
  install_conf
}

run
