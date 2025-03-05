#!/bin/bash
ln -f $PWD/.bashrc $HOME/.bashrc
ln -f $PWD/.bash_aliases $HOME/.bash_aliases
ln -f $PWD/.bash_profile $HOME/.bash_profile
ln -f $PWD/.inputrc $HOME/.inputrc
wget -O - https://github.com/akinomyoga/ble.sh/releases/download/nightly/ble-nightly.tar.xz | tar xJf -
bash ble-nightly/ble.sh --install ~/.local/share
rm -rf ble-nightly
