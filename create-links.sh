#!/bin/bash

echo "=== CREATE LINKS ==="

set -e
set -x

DOT_FILES=${HOME}/dotfiles

ln -s ${DOT_FILES}/bashrc ${HOME}/.bashrc
ln -s ${DOT_FILES}/bash_profile ${HOME}/.bash_profile
ln -s ${DOT_FILES}/pgclirc ${HOME}/.pgclirc
ln -s ${DOT_FILES}/gitconfig ${HOME}/.gitconfig
ln -s ${DOT_FILES}/tmux/tmux.conf ${HOME}/.tmux.conf

ln -s ${DOT_FILES}/tmux/ ${HOME}/.tmux
ln -s ${DOT_FILES}/vim/  ${HOME}/.vim

NVIM_CONFIG=${HOME}/.config/nvim

mkdir -p ${NVIM_CONFIG}

ln -s ${DOT_FILES}/init.vim ${NVIM_CONFIG}/init.vim

