#!/bin/sh
set -e

# "stow ." tells stow to symlink everything in the current folder 
# to the parent directory (Home), respecting existing folder structures.
stow . 

# Optional: Print success
echo "Dotfiles stowed successfully!"