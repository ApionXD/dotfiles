#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

WARNINGS=
ENABLE_BLESH=false
if test -f $XDG_CONFIG_HOME/blesh/ble.sh; then
    ENABLE_BLESH=true
    . $XDG_CONFIG_HOME/blesh/ble.sh --noattach
else
    WARNINGS+="Ble.sh not found"
fi

# Add aliases
[[ -f ~/.bash_aliases ]] && . ~/.bash_aliases

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
else 
    WARNINGS+="Bash completion not installed"
fi

# Enable suggesting of packages when entering commands not on system
if test -f /usr/share/doc/pkgfile/command-not-found.bash; then
    . /usr/share/doc/pkgfile/command-not-found.bash
else
    WARNINGS+="Pkgfile not installed, nonexistent invoked packages won't be suggested"
fi

if [$ENABLE_BLESH = true]; then
    [[ ! ${BLE_VERSION-} ]] || ble-attach
fi

[[ $(which neofetch) ]] && neofetch
echo $RED$WARNINGS$RESET
