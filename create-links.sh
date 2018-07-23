#!/bin/bash

echo "=== CREATE LINKS ==="

set -e
set -x

DOT_FILES=${HOME}/dotfiles

ln -sf ${DOT_FILES}/bashrc ${HOME}/.bashrc
ln -sf ${DOT_FILES}/bash_profile ${HOME}/.bash_profile
ln -sf ${DOT_FILES}/pgclirc ${HOME}/.pgclirc
ln -sf ${DOT_FILES}/gitconfig ${HOME}/.gitconfig
ln -sf ${DOT_FILES}/tmux/tmux.conf ${HOME}/.tmux.conf

ln -sf ${DOT_FILES}/tmux/ ${HOME}/.tmux
ln -sf ${DOT_FILES}/vim/  ${HOME}/.vim

NVIM_CONFIG=${HOME}/.config/nvim

mkdir -p ${NVIM_CONFIG}

ln -sf ${DOT_FILES}/init.vim ${NVIM_CONFIG}/init.vim

