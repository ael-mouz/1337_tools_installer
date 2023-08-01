#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BOLD='\033[1m'
RESET='\033[0m'

print_error() {
    echo -e "${RED}${BOLD}Error:${RESET} $1"
}

print_success() {
    echo -e "${GREEN}${BOLD}Success:${RESET} $1"
}

install_local_brew() {
    clear
    if ! command -v brew &>/dev/null; then
        echo -e "${YELLOW}${BOLD}Homebrew not found. Installing Homebrew...${RESET}"
        if ! curl -fsSL https://rawgit.com/kube/42homebrew/master/install.sh | zsh; then
            print_error "Failed to install Homebrew."
            exit 1
        fi
    else
        echo -e "${GREEN}${BOLD}Homebrew is already installed.${RESET}"
        echo -e "${YELLOW}${BOLD}Updating Homebrew...${RESET}"
        if ! brew update; then
            print_error "Failed to update Homebrew."
            exit 1
        fi
        if ! brew upgrade; then
            print_error "Failed to upgrade Homebrew packages."
            exit 1
        fi
    fi
}

install_readline() {
    echo -e "${YELLOW}${BOLD}Installing readline...${RESET}"
    if ! brew install readline; then
        print_error "Failed to install readline."
        exit 1
    fi
    if ! brew link readline; then
        print_error "Failed to link readline."
        exit 1
    fi
    print_success "Readline installed successfully."
}

install_valgrind() {
    echo -e "${YELLOW}${BOLD}Installing valgrind...${RESET}"
    if ! brew tap LouisBrunner/valgrind; then
        print_error "Failed to tap LouisBrunner/valgrind."
        exit 1
    fi
    if ! brew install --HEAD LouisBrunner/valgrind/valgrind; then
        print_error "Failed to install valgrind."
        exit 1
    fi
    if ! brew upgrade --fetch-HEAD LouisBrunner/valgrind/valgrind; then
        print_error "Failed to upgrade valgrind."
        exit 1
    fi
    print_success "Valgrind installed successfully."
}

while true; do
    clear
    echo -e "${BOLD}Select an option to install the desired package:${RESET}"
    echo -e " ${BOLD}[0]${RESET} - ${GREEN}Homebrew${RESET}"
    echo -e " ${BOLD}[1]${RESET} - ${GREEN}Readline${RESET}"
    echo -e " ${BOLD}[2]${RESET} - ${GREEN}Valgrind${RESET}"
    echo -e " ${BOLD}[3]${RESET} - ${RED}Exit${RESET}"

    read -p "Enter your choice: " choice

    case $choice in
    0)
        install_local_brew
        echo -e "${GREEN}${BOLD}Setup complete.${RESET}"
        break
        ;;

    1)
        install_local_brew
        install_readline
        echo -e "${GREEN}${BOLD}Setup complete.${RESET}"
        break
        ;;

    2)
        install_local_brew
        install_valgrind
        echo -e "${GREEN}${BOLD}Setup complete.${RESET}"
        break
        ;;

    3)
        echo -e "${RED}${BOLD}Exiting...${RESET}"
        exit 0
        ;;

    *)
        print_error "Invalid choice. Please try again."
        sleep 1
        ;;
    esac
done
