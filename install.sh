#!/usr/bin/env bash

# An automated script to install and configure neovim
# with my neovim dotfiles (nvimdots)

# Colors
Color_Off='\033[0m'
Black='\033[0;30m'
Red='\033[0;31m'
Green='\033[0;32m'
Yellow='\033[0;33m'
Blue='\033[0;34m'
Purple='\033[0;35m'
Cyan='\033[0;36m'
White='\033[0;37m'

# Variables
PACKER_GIT_REPO="https://github.com/wbthomason/packer.nvim"
PACKER_INSTALLATION_PATH="${HOME}/.local/share/nvim/site/pack/packer/start/packer.nvim"
NVIM_CONFIG_INSTALL_DIR="$HOME/.config/nvim"
NVIMDOTS_GIT_REPO="https://github.com/hxdevlover/nvimdots.git"

#INSTALLED_NEOVIM_VERSION=$(nvim --version | sed -n "1p" | grep -Eo "[0-9]+(\.[0-9]+)+")
INSTALLED_NEOVIM_VERSION=$(nvim --version | sed -n "1p" | grep -Eo "[0-9]+(\.[0-9]+)+" | grep -Eo "\.[0-9]\.[0-9]" | grep -Eo "[0-9]\.[0-9]")
MIN_NEOVIM_VERSION="8.0" # 0.8.0
NEOVIM_OLD_CONFIGS_BACKUP_DIR="${HOME}/nvimbak/"

# printing status
OK="${Green}[OK]"
ERROR="${Red}[ERROR]"
INFO="${Yellow}[INFO]"

source "/etc/os-release"

#print OK
function print_ok() {
    echo -e "${OK} $1 ${Color_Off}"
}

#print ERROR
function print_error() {
    echo -e "${ERROR} $1 ${Color_Off}"
}

#print INFO
function print_info() {
    echo -e "${INFO} $1 ${Color_Off}"
}


# check root.
function check_root() {
    if [[ $EUID -eq 0 ]]; then
        print_error "Do not run this script as root"
        exit 1
    fi
}


# check each command's status code
function judge() {
    if [[ 0 -eq $? ]]; then
        print_ok "$1 Finished"
        $SLEEP
    else
        print_error "$1 Failed"
        exit 1
    fi
}


function compare_version() {
    if [[ $1 == $2 ]]
    then
        return 0
    fi

    local IFS=.
    local i ver1=($1) ver2=($2)
    # fill empty fields in ver1 with zeros
    for ((i=${#ver1[@]}; i<${#ver2[@]}; i++)); do
        ver1[i]=0
    done
    for ((i=0; i<${#ver1[@]}; i++)); do
        if [[ -z ${ver2[i]} ]]; then
            # fill empty fields in ver2 with zeros
            ver2[i]=0
        fi

        if ((10#${ver1[i]} > 10#${ver2[i]})); then
            return 1
        fi

        if ((10#${ver1[i]} < 10#${ver2[i]})); then
            return 2
        fi
    done
    return 0
}


function check_neovim_version() {
    compare_result=$(compare_version ${INSTALLED_NEOVIM_VERSION} ${MIN_NEOVIM_VERSION})
    if [[ $compare_result -eq 1 || $compare_result -eq 0 ]]; then
        print_ok "Neovim version: ${INSTALLED_NEOVIM_VERSION}"
    else
        print_error "Your Neovim version is too old!"
        print_info "Min Neovim version to install nvimdots: 0.8.0"
    fi
}

function package_manager() {
    if [[ ${ID} == "debian" || ${ID} == "ubuntu" ]]; then
        INSTALL="sudo apt install -y"
    elif [[ ${ID} == "fedora" ]]; then
        INSTALL="sudo dnf install -y"
    elif [[ ${ID} == "arch" ]]; then
        INSTALL="sudo pacman -Sy --no-confirm"
    fi
}

function install_dependencies() {
    ${INSTALL} git curl
    judge "Install git curl"

    if [[ ${ID} == "debian" || ${ID} == "ubuntu" ]]; then
        ${INSTALL} build-essential
        judge "Install build-essential"
    elif [[ ${ID} == "arch" ]]; then
        ${INSTALL} base-devel
        judge "Install base-devel"
    fi
}


function install_packer() {
    git clone --depth 1 ${PACKER_GIT_REPO} ${PACKER_INSTALLATION_PATH}
    judge "Install packer plugin manager"
}

function install_nvimdots() {
    mv ${HOME}/.config/nvim ${NEOVIM_OLD_CONFIGS_BACKUP_DIR} >/dev/null 2>&1

    git clone --depth 1  ${NVIMDOTS_GIT_REPO} ${NVIM_CONFIG_INSTALL_DIR}
    judge "Install nvimdots"
}


check_root
check_neovim_version
package_manager
install_dependencies
install_packer
install_nvimdots

