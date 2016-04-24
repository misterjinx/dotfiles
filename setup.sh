#!/bin/bash

cd "$(dirname "$BASH_SOURCE")"

./setup/directories.sh
./setup/symlinks.sh
./setup/shell.sh

echo -e ""
