
# Stops config if this terminal is non-interactive
[[ -z "$PS1" ]] && return

# Settings
source ~/.shell/settings.zsh

# Custom prompt
source ~/.shell/prompt.zsh

# Bootstrap
source ~/.shell/bootstrap.sh

# Check for antigen and install if not
if [ ! -f "$HOME/antigen.zsh" ] 
then
    echo "Antigen not installed. Pulling." 
    curl -L git.io/antigen > $HOME/antigen.zsh
fi

# Source antigenrc
[[ -f ~/.antigenrc ]] && . ~/.antigenrc

# External settings
source ~/.shell/external.sh

# Exports
source ~/.shell/exports.sh

# Aliases
source ~/.shell/aliases.sh

# Functions
source ~/.shell/functions.sh

# Allow local customizations in the ~/.shell_local_after file
if [ -f ~/.shell_local_after ]; then
    source ~/.shell_local_after
fi

# Allow local customizations in the ~/.zshrc_local_after file
if [ -f ~/.zshrc_local_after ]; then
    source ~/.zshrc_local_after
fi

# fzf completions
[[ -f ~/.fzf.zsh ]] && . ~/.fzf.zsh

# Autostart X at login, make sure to point xinitrc to correct window manager
#if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
#  exec startx
#fi

