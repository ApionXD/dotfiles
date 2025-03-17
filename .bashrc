#
# ~/.bashrc
#

# If not running interactively, don't do anything
main() {
    [[ $- != *i* ]] && return
    export PATH=$PATH:$HOME/.local/bin

    declare -a WARNINGS
    ENABLE_BLESH=
    # Set config dir if it isn't already set
    : "${XDG_CONFIG_HOME:=$HOME/.config}"
    # Check for blesh and start initting
    if [ -f $HOME/.local/share/blesh/ble.sh ]; then
        ENABLE_BLESH=1
        . $HOME/.local/share/blesh/ble.sh --noattach
    elif [ -f /usr/share/blesh/ble.sh ]; then
        ENABLE_BLESH=1
        . /usr/share/blesh/ble.sh --noattach
    else
        WARNINGS+=("Ble.sh not found")
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
    if [[ -f /usr/share/bash-completion/bash_completion ]]; then
        . /usr/share/bash-completion/bash_completion
    else
        WARNINGS+=("Bash completion not installed")
    fi

    # Enable suggesting of packages when entering commands not on system
    if [[ -f /usr/share/doc/pkgfile/command-not-found.bash ]]; then
        . /usr/share/doc/pkgfile/command-not-found.bash
    else
        WARNINGS+=("Pkgfile not installed, nonexistent invoked packages won't be suggested")
    fi

    clear

    check_command_installed "neofetch" "Neofetch not installed :("
    [[ $? == 0 ]] && neofetch
    check_command_installed "python3" "Python 3 not found, its likely neovim will not work properly"
    check_command_installed "nvim" "Neovim not installed"
    check_command_installed "fzf" "fzf not installed"
    check_command_installed "rg" "Ripgrep not installed"
    check_command_installed "lazygit" "Lazygit not installed"

    echo $RED
    printf "%s\n" "${WARNINGS[@]}"
    echo $RESET

    if [[ $ENABLE_BLESH == 1 ]]; then
        [[ ! ${BLE_VERSION-} ]] || ble-attach
    fi
}
#Checks if a command is on the path, adds error if not
check_command_installed() {
    local command=$1
    command -v $command >& /dev/null

    if [[ $? != 0 ]]; then
        WARNINGS+=("$2")
    fi
}

main
