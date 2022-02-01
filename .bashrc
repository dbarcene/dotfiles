#!/bin/bash
# File              : .bashrc
# Author            : David Barcene <david.barcene@utp.ac.pa>
# Date              : 25.01.2022
# Last Modified Date: 01.02.2022
# Last Modified By  : David Barcene <david.barcene@utp.ac.pa>

# ---------------------------------------------------------------------------- #
# source global definitions
# ---------------------------------------------------------------------------- #
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# User specific environment
PATH="$HOME/.local/bin:$HOME/bin:$PATH"
export PATH

setxkbmap -option caps:swapescape

# picom &
# Uncomment the following line if you don't like systemctls auto-paging feature:
# export SYSTEMD_PAGER=

# set -o vi	# Vi mode

# Run Tmux on startup
if command -v tmux &> /dev/null && [ -z "$TMUX"  ]; then
	    tmux attach -t default || tmux new -s default
fi

# ============================================================================ #
#
# ALIASES AND FUNCTIONS 
#
# ============================================================================ #

#New cd
function cd() {
	new_directory="$*";
	if [ $# -eq 0 ]; then
		new_directory=${HOME};
	fi;
	builtin cd "${new_directory}" && ls -lv --color --group-directories-first
}

s () {
	if [[ "x$1" != "x" ]]
	then
		alias $1="cd $PWD;pwd"
		echo "alias $1=\"cd $PWD;pwd\""
	else
		echo "Usage: s[s] <directory bookmark name>"
		return 1
	fi
}

alias df='df -h'            #  Prints available space in partitions
alias cp='cp -iv'
alias mv='mv -iv'

alias nv='nvim'

alias poweroff='systemctl poweroff'

# ---------------------------------------------------------------------------- #
# The 'ls' family 
# ---------------------------------------------------------------------------- #
# Add colors for filetype and  human-readable sizes by default on 'ls':
alias ls='ls -h --color'
alias lx='ls -lXB'          #  Sort by extension.
alias lk='ls -lSr'          #  Sort by size, biggest last.
alias lt='ls -ltr'          #  Sort by date, most recent last.
alias lc='ls -ltcr'         #  Sort by/show change time,most recent last.
alias lu='ls -ltur'         #  Sort by/show access time,most recent last.
alias lh='ls -a | egrep "^\."' # Dotfiles

# The ubiquitous 'll': directories first, with alphanumeric sorting:
alias ll="ls -lv --group-directories-first"
alias lm='ll |more'         #  Pipe through 'more'
alias lr='ll -R'            #  Recursive ls.
alias la='ll -A'            #  Show hidden files.

#alias tmux='tmux -2'

# ---------------------------------------------------------------------------- #
# Some programs
# ---------------------------------------------------------------------------- #

alias pdf='zathura'              # PDF reader 
alias chrome='google-chrome'     # Internet Browser

# ============================================================================ #
#
# ENVIROMENTAL VARIABLES 
#
# ============================================================================ #
# ---------------------------------------------------------------------------- #
# Powerline 
# ---------------------------------------------------------------------------- #

#function _update_ps1() {
#    PS1=$(powerline-shell $?)
#}
#
#if [[ $TERM != linux && ! $PROMPT_COMMAND =~ _update_ps1 ]]; then
#    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
#fi

#if [ -f /usr/share/powerline/bindings/bash/powerline.sh ]; then
#  powerline-daemon -q
#  POWERLINE_BASH_CONTINUATION=1
#  POWERLINE_BASH_SELECT=1
#  source /usr/share/powerline/bindings/bash/powerline.sh
#fi

# load powerline
if [ -f `which powerline-daemon` ]; then
    powerline-daemon -q
    POWERLINE_BASH_CONTINUATION=1
    POWERLINE_BASH_SELECT=1
fi
if [ -f /usr/local/lib/python3.8/dist-packages/powerline/bindings/bash/powerline.sh ]; then
    source /usr/local/lib/python3.8/dist-packages/powerline/bindings/bash/powerline.sh
fi


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/dbarcene/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/dbarcene/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/dbarcene/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/dbarcene/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

