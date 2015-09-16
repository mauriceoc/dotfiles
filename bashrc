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
  echoRun grails -debug $@
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

export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"

function chrome () {
  /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome $* 2>&1 &
}

# Aliases
alias c='echo use ctrl+l'
alias clear='echo use ctrl+l'

# ls
alias l='ls -lh'
alias ls='ls -GFh'
alias sl='ls'
alias la='ls -lah'

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

# brew install thefuck
alias f='fuck'
eval "$(thefuck --alias)"

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
