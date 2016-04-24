#!/bin/bash

cd "$(dirname "$BASH_SOURCE")" && source 'utils.sh'

setup() {
    local ZSH_SETUP_SCRIPT="../zsh/setup.sh"
    if [ -x "$ZSH_SETUP_SCRIPT" ]; then
        source "$ZSH_SETUP_SCRIPT" || exit 1

        # Check current shell and try to switch to "zsh"
        local CURRENT_SHELL=$(expr "$SHELL" : '.*/\(.*\)')
        if [ ! "$CURRENT_SHELL" = "zsh" ]; then
            echo_ok "Change default shell to zsh..."
            chsh -s $(grep /zsh$ /etc/shells | tail -1)
        fi
    else
        echo_fail "Cannot find zsh setup script"
    fi
}

echo_header 'Configure zsh'

setup
