#!/bin/bash

echo "=== SETUP 2 ==="

set -e
set -x

DOT_FILES="${HOME}/dotfiles"
BASHRC="${HOME}/.bashrc"
NVIM_CONFIG=${HOME}/.config/nvim

# zsh
ln -shf ${DOT_FILES}/zprofile ${HOME}/.zprofile
ln -shf ${DOT_FILES}/zshrc ${HOME}/.zshrc
ln -shf ${DOT_FILES}/zshenv ${HOME}/.zshenv

# other config
ln -shf ${DOT_FILES}/pgclirc ${HOME}/.pgclirc
ln -shf ${DOT_FILES}/gitconfig ${HOME}/.gitconfig
ln -shf ${DOT_FILES}/tmux.conf ${HOME}/.tmux.conf
ln -shf ${DOT_FILES}/init.vim ${NVIM_CONFIG}/init.vim

# dirs
ln -shf ${DOT_FILES}/tmux ${HOME}/.tmux
ln -shf ${DOT_FILES}/vim  ${HOME}/.vim

