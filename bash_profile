#!/bin/bash

# login shell file

if [ -f $HOME/.bashrc ]; then
   source $HOME/.bashrc
fi

export PATH="$PATH:$HOME/bin"    

#bash-sensible needs bash 4.something
BASH_SENSIBLE="$HOME/dotfiles/repos/bash-sensible/sensible.bash"
if [ -f $BASH_SENSIBLE ]; then 
        source $BASH_SENSIBLE
fi

# Prompt stuff
export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\W\[\033[m\]\$(__git_ps1) "
export CLICOLOR=1
export EDITOR=nvim

# LS colours
export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"

#arrows up/down turn into search back / forward in history
bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'

# ls
alias l="{ clear && ls -oh; }"
alias ll="l"
alias t="tree -C"
alias sl='ls'
alias la='ls -a'

alias port='lsof -i'

alias lck='pmset displaysleepnow'

# misc
alias vim='nvim'
alias v='nvim'
alias h='history'
alias chromex="chrome --args --disable-web-security --user-data-dir"
alias tm='tmux'

alias screen-locker='watch -n 5 screen-lock'

# pushd / popd
alias p='pushd'
alias o='popd'

# cd
alias ..='cd ..'
alias ...='cd ../...'
alias cdd='cd ~/dotfiles'
alias cdc='cd ~/code'
alias cdgo='cd $GOPATH'

# docker

dkstats() {
        if [ $# -eq 0 ]
                then docker stats --no-stream;
                else docker stats --no-stream | grep $1;
        fi
}

dke() {
  docker exec -it $1 /bin/sh
}

dkexe() {
  docker exec -it $1 $2
}

alias dkps="docker ps --format '{{.ID}} - {{.Names}} - {{.Status}} - {{.Image}}'"
alias dk='docker'
alias dkl='docker logs'
alias dklf='docker logs -f'
alias dki='docker images'
alias dks='docker service'
alias dkrm='docker rm'
alias dm='docker-machine'
alias dkc='docker-compose'
alias dc='docker-compose'

alias docker-remove-images='docker rmi $(docker images -a)'
alias docker-remove-exited-containers='docker rm $(docker ps -a -f status=exited -q)'
alias docker-remove-created-containers='docker rm $(docker ps -a -f status=created -q)'

alias docker-map-postgres='docker-machine ssh default -L 5432:localhost:5432'
alias denv='eval "$(docker-machine env default)"'

# brew install git
alias g='git'
alias gs='git status --short'
alias gg='git grep'
alias gl='git ls-files'
alias gls='git ls-files'
alias gf='git-flow'

# common bash stuff replaced
alias cat='bat --theme TwoDark'

# mongo
alias mongo-start='mongod --config /usr/local/etc/mongod.conf'

# brew install tinyproxy
alias tinyproxy-log='tail -f -n0  /usr/local/Cellar/tinyproxy/1.8.3/var/log/tinyproxy/tinyproxy.log'

# brew install pgcli
alias pg='pgcli'
alias mvn='$MAVEN_HOME/bin/mvn'

# did file
DID_FILE=${HOME}/.did
DID_FILE_BAK=${HOME}/Documents/did.bak.txt
alias did-bak="comm -2 -3 ${DID_FILE} ${DID_FILE_BAK} >> ${DID_FILE_BAK}"
alias did="vim +'normal Go' +'r!date' ${DID_FILE} && did-bak"

# edit this file
alias eb='vim ~/.bashrc'
alias sb='source ~/.bashrc'

# react-dev-tools
alias rdt='react-devtools'

# brew install bash-completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
        . $(brew --prefix)/etc/bash_completion
fi

