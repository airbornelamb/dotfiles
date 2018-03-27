
# Update path
PATH=~/.dotfiles/bin:${PATH}

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes fzf and ripgrep bin if it exists
if [ -d "$HOME/.fzf/bin" ] ; then
    PATH="$HOME/.fzf/bin:$PATH"
fi

# CHECK DEPENDENCIES BLOCK

command -v wget >/dev/null 2>&1 || { echo "I require wget but it's not installed." >&2; }
command -v curl >/dev/null 2>&1 || { echo "I require curl but it's not installed." >&2; }
command -v git >/dev/null 2>&1 || { echo "I require git but it's not installed." >&2; }