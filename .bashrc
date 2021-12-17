
# ------------------------------------------------------------------------------- #
# source global definitions
# ------------------------------------------------------------------------------- #
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# User specific environment
PATH="$HOME/.local/bin:$HOME/bin:$PATH"
export PATH

# Uncomment the following line if you don't like systemctls auto-paging feature:
# export SYSTEMD_PAGER=

# set -o vi	# Vi mode


# =============================================================================== #
#
# ALIASES AND FUNCTIONS 
#
# =============================================================================== #

#New cd
function cd() {
	new_directory="$*";
	if [ $# -eq 0 ]; then
		new_directory=${HOME};
	fi;
	builtin cd "${new_directory}" && ls
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

function countdown(){
   date1=$((`date +%s` + $1)); 
   while [ "$date1" -ge `date +%s` ]; do 
     echo -ne "$(date -u --date @$(($date1 - `date +%s`)) +%H:%M:%S)\r";
     sleep 0.1
   done
}


function stopwatch(){
  date1=`date +%s`; 
   while true; do 
    echo -ne "$(date -u --date @$((`date +%s` - $date1)) +%H:%M:%S)\r"; 
    sleep 0.1
   done
}


alias df='df -h'            #  Prints available space in partitions
alias cp='cp -iv'
alias mv='mv -iv'

alias docs='cd /mnt/c/Users/debf_/Documents/LaTeX-docs'
alias work='cd /mnt/e/WorkingDirectory'

# ------------------------------------------------------------------------------- #
# The 'ls' family 
# ------------------------------------------------------------------------------- #
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

# ------------------------------------------------------------------------------- #
# Some programs
# ------------------------------------------------------------------------------- #

#alias pdf='okular'                  # PDF reader 
#alias chrome='chromium-browser'     # Internet Browser

# =============================================================================== #
#
# ENVIROMENTAL VARIABLES 
#
# =============================================================================== #
# ------------------------------------------------------------------------------- #
# Powerline 
# ------------------------------------------------------------------------------- #

if [ -f /usr/share/powerline/bindings/bash/powerline.sh ]; then
 powerline-daemon -q
 POWERLINE_BASH_CONTINUATION=1
 POWERLINE_BASH_SELECT=1
 source /usr/share/powerline/bindings/bash/powerline.sh
fi


