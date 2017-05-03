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

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/dbettin/Downloads/google-cloud-sdk-151.0.1-linux-x86_64/google-cloud-sdk/path.bash.inc' ]; then source '/home/dbettin/Downloads/google-cloud-sdk-151.0.1-linux-x86_64/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/dbettin/Downloads/google-cloud-sdk-151.0.1-linux-x86_64/google-cloud-sdk/completion.bash.inc' ]; then source '/home/dbettin/Downloads/google-cloud-sdk-151.0.1-linux-x86_64/google-cloud-sdk/completion.bash.inc'; fi

# tmuxp autocompletion
eval "$(_TMUXP_COMPLETE=source tmuxp)"

# kubectl autocompletion
source <(kubectl completion bash)

# fzf and ripgrep setup
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"
