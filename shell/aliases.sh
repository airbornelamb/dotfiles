# Credits to https://github.com/kutsan/dotfiles/

alias more=less
alias :q='exit'
alias l="exa --all --long --color=always --group-directories-first" #use exa for directory listing
alias mkdir='mkdir --parents' # Make parent directories as needed.
alias du='du --max-depth=1 --si' # Display size of files and folders under current directory.
alias df='df -h --print-type' # Disk usage with FS types
alias f='fzf --preview "head -100 {}"'
alias fo='nohup xdg-open "$PWD" &' # Open current directory onto GUI file browser.
alias path="echo $PATH | cut --delimiter=':' --fields=1- --output-delimiter=$'\n'"
alias journal="$EDITOR ~/Sync/journal/"$(date +"%Y-%m-%d")".txt"

alias myip="curl ifconfig.co" # other options are ipinfo.io or checkip.amazonaws.com
alias myipfull="curl ifconfig.co/json"

alias clbin="curl -F 'clbin=<-' https://clbin.com"
alias wttr='curl wttr.in/49418'
alias todo="$EDITOR ~/Sync/todo/todo.txt"
alias removechars='sed "s,\x1B\[[0-9;]*[a-zA-Z],,g"'
alias darn='sudo $(history -p \!\!)'
alias listgroups='cut -d: -f1 /etc/group'

alias sysenabled="systemctl list-unit-files --state=enabled"
alias sysrunning="systemctl list-units --type=service --state=running"

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

## Refresh font cache
alias font-refresh="fc-cache -fv"

## git clone depth 1, who needs to clone full repository if you can clone the top layer only
alias clone="git clone --depth 1"

## merge Xresources, useful for urxvt & rofi theming
alias mergex="xrdb ~/.Xresources"

# Mirror a website
alias mirrorsite='wget -m -k -K -E -e robots=off'

alias search="rg \
	--color='always' \
	--heading \
	--line-number \
	--no-messages \
	--no-ignore \
	--hidden \
	--follow \
	--smart-case \
	--glob '!{.git/*,node_modules/*,$(basename $HISTFILE)}' \
	--regexp"
