# AUTOLOAD CALLS
autoload -U colors select-word-style
colors          # colors
select-word-style bash # ctrl+w on words

autoload -Uz compinit vcs_info
compinit

# HISTORY FILE
HISTFILE=~/.zsh_history         # where to store zsh config
HISTSIZE=1024                   # big history
SAVEHIST=1024                   # big history
setopt append_history           # append
setopt hist_ignore_all_dups     # no duplicate
unsetopt hist_ignore_space      # ignore space prefixed commands
setopt hist_reduce_blanks       # trim blanks
setopt hist_verify              # show before executing history commands
setopt inc_append_history       # add commands as they are typed, don't wait until shell exit 
setopt share_history            # share hist between sessions
setopt bang_hist                # !keyword

bindkey -e
zstyle :compinstall filename '~/.zshrc'
autoload -Uz compinit
compinit

# === PLUGINS
plugins=(git brew osx aws cp docker node npm nvm rust tmux yarn)

# === ENVIRONMENT VARIABLES ===
#
# for interactive shell only!
export CLICOLOR=1
export LS_COLORS="ExGxBxDxCxEgEdxbxgxcxd"

# === COMPLETION ===
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}  
zstyle ':completion:*' menu select

# === VCS INFO ===
zstyle ':vcs_info:*' enable git svn hg
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' formats "%{$fg[yellow]%}%c%{$fg[green]%}%u%{$reset_color%} [%{$fg[blue]%}%b%{$reset_color%}] %{$fg[yellow]%}%s%{$reset_color%}:%r"
precmd() {  # run before each prompt
    vcs_info
}

# === PROMPT === 
setopt PROMPT_SUBST     # allow funky stuff in prompt
color="blue"
if [ "$USER" = "root" ]; then
    color="red"         # root is red, user is blue
fi;
prompt="%{$fg[$color]%}%n%{$reset_color%}@%U%{$fg[yellow]%}%m%{$reset_color%}%u %T %B%~%b "
RPROMPT='${vim_mode} ${vcs_info_msg_0_}'

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

