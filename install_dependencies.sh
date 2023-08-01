#!/bin/bash

install_local_brew() {
    if ! command -v brew &>/dev/null; then
        echo "Homebrew not found. Installing Homebrew..."
        curl -fsSL https://rawgit.com/kube/42homebrew/master/install.sh | zsh
    else
        echo "Homebrew is already installed."
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

echo "Checking and installing required packages..."

install_local_brew

echo "Updating Homebrew..."
brew update
brew upgrade

install_readline
install_valgrind

echo "Setup complete."
