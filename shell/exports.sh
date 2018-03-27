export EDITOR=vim

# Wine
export WINEPREFIX=~/.wine
export WINEARCH=win32

# fzf
export FZF_DEFAULT_COMMAND="rg \
	--files \
	--no-messages \
	--no-ignore \
	--hidden \
	--follow \
	--ignore-case \
	--glob '!{.git,node_modules}/*'"
export FZF_DEFAULT_COLORS='--color=dark,fg:7,fg+:7,bg:0,bg+:8,hl:4,hl+:4,info:8,border:8,prompt:4,pointer:3,marker:3,spinner:8,header:6'
export FZF_DEFAULT_OPTS="$FZF_DEFAULT_COLORS \
	--exact \
	--no-bold \
	--height='40%' \
	--jump-labels='bmvenritusldkfjgh' \
	--bind='ctrl-f:jump-accept'"
export FZF_COMPLETION_TRIGGER='?'
export FZF_COMPLETION_OPTS='--preview="highlight --out-format=xterm256 --style=pablo {} 2>/dev/null || cat {}"'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
vim_fzf () { vim $(fzf); }