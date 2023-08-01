#!/bin/bash

install_local_brew() {
    if ! command -v brew &>/dev/null; then
        echo "Homebrew not found. Installing Homebrew..."
        curl -fsSL https://rawgit.com/kube/42homebrew/master/install.sh | zsh
    else
        echo "Homebrew is already installed."
        echo "Updating Homebrew..."
        brew update
        brew upgrade
    fi
}

install_readline() {
    echo "Installing readline..."
    brew install readline
    brew link readline
}

install_valgrind() {
    echo "Installing valgrind..."
    brew tap LouisBrunner/valgrind
    brew install --HEAD LouisBrunner/valgrind/valgrind
    brew upgrade --fetch-HEAD LouisBrunner/valgrind/valgrind
}

clear

echo "Select an option to install the desired package:"
echo "0 - brew"
echo "1 - readline"
echo "2 - valgrind"
echo "3 - exit"

read -p "Enter your choice: " choice

case $choice in
    0)
        install_local_brew
        ;;

    1)
        install_local_brew
        install_readline
        ;;

    2)
        install_local_brew
        install_valgrind
        ;;

    3)
        echo "Exiting..."
        ;;

    *)
        echo "Invalid choice. Exiting..."
        ;;
esac

echo "Setup complete."
