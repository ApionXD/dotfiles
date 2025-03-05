#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

declare -a WARNINGS
ENABLE_BLESH=
: "${XDG_CONFIG_HOME:=$HOME/.config}"
if test -f $HOME/.local/share/blesh/ble.sh; then
    ENABLE_BLESH=1
    . $HOME/.local/share/blesh/ble.sh --noattach
else
    WARNINGS+="Ble.sh not found"
fi

# Add aliases
[[ -f ~/.bash_aliases ]] && . ~/.bash_aliases

[[ -f $XDG_CONFIG_HOME/.bashrc_local ]] && . $XDG_CONFIG_HOME/.bashrc_local
# Set prompt
BLUE="$(tput setaf 39)"
RED="$(tput setaf 160)"
RESET="$(tput sgr0)"
PS1='[${BLUE}\u@\h ${RED}\w${RESET}]\$ '

EDITOR=vim
set -o vi

# Use bash-completion, if available
if test -f /usr/share/bash-completion/bash_completion; then
    . /usr/share/bash-completion/bash_completion
#else
    #WARNINGS+="Bash completion not installed"
fi

# Enable suggesting of packages when entering commands not on system
if test -f /usr/share/doc/pkgfile/command-not-found.bash; then
    . /usr/share/doc/pkgfile/command-not-found.bash
#else
    #WARNINGS+="Pkgfile not installed, nonexistent invoked packages won't be suggested"
fi

clear
which neofetch >& /dev/null
[[ $? == 0 ]] && neofetch

echo $RED
echo $WARNINGS
echo $RESET

if [[ $ENABLE_BLESH == 1 ]]; then
    [[ ! ${BLE_VERSION-} ]] || ble-attach
fi
