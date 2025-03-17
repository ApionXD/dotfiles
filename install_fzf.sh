wget -O - https://github.com/junegunn/fzf/releases/download/v0.60.3/fzf-0.60.3-linux_amd64.tar.gz | tar xzf - &&
mkdir -p $HOME/.local/bin &&
install -m 744 fzf $HOME/.local/bin/fzf
rm fzf
