#!/bin/bash
# File              : .bashrc
# Author            : David Barcene <david.barcene@utp.ac.pa>
# Date              : 25.01.2022
# Last Modified Date: 24.04.2022
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

set -o vi	# Vi mode

# Run Tmux on startup
#if command -v tmux &> /dev/null && [ -z "$TMUX"  ]; then
#	    tmux attach -t default || tmux new -s default
#fi

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
	builtin cd "${new_directory}" && ls --color --group-directories-first
}

alias df='df -h'            #  Prints available space in partitions
alias cp='cp -iv'
alias mv='mv -iv'
alias vimrc='vim ~/.vimrc'
alias bashrc='vim ~/.bashrc'
alias poweroff='systemctl poweroff'
alias update='sudo apt update'
alias upgrade='sudo apt upgrade'
alias docs='cd ~/Documents/latex-docs/'
alias notes='cd ~/Documents/articles/notes/'
alias articles='cd ~/Documents/articles/'
alias semester='cd ~/Documents/latex-docs/master-semester1-2022/'

# ---------------------------------------------------------------------------- #
# The 'ls' family 
# ---------------------------------------------------------------------------- #
# Add colors for filetype and  human-readable sizes by default on 'ls':
alias ls='ls -h --color --group-directories-first'
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


# ---------------------------------------------------------------------------- #
# Some programs
# ---------------------------------------------------------------------------- #

alias octave='octave --no-gui'
alias pdf='zathura'              # PDF reader 
alias chrome='google-chrome'     # Internet Browser
# alias scihub='scihub -O ~/Documents/articles/'

# ============================================================================ #
#
# ENVIROMENTAL VARIABLES 
#
# ============================================================================ #

export bib="$HOME/Documents/latex-docs/bibliography/ref.bib"
export articles="$HOME/Documents/articles"
export notes="$articles/notes"

# ---------------------------------------------------------------------------- #
# fzf 
# ---------------------------------------------------------------------------- #

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# ---------------------------------------------------------------------------- #
# Powerline 
# ---------------------------------------------------------------------------- #

# load powerline
if [ -f `which powerline-daemon` ]; then
    powerline-daemon -q
    POWERLINE_BASH_CONTINUATION=1
    POWERLINE_BASH_SELECT=1
fi
if [ -f /usr/local/lib/python3.8/dist-packages/powerline/bindings/bash/powerline.sh ]; then
    source /usr/local/lib/python3.8/dist-packages/powerline/bindings/bash/powerline.sh
fi


# ---------------------------------------------------------------------------- #
# Conda
# ---------------------------------------------------------------------------- #

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

