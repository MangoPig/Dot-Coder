#  .zshrc

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

PROMPT="%B%~%b :: "
RPROMPT="%n@%m"

# Plugins
plugins=(
    git
    zsh-syntax-highlighting
    zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# Add to PATH
export PATH="$HOME/.local/bin:$PATH"


# GVM
[[ -s "/home/mangopig/.gvm/scripts/gvm" ]] && source "/home/mangopig/.gvm/scripts/gvm"

# Golang
# Ensure Go binary is in PATH
export GOROOT=/usr/local/go
export GOPATH=$HOME/Programming/go
export GOBIN=$GOPATH/bin

# Set PATH correctly
export PATH=$GOROOT/bin:$GOBIN:$GOPATH/bin:$PATH

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Zoxide
eval "$(zoxide init --cmd cd zsh)"

# Source the aliases file
source ~/.zsh_aliases

# Source Secrets
source ~/.zsh_secrets

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/mangopig/Programming/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/mangopig/Programming/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/mangopig/Programming/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/mangopig/Programming/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# Get the GID of the docker socket
if [ -S /var/run/docker.sock ]; then
    DOCKER_GID=$(stat -c '%g' /var/run/docker.sock)
    
    # Check if we are physically in the group file (added by startup script)
    # BUT not in the current shell session
    if grep -q ":$DOCKER_GID:" /etc/group && ! id -G | grep -qw "$DOCKER_GID"; then
        # Get the group name associated with that GID
        DOCKER_GROUP=$(getent group "$DOCKER_GID" | cut -d: -f1)
        
        # Replace the current shell with a new one that has the group loaded
        exec newgrp "$DOCKER_GROUP"
    fi
fi