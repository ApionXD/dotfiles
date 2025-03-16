command -v lsd >& /dev/null
if [[ $? != 0 ]]; then
    alias ls='lsd'
fi
alias grep='grep --color=auto'
command -v rgrep >& /dev/null
if [[ $? == 0 ]]; then
    alias rgrep='grep --color=auto --recursive'
fi

