#!/bin/bash

[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

export PATH="$PATH:$HOME/bin"    

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
BASH_SENSIBLE="$HOME/dotfiles/repos/bash-sensible/sensible.bash"
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

colorPwd() {
        withColor $GREEN pwd 
}

# Prompt stuff
export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\W\[\033[m\]\$(__git_ps1) "
export CLICOLOR=1
export EDITOR=nvim

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
alias ll="l"
alias t="tree -C"
alias sl='ls'
alias la='ls -a'

alias port='lsof -i'

# misc
alias vim='nvim'
alias v='nvim'
alias h='history'
alias chromex="chrome --args --disable-web-security --user-data-dir"

# pushd / popd
alias p='pushd'
alias o='popd'

# cd
alias ..='cd ..'
alias ...='cd ../...'
alias cddot='cd ~/dotfiles'
alias cdc='cd ~/code'

# docker
alias dc='docker-compose'
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
alias cat='bat'

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


# brew install bash-completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
        . $(brew --prefix)/etc/bash_completion
fi

# Initialize rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# Initialize docker env
if which docker-machine > /dev/null; then eval "$(docker-machine env default)"; fi

# brew install nvm
  export NVM_DIR="$HOME/.nvm"
  . "/usr/local/opt/nvm/nvm.sh"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"


