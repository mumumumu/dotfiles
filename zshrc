source ~/dotfiles/zshuery/zshuery.sh
load_defaults
load_aliases
load_lol_aliases
load_completion ~/dotfiles/zshuery/completion
load_correction

prompts '%{$fg_bold[green]%}$(COLLAPSED_DIR)%{$reset_color%}$(virtualenv_info) %{$fg[yellow]%}$(prompt_char)%{$reset_color%} ' '%{$fg[red]%}$(ruby_version)%{$reset_color%}'

export EDITOR='vim'

chpwd() {
    update_terminal_cwd
}

# For VirtualEnv and mysql in your dev env
source /usr/local/bin/virtualenvwrapper.sh

source .sp_env_setup_script
