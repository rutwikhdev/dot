export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="afowler"

plugins=(
	git
	zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

alias nv="nvim"
alias nvi="nvim ~/.config/nvim/init.vim"
alias nvz="nvim ~/.zshrc"
alias gs="git status"
alias gl="git log"
alias gb="git branch"
alias grv="git remote -v"
alias hf="~"
alias nvd="/Users/rutwikwork/push/neovide/target/release/neovide"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export BAT_THEME="TwoDark"

#quoteme /Users/rutwikwork/quotes.txt

# Set typewritten ZSH as a prompt
eval "$(starship init zsh)"

export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES
