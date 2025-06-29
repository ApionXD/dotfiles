#!/bin/bash
ln -f $PWD/.bashrc $HOME/.bashrc
ln -f $PWD/.bash_aliases $HOME/.bash_aliases
ln -f $PWD/.bash_profile $HOME/.bash_profile
ln -f $PWD/.blerc $HOME/.blerc
mkdir -p $HOME/.config/
ln -s $PWD/.config/nvim $HOME/.config/nvim
echo "Dotfiles installed"
