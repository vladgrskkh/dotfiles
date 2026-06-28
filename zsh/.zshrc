export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"
export XDG_CONFIG_HOME="$HOME/.config/" 

export EDITOR=nvim
export VISUAL=nvim

# FZF conf
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"
export FZF_DEFAULT_OPTS="--height 50% --layout=default --border --color=hl:#2dd4bf"
# Setup fzf previews
export FZF_CTRL_T_OPTS="--preview 'bat --color=always -n --line-range :500 {}'"
export FZF_ALT_C_OPTS="--preview 'eza --icons=always --tree --color=always {} | head -200'"
# fzf preview for tmux
export FZF_TMUX_OPTS=" -p90%,70% "

export ZSH="$HOME/.oh-my-zsh"

plugins=(
    git 
    docker
    docker-compose
    kubectl
    golang
    # zsh-autosuggestions 
    fast-syntax-highlighting 
    direnv
)

source $ZSH/oh-my-zsh.sh

fastfetch -c neofetch

## evals
eval "$(gdircolors)"
eval "$(starship init zsh)"
eval $(keychain --eval id_ed25519) # ssh-agent

eval "$(zoxide init zsh)"
eval "$(fzf --zsh)" # Set up fzf key bindings and fuzzy completion

## alias
alias v="nvim"
alias lg="lazygit"

export PYTHONPATH="${PYTHONPATH}:/Users/peshka/alg"
export PATH="/usr/local/opt/python/libexec/bin:$PATH"
export PATH="/opt/homebrew/opt/postgresql@18/bin:$PATH"
export PATH=$PATH:/opt/homebrew/bin/go
export PATH="$PATH:$(go env GOPATH)/bin"

# Created by `pipx` on 2025-12-20 19:11:19
export PATH="$PATH:/Users/peshka/.local/bin"
export HOMEBREW_NO_ENV_HINTS=1
