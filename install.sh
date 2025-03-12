#!/bin/bash
ln -f $PWD/.bashrc $HOME/.bashrc
ln -f $PWD/.bash_aliases $HOME/.bash_aliases
ln -f $PWD/.bash_profile $HOME/.bash_profile
mkdir -p $HOME/.config/nvim/
ln -f $PWD/.config/nvim/init.lua $HOME/.config/nvim/init.lua
