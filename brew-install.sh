#!/bin/bash

set -e
set -x

echo "=== HOMEBREW STUFF ==="

#/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew install pgcli ag vim bash-completion nvm bash git reattach-to-user-namespace multitail nvim bat tldr fd

