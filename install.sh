#!/bin/sh
set -e

rm -rf ~/.zshrc ~/.bashrc
rm -rf ~/.local/share/code-server/User/settings.json

stow -v -R -t ~ . 

echo "Dotfiles stowed successfully!"