cd

source ~/dotfiles/zshuery/zshuery.sh
load_defaults
load_aliases
load_lol_aliases
load_completion ~/dotfiles/zshuery/completion
load_correction

export HISTSIZE=16384
export HISTFILE="$HOME/.zsh_history"
export SAVEHIST=$HISTSIZE

export EDITOR='vim'

export GREP_OPTIONS="--color"

# default key bindings (ctrl-a, ctrl-e, etc.)
bindkey -e

prompts '%{$fg_bold[green]%}$(COLLAPSED_DIR)%{$reset_color%}$(virtualenv_info) %{$fg[yellow]%}$(prompt_char)%{$reset_color%} ' '%{$fg[red]%}$(ruby_version)%{$reset_color%}'

# speed up auto completion
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache

chpwd() {
    update_terminal_cwd
}

alias ls='ls -G'
alias gp='git pull --prune'
alias gs='git status -sb'
alias gc='git commit'
alias ga='git add'
alias gl="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
alias gd='git diff'
alias gco='git checkout'
alias gb='git branch'

# Allow local customizations in ~/.zshrc_local
if [ -f ~/.zshrc_local ]; then
    source ~/.zshrc_local
fi
