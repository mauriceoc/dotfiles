#!/bin/bash

echo "=== SETUP 2 ==="

set -e
set -x

DOT_FILES="${HOME}/dotfiles"
BASHRC="${HOME}/.bashrc"
NVIM_CONFIG=${HOME}/.config/nvim

# install homebrew
if [ -x "$(command -v brew)" ]; then
        echo "homebrew - already exists"
else 
        echo "homebrew - installing it now"
        /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# execute Brewfile
brew bundle 

# zsh
ln -shf ${DOT_FILES}/zprofile ${HOME}/.zprofile
ln -shf ${DOT_FILES}/zshrc ${HOME}/.zshrc
ln -shf ${DOT_FILES}/zshenv ${HOME}/.zshenv

# aliases
ln -shf ${DOT_FILES}/alias ${HOME}/.alias

# other config
ln -shf ${DOT_FILES}/pgclirc ${HOME}/.pgclirc
ln -shf ${DOT_FILES}/gitconfig ${HOME}/.gitconfig
ln -shf ${DOT_FILES}/tmux.conf ${HOME}/.tmux.conf
ln -shf ${DOT_FILES}/init.vim ${NVIM_CONFIG}/init.vim

# dirs
ln -shf ${DOT_FILES}/tmux ${HOME}/.tmux
ln -shf ${DOT_FILES}/vim  ${HOME}/.vim
ln -shf ${DOT_FILES}/grc  ${HOME}/.grc

