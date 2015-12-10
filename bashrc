#!/bin/bash

# Colours
DULL=0
BRIGHT=1

FG_BLACK=30
FG_RED=31
FG_GREEN=32
FG_YELLOW=33
FG_BLUE=34
FG_VIOLET=35
FG_CYAN=36
FG_WHITE=37

FG_NULL=00

BG_BLACK=40
BG_RED=41
BG_GREEN=42
BG_YELLOW=43
BG_BLUE=44
BG_VIOLET=45
BG_CYAN=46
BG_WHITE=47

BG_NULL=00

# ANSI Escape Commands
ESC="\033"
NORMAL="$ESC[m"
RESET="$ESC[${DULL};${FG_WHITE};${BG_NULL}m"

BLACK="$ESC[${DULL};${FG_BLACK}m"
RED="$ESC[${DULL};${FG_RED}m"
GREEN="$ESC[${DULL};${FG_GREEN}m"
YELLOW="$ESC[${DULL};${FG_YELLOW}m"
BLUE="$ESC[${DULL};${FG_BLUE}m"
VIOLET="$ESC[${DULL};${FG_VIOLET}m"
CYAN="$ESC[${DULL};${FG_CYAN}m"
WHITE="$ESC[${DULL};${FG_WHITE}m"

# BRIGHT TEXT
BRIGHT_BLACK="$ESC[${BRIGHT};${FG_BLACK}m"
BRIGHT_RED="$ESC[${BRIGHT};${FG_RED}m"
BRIGHT_GREEN="$ESC[${BRIGHT};${FG_GREEN}m"
BRIGHT_YELLOW="$ESC[${BRIGHT};${FG_YELLOW}m"
BRIGHT_BLUE="$ESC[${BRIGHT};${FG_BLUE}m"
BRIGHT_VIOLET="$ESC[${BRIGHT};${FG_VIOLET}m"
BRIGHT_CYAN="$ESC[${BRIGHT};${FG_CYAN}m"
BRIGHT_WHITE="$ESC[${BRIGHT};${FG_WHITE}m"

# echo stuff
echoRun () {
  echo $@
  eval $@
  echo $@
}

# For Grails
grailsRun() {
  echoRun grails $@
}

grailsDebug() {
  echoRun grails -debug $@
}

# Git prompt 
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# Prompt stuff
export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\W\[\033[m\]\$(__git_ps1) "
export CLICOLOR=1

bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'

# LS colours
export LSCOLORS=ExFxBxDxCxegedabagacad

export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"

function chrome () {
  /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome $* 2>&1 &
}

# ls
alias l='clear; pwd; ls -oh'
alias sl='ls'
alias la='ls -a'

# misc
alias v='vim'
alias h='history'
alias chromex="chrome --args --disable-web-security"
alias pd='pushd ./'

# cd
alias ..='cd ..'
alias ...='cd ../..'

# cd - projects

# docker
alias d='docker'
alias b2d='boot2docker start; $(boot2docker shellinit)'

# brew install git
alias g='git'
alias gf='git-flow'
alias gs='git status --short'
alias gg='git grep'
alias gl='git ls-files'
alias gls='git ls-files'

# mongo
alias mongo-start='mongod --config /usr/local/etc/mongod.conf'

# brew install tinyproxy
alias tinyproxy-log='tail -f -n0  /usr/local/Cellar/tinyproxy/1.8.3/var/log/tinyproxy/tinyproxy.log'

# postgres
alias startpg='postgres -D /usr/local/var/postgres/'

# brew install pgcli
alias psql='pgcli'
alias pg='pgcli'

# grails
alias gca='grailsRun clean-all'
alias gra='grailsRun run-app'
alias grd='grailsRun refresh-dependencies'
alias gc='grailsRun compile'

# brew install bash-completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

# brew install jenv
export PATH="$HOME/.jenv/bin:$PATH"
if which jenv > /dev/null; then eval "$(jenv init -)"; fi

# Initialize rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# GVM
[[ -s "/Users/mauriceoconnor/.gvm/bin/gvm-init.sh" ]] && source "/Users/mauriceoconnor/.gvm/bin/gvm-init.sh"
