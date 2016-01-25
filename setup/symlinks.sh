#!/bin/bash

cd "$(dirname "$BASH_SOURCE")" 

RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
NC='\033[0m' # No Color

declare -a SYMLINKS=(
    'vim/vimrc'
)

setup() {
	local i=''
	local sourceFile=''
	local targetFile=''

	for i in ${SYMLINKS[0]}; do
		sourceFile="$(pwd)/$i"
		targetFile="$HOME/.$(echo "%s" "$i" | sed "s/.*\/\(.*\)/\1/g")"
		
		if [ ! -e "$targetFile" ]; then
			if $(ln -s $sourceFile $targetFile); then
				echo -e "${GREEN}[+] $targetFile -> $sourceFile" 
			else
				echo -e "${RED}[x] $targetFile -> $sourceFile"
			fi 
		else
			echo -e "${YELLOW}[-] $targetFile already exists"
		fi
	done
}

echo -e "${BLUE}Create symlinks${NC}\n"

setup

