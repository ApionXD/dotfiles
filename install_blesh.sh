ln -f $PWD/.blerc $HOME/.blerc
wget -O - https://github.com/akinomyoga/ble.sh/releases/download/nightly/ble-nightly.tar.xz | tar xJf - && 
bash ble-nightly/ble.sh --install ~/.local/share &&
rm -rf ble-nightly
wget -O - https://github.com/junegunn/fzf/releases/download/v0.60.3/fzf-0.60.3-linux_amd64.tar.gz | tar xzf - &&
mkdir -p $HOME/.local/bin &&
install -m 744 fzf $HOME/.local/bin/fzf
rm fzf
