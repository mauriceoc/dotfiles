#!/bin/bash

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
  echoRun grails-debug $@
}

# Parse git branch
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# Prompt stuff
export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$(parse_git_branch) "
export CLICOLOR=1

bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'

# LS colours
export LSCOLORS=ExFxBxDxCxegedabagacad

if which jenv > /dev/null; then eval "$(jenv init -)"; fi

function chrome () {
  /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome $* 2>&1 &
}

# Aliases

alias c='echo use ctrl+l'
alias clear='echo use ctrl+l'

alias l='ls -lh'
alias ls='ls -GFh'
alias sl='ls'
alias la='ls -lah'

alias v='vim'
alias h='history'

alias startpg='postgres -D /usr/local/var/postgres/'

alias ..='cd ..'
alias ...='cd ../..'

alias chromex="chrome --args --disable-web-security"

alias d='docker'

# git
alias g='git'
alias gf='git-flow'
alias gs='git status --short'
alias gg='git grep'
alias gl='git ls-files'
alias gls='git ls-files'

alias xamppfiles='cd /Applications/XAMPP/xamppfiles'

alias pd='pushd ./'
alias mongo-start='mongod --config /usr/local/etc/mongod.conf'

alias tinyproxy-log='tail -f -n0  /usr/local/Cellar/tinyproxy/1.8.3/var/log/tinyproxy/tinyproxy.log'

alias psql='pgcli'

alias showHidden='defaults write com.apple.finder AppleShowAllFiles YES'

#THIS MUST BE AT THE END OF THE FILE FOR GVM TO WORK!!!
[[ -s "/Users/mauriceoconnor/.gvm/bin/gvm-init.sh" ]] && source "/Users/mauriceoconnor/.gvm/bin/gvm-init.sh"

