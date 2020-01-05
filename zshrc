HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
zstyle :compinstall filename '~/.zshrc'
autoload -Uz compinit
compinit

autoload -U colors
plugins=(git brew osx aws cp docker node npm nvm rust tmux yarn)

# === PROMPT ===
parse_git_branch() {
        git symbolic-ref --short HEAD 2> /dev/null
}

setopt PROMPT_SUBST
PROMPT='%9c%{%F{blue}%} $(parse_git_branch)%{%F{none}%} $ '

# === ALIASES ===
setopt completealiases

# ls
alias l='{ clear && ls -oh; }'
alias ll='l'
alias t='tree -C'
alias sl='ls'
alias la='ls -a'

alias port='lsof -i'

alias lck='pmset displaysleepnow'

# misc
alias vim='nvim'
alias v='nvim'
alias h='history'
alias chromex='chrome --args --disable-web-security --user-data-dir'
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

# git
alias g='git'
alias gs='git status --short'
alias gg='git grep'
alias gl='git ls-files'
alias gls='git ls-files'
alias gf='git-flow'

