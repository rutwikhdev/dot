# Path to your oh-my-zsh installation.
export ZSH="/home/centauri/.oh-my-zsh"

# Prompt
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats '%F{green}  %b'
setopt PROMPT_SUBST
PROMPT='%F{red}%1~%f %F{cyan}%f ${vcs_info_msg_0_} %F{white}'

# .oh-my-zsh
source $ZSH/oh-my-zsh.sh
plugins=(
	git
	zsh-autosuggestion
)

# Aliases
alias nv="nvim"
alias nvi="nvim ~/.config/nvim/init.vim"
alias nvz="nvim ~/.zshrc"
alias gs="git status"
alias gl="git log"
alias gb="git branch"
alias grv="git remote -v"
alias hf="~"

export PATH="/usr/local/sbin:$PATH"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
