#!/usr/bin/bash
sudo update-alternatives --set vim $(which nvim) 
sudo update-alternatives --set editor $(which nvim)
sudo chsh -s $(which zsh) $(whoami)
