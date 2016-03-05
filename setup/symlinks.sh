#!/bin/bash

cd "$(dirname "$BASH_SOURCE")" && source 'utils.sh' 

declare -a SYMLINKS=(
    'vim/vimrc'
)

setup() {
	local i=''
	local sourceFile=''
	local targetFile=''

	for i in ${SYMLINKS[@]}; do
		sourceFile="$(pwd)/$i"
		targetFile="$HOME/.$(echo "%s" "$i" | sed "s/.*\/\(.*\)/\1/g")"
		
		if [ ! -e "$targetFile" ]; then
			if $(ln -s $sourceFile $targetFile); then
				echo_ok "$targetFile -> $sourceFile" 
			else
				echo_fail "$targetFile -> $sourceFile"
			fi 
		else
			echo_noaction "$targetFile already exists"
		fi
	done
}

echo_header 'Create symlinks'

setup

