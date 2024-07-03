#!/bin/bash
# File              : .bashrc
# Author            : David Barcene <david.barcene@utp.ac.pa>
# Date              : 25.01.2022
# Last Modified Date: 27.06.2024
# Last Modified By  : David Barcene <david.barcene@utp.ac.pa>

# ---------------------------------------------------------------------------- #
# source global definitions
# ---------------------------------------------------------------------------- #

# Run Tmux on startup
if command -v tmux &> /dev/null && [ -n "$PS1" ] && \
[[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  exec tmux
fi

if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi


setxkbmap -option caps:swapescape
#set -o vi	# Vi mode


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
alias docs='cd ~/Documents/'
alias books='cd ~/books'
alias notes='cd ~/Documents/articles/notes/'
alias articles='cd ~/Documents/articles/'
alias fem='cd ~/Documents/master-semester1-2022/computational-physics/fem-poisson/scripts'
alias tesis='cd ~/Documents/APY-NI-2022-55/TESIS/tesis'
alias anodizado='cd ~/Documents/APY-NI-2022-55/APY-NI/ANODIZADO'

alias iberogun='ssh david.barcene@192.68.3.10 -p 22'


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
alias ll="ls -lv --color --group-directories-first"
alias lm='ll |more'         #  Pipe through 'more'
alias lr='ll -R'            #  Recursive ls.
alias la='ll -A'            #  Show hidden files.

LS_COLORS=$LS_COLORS:'ow=1;34:' ; export LS_COLORS

# ---------------------------------------------------------------------------- #
# Some programs
# ---------------------------------------------------------------------------- #

alias octave='octave --no-gui'
alias pdf='zathura'              # PDF reader 
alias chrome='google-chrome'     # Internet Browser
alias burai='java -jar ~/burai/bin/burai.jar'     # Internet Browser
alias vesta='~/Public/VESTA-gtk3/./VESTA'     # Internet Browser
# alias scihub='scihub -O ~/Documents/articles/'

# ============================================================================ #
#
# ENVIROMENTAL VARIABLES 
#
# ============================================================================ #

export bib="$HOME/Documents/bibliography/ref.bib"
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

# User specific environment
PATH="$HOME/.local/bin:$HOME/bin:$PATH"
export PATH=/usr/java/jre1.8.0_361/bin:$PATH # Java
export PATH=/home/dbarcene/qe-6.8/bin:$PATH # quantum espresso
export PATH


PKG_CONFIG_PATH="/usr/share/pkgconfig/:$PKG_CONFIG_PATH"
PKG_CONFIG_PATH="/usr/lib/x86_64-linux-gnu/pkgconfig/:$PKG_CONFIG_PATH"
	
export PKG_CONFIG_PATH



# ---------------------------------------------------------------------------- #
# Starship 
# ---------------------------------------------------------------------------- #
eval "$(starship init bash)"
. "$HOME/.cargo/env"
