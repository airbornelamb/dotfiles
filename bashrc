# Settings
source ~/.shell/settings.bash

# Custom prompt
source ~/.shell/prompt.bash

# Bootstrap
source ~/.shell/bootstrap.sh

# External settings
source ~/.shell/external.sh

# Aliases
source ~/.shell/aliases.sh

# Functions
source ~/.shell/functions.sh

# Exports
source ~/.shell/exports.sh

# Allow local customizations in the ~/.shell_local_after file
if [ -f ~/.shell_local_after ]; then
    source ~/.shell_local_after
fi

# Allow local customizations in the ~/.bashrc_local_after file
if [ -f ~/.bashrc_local_after ]; then
    source ~/.bashrc_local_after
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
