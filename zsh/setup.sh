#!/bin/bash

cd "$(dirname "$BASH_SOURCE")"

ZSH_DIR="${ZDOTDIR:-$HOME}"
ZSH_CONFIG_DIR="$ZSH_DIR/.zsh-config"

setup() {
    # Symlink zsh-config dir
    if [ ! -e "$ZSH_CONFIG_DIR" ]; then
        local sourceDir="$(pwd)/config"
        if $(ln -s $sourceDir $ZSH_CONFIG_DIR); then
            echo_ok "$ZSH_CONFIG_DIR -> $sourceDir"
        else
            echo_noaction "$ZSH_CONFIG_DIR already exists"
        fi
    else
        echo_noaction "$ZSH_CONFIG_DIR already exists"
    fi

    # Check and create .zshrc file
    if [ -f "$ZSH_DIR/.zshrc" ] || [ -h "$ZSH_DIR/.zshrc" ]; then
        echo_noaction "Found $ZSH_DIR/.zshrc. Creating a backup copy..."

        local suffix=$(date +"%Y%m%d%H%M%S")
        if $(mv $ZSH_DIR/.zshrc $ZSH_DIR/.zshrc.$suffix); then
            echo_ok "Copy $ZSH_DIR/.zshrc to $ZSH_DIR/.zshrc.$suffix"
        else
            echo_prompt "Failed to create copy of $ZSH_DIR/.zshrc. Continue?"
            if ! confirm; then
                exit 1
            fi
        fi
    fi

    # Create actual .zshrc file
    if $(cp "$(pwd)/zshrc" "$ZSH_DIR/.zshrc"); then
        echo_ok "Create $ZSH_DIR/.zshrc file"
    else
        echo_fail "Create $ZSH_DIR/.zshrc file"
    fi
}

setup
