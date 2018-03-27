# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

HISTSIZE=1048576
HISTFILE="$HOME/.bash_history"
SAVEHIST=$HISTSIZE
# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac