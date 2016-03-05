#!/bin/bash

RED='\033[0;31m'                                                                
RED_BOLD='\033[;31m'                                                                
GREEN='\033[0;32m'                                                              
GREEN_BOLD='\033[1;32m'                                                              
YELLOW='\033[0;33m'                                                             
YELLOW_BOLD='\033[1;33m'                                                             
BLUE='\033[0;34m'                                                               
BLUE_BOLD='\033[1;34m'                                                               
NC='\033[0m' # No Color

echo_red() {
    echo -e "${RED}$1${NC}"
}

echo_green() {
    echo -e "${GREEN}$1${NC}"
}

echo_yellow() {
    echo -e "${YELLOW}$1${NC}"
}

echo_blue() {
    echo -e "${BLUE}$1${NC}"
}

echo_ok() {
    echo_green "[+] $1"
}

echo_fail() {
    echo_red "[x] $1"
}

echo_noaction() {
    echo_yellow "[-] $1"
}

echo_header() {
    echo -e "\n${BLUE_BOLD}# $1${NC}\n"
}

