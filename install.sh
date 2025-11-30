#!/bin/sh
set -e

sudo rm -rf ~/.local/share/code-server/User
mkdir -p ~/.local/share/code-server/User

sudo rm -rf ~/.zshrc

stow . 

# Optional: Print success
echo "Dotfiles stowed successfully!"