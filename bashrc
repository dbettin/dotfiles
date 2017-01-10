# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# bash-prompt
# https://github.com/magicmonty/bash-git-prompt
############
GTT_PROMPT_ONLY_IN_REPO=1
source ~/.bash-git-prompt/gitprompt.sh

# aliases
########
alias ll='ls -alh'
alias la='ls -A'
alias l='ls -CFlh'
alias lsd="ls -alF | grep /$"

# node
export NVM_DIR="/home/dbettin/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# rust
[ -s "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"
