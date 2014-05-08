#!/bin/bash

# For Grails
grailsRun () {
  echo grails $@
  eval grails $@
  echo grails $@
}

# Parse git branch
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# Prompt stuff
export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$(parse_git_branch) "
export CLICOLOR=1

# LS colours
export LSCOLORS=ExFxBxDxCxegedabagacad

# Set JDK via JAVA_HOME
function setjdk() {  
	if [ $# -ne 0 ]; then  
		removeFromPath '/System/Library/Frameworks/JavaVM.framework/Home/bin'  
		if [ -n "${JAVA_HOME+x}" ]; then  
			removeFromPath $JAVA_HOME  
		fi  
		export JAVA_HOME=`/usr/libexec/java_home -v $@`  
		export PATH=$JAVA_HOME/bin:$PATH  
	fi  
}  

function removeFromPath() {  
	export PATH=$(echo $PATH | sed -E -e "s;:$1;;" -e "s;$1:?;;")  
}

setjdk 1.6

# Aliases
alias ls='ls -GFh'
alias sl='ls'
alias c='clear'
alias clea='clear'
alias l='ls -l'
alias ll='ls -l'
alias v='vim'
alias h='history'
alias startpg='postgres -D /usr/local/var/postgres/'


alias bs='cd ~/Code/bs'
alias moc='cd ~/Code/moc'
alias mc='cd ~/Code/mc'

# Grails aliases
alias gra='grailsRun run-app'
alias gc='grailsRun clean'

# git
alias g='git'
alias gf='git-flow'
alias gs='git status --short'
alias gg='git grep'
alias gl='git ls-files'
alias gls='git ls-files'

