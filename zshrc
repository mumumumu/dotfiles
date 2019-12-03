bindkey -e  # emacs mode key bindings

## Profiling
zmodload zsh/zprof  
profile_zsh_init () {
    for i in $(seq 1 10); do /usr/bin/time /usr/local/bin/zsh -i -c exit; done;
}

## Modules
autoload -Uz compinit && compinit

## Extra Scripts
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh  # https://github.com/junegunn/fzf
[ -f ~/.git-prompt.sh ] && source ~/.git-prompt.sh  # https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh

## Options
setopt auto_cd         # change directories without typing cd
setopt prompt_subst    # prompt string is first subjected to parameter expansion, command substitution and arithmetic expansion
setopt append_history  # allow multiple terminal sessions to all append to one zsh command history

## Environment
cdpath=($HOME/projects $HOME)
export EDITOR=nvim
export PATH=/usr/local/bin:$PATH

## History Settings
export HISTSIZE=10000
export HISTFILE=$HOME/.zsh_history
export SAVEHIST=$HISTSIZE
setopt EXTENDED_HISTORY      # record command time and duration
setopt HIST_FIND_NO_DUPS     # do not find duplicates in history
setopt HIST_IGNORE_ALL_DUPS  # remove older duplicate commands
setopt HIST_REDUCE_BLANKS    # leave blanks out
setopt INC_APPEND_HISTORY    # write after each command

## Aliases
alias ls='ls -G'
alias v='nvim'
alias -s {csv,js,json,jsx,py,ts,tsx,txt,yml}=nvim

alias config.alacritty='v ~/.config/alacritty/alacritty.yml'
alias config.git='git config --global -e'
alias config.vim='v ~/.config/nvim/init.vim'
alias config.zsh.local.reload='. ~/.zshrc_local'
alias config.zsh.local='v ~/.zshrc_local'
alias config.zsh.reload='. ~/.zshrc'
alias config.zsh='v ~/.zshrc'

alias ga='git add'
alias gb='git branch'
alias gbd='git branch -D'
alias gc='git commit'
alias gco='git checkout'
alias gcob='git checkout -b'
alias gcom='git checkout master'
alias gd='git diff -w'
alias gdc='git diff -w --cached'
alias gl="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
alias gp='git pull --prune'
alias gpdo='git push --delete origin'
alias gpom='git pull origin master'
alias gs='git status -sb'
alias gsl='git stash list'
alias gsp='git stash pop'
alias gst='git stash'

## Prompt String
PS1=' %F{yellow}%~%F{blue}$(__git_ps1) %F{reset}$ '

## Completion
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache

## Startup
[ -f ~/.zshrc_local ] && source ~/.zshrc_local

if command -v tmux &> /dev/null &&  # tmux is installed
  [ -n "$PS1" ] &&                  # in interactive shell
  [ -z "$TMUX" ]; then              # not in tmux session
    tmux attach || exec tmux new-session
fi
