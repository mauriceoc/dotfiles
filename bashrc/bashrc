#!/bin/bash

# For Maven
mvnrun () {
  echo mvn $@
  eval mvn $@
  echo mvn $@
}

# General
alias c='/bin/clear'
alias clea='/bin/clear'
alias cl='/bin/clear'
alias h='history'
alias v='/bin/vim'
alias vp='if [ -e pom.xml ]; then vim pom.xml; else echo "No pom in pwd"; fi'
alias s='/bin/clear'
alias repos='cd /c/projects/tor/repos'
alias apps="cd /c/apps"
#alias cd='pushd ./; cd'

# pwd
alias p='/bin/pwd'
alias pw='/bin/pwd'
alias wpd='/bin/pwd'
alias dpw='/bin/pwd'

# grep
alias grs='/bin/grep -l -r'

# push
alias pd='pushd ./'
alias dp='popd'

# ls
alias l='/bin/ls -lah'
alias sl='/bin/ls -lah'
alias ll='/bin/ls -lah'
alias la='/bin/ls -lah'

# git
alias g='/bin/git'
alias gs='git status --short'
alias gg='git grep'
alias gl='git ls-files'
alias gls='git ls-files'

# Find
alias src='/bin/find ./ -type d -name src'
alias pom='/bin/find ./ -type f -name pom.xml'
alias jav='/bin/find ./ -type f -name *.java'
alias js='/bin/find ./ -type f -name *.js'
alias xml='/bin/find ./ -type f -name *.xml'

# Maven
alias mcc='mvnrun clean compile'
alias mcct='mvnrun clean compile test'
alias mctc='mvnrun clean test compile'
alias mct='mvnrun clean test'
alias mt='mvnrun test'
alias mcp='mvnrun clean package'
alias mci='mvnrun clean install'
alias mce='mvnrun compile exec:java'
alias mitjr='mvnrun verify -Pjboss_remote'
alias kill_m2_repo='rm -Rf /c/Users/emauoco/.m2/repository/*'


# Backup
alias bakup_gitbash='cp ~/.gitconfig ~/.bashrc ~/Dropbox/Config/gitbash/'

alias list_versant="db2tty -d dps_integration | grep instances | grep MeContext"

# Jboss
alias jboss="/c/apps/exec/exec.sh"
