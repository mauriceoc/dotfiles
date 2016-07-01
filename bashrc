#!/bin/bash

# colours
BLACK=$(tput setaf 0)
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
LIME_YELLOW=$(tput setaf 190)
POWDER_BLUE=$(tput setaf 153)
BLUE=$(tput setaf 4)
MAGENTA=$(tput setaf 5)
CYAN=$(tput setaf 6)
WHITE=$(tput setaf 7)
BRIGHT=$(tput bold)
NORMAL=$(tput sgr0)
BLINK=$(tput blink)
REVERSE=$(tput smso)
UNDERLINE=$(tput smul)

#bash-sensible needs bash 4.something
BASH_SENSIBLE="$HOME/dotfiles/bash-sensible/sensible.bash"
if [ -f $BASH_SENSIBLE ]; then 
        source $BASH_SENSIBLE
fi

withColor () { 
        COLOR=$1
        CMD=${@:2}
        echo -e -n $COLOR; $CMD; echo -e -n $NORMAL
}

# echo stuff
echoRun () {
        withColor $GREEN echo $@
        $@
        withColor $GREEN echo $@
}

grailsRun() {
        jenv exec grails ${@}
}

colorPwd() {
        withColor $GREEN pwd 
}

# OSX - Set a blazingly fast keyboard repeat rate
if [ `uname` = 'Darwin' ]; then
        defaults write NSGlobalDomain KeyRepeat -int 0
fi

# Prompt stuff
export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\W\[\033[m\]\$(__git_ps1) "
export CLICOLOR=1
export EDITOR=vim

#arrows up/down turn into search back / forward in history
bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'

# LS colours
export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"
#export LSCOLORS=ExFxBxDxCxegedabagacad

export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"

# grep color
export GREP_OPTIONS='--color=always'
export GREP_COLOR='1;35;40'

function chrome () {
/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome $* 2>&1 &
}

# ls
alias l="{ clear && ls -oh; }"
alias sl='ls'
alias la='ls -a'

alias port='lsof -i'

# misc
alias v='vim'
alias h='history'
alias chromex="chrome --args --disable-web-security --user-data-dir"

# pushd / popd
alias p='pushd'
alias o='popd'

# cd
alias ..='cd ..'
alias ...='cd ../...'
alias dotf='cd ~/dotfiles'

# docker
alias d='docker-compose'
alias docker-map-postgres='docker-machine ssh default -L 5432:localhost:5432'


# brew install git
alias g='git'
alias gs='git status --short'
alias gg='git grep'
alias gl='git ls-files'
alias gls='git ls-files'
alias gf='git-flow'

# mongo
alias mongo-start='mongod --config /usr/local/etc/mongod.conf'

# brew install tinyproxy
alias tinyproxy-log='tail -f -n0  /usr/local/Cellar/tinyproxy/1.8.3/var/log/tinyproxy/tinyproxy.log'

# postgres
alias startpg='postgres -D /usr/local/var/postgres/'

# brew install pgcli
alias pg='pgcli'

# grails
alias gca='echoRun grailsRun clean-all'
alias gra='echoRun grailsRun run-app'
alias grao='echoRun grailsRun -debug --offline run-app' 
alias grd='echoRun grailsRun refresh-dependencies'
alias gc='echoRun grailsRun compile'

# edit this file
alias eb='vim ~/.bashrc'
alias sb='source ~/.bashrc'

# brew install bash-completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
        . $(brew --prefix)/etc/bash_completion
fi

# brew install jenv
export PATH="$HOME/.jenv/bin:$PATH"
if which jenv > /dev/null; then eval "$(jenv init -)"; fi

# Initialize rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# Initialize docker env
if which docker-machine > /dev/null; then eval "$(docker-machine env default)"; fi

# GVM
[[ -s "/Users/mauriceoconnor/.gvm/bin/gvm-init.sh" ]] && source "/Users/mauriceoconnor/.gvm/bin/gvm-init.sh"
