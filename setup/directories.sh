#!/bin/bash

cd "$(dirname "$BASH_SOURCE")" && source 'utils.sh'

declare -a DIRS=(
    "$HOME/bin"
    "$HOME/Projects"
)

setup() {
    for dir in ${DIRS[@]}; do
        if [ -e "$dir" ]; then
            if [ ! -d "$dir" ]; then
                echo_fail "$dir - a file with the same name exists"
            else
                echo_noaction "$dir - already exists"
            fi
        else
            if $(mkdir -p "$dir"); then
                echo_ok "$dir - successfully created"
            else
                echo_fail "$dir - failed to create"
            fi
        fi
    done
}

echo_header 'Create directories'

setup
