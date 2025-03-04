#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
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
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
    . /usr/share/bash-completion/bash_completion
# Enable suggesting of packages when entering commands not on system
[[ -f /usr/share/doc/pkgfile/command-not-found.bash ]]  && \
    . /usr/share/doc/pkgfile/command-not-found.bash

[[ $(which neofetch) ]] && neofetch
