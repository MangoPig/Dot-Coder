#!/bin/sh
set -e

rm -rf ~/.zshrc ~/.bashrc
rm -rf ~/.local/share/code-server/User/settings.json

stow -v -R . 

# Optional: Print success
echo "Dotfiles stowed successfully!"