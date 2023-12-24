export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="cypher"
plugins=(
    git
    zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

alias nv="nvim"
alias nvi="nvim ~/.config/nvim/"
alias work="cd ~/code/bench-press/apps/press"
alias notes="nv ~/notes"
alias alacritty="__NV_PRIME_RENDER_OFFLOAD=1 __GLX_VENDOR_LIBRARY_NAME=nvidia alacritty"

function sf {
    if [ -n "$1" ]; then
        cmd="ssh frappe@frappe.cloud -t 'ssh root@$1.frappe.cloud'"
    else
        cmd="ssh frappe@frappe.cloud"
    fi
    echo $cmd
    eval $cmd
}

export PATH="$PATH:/home/razorquest/.local/bin/"
export FZF_DEFAULT_OPTS="--ansi --preview-window 'top:60%' --layout reverse"


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

if [ -e /home/razorquest/.nix-profile/etc/profile.d/nix.sh ]; then . /home/razorquest/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

export PATH=$PATH:/usr/local/go/bin

export OBSIDIAN_USE_WAYLAND=1
export MOZ_ENABLE_WAYLAND=1

#eval "$(starship init zsh)"
