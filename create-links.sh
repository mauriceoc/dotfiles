#!/bin/bash

echo "=== CREATE LINKS ==="

set -e
set -x

DOT_FILES=${HOME}/dotfiles

ln -shf ${DOT_FILES}/bashrc ${HOME}/.bashrc
ln -shf ${DOT_FILES}/bash_profile ${HOME}/.bash_profile
ln -shf ${DOT_FILES}/pgclirc ${HOME}/.pgclirc
ln -shf ${DOT_FILES}/gitconfig ${HOME}/.gitconfig
ln -shf ${DOT_FILES}/tmux.conf ${HOME}/.tmux.conf

ln -shf ${DOT_FILES}/tmux/ ${HOME}/.tmux
ln -shf ${DOT_FILES}/vim/  ${HOME}/.vim

NVIM_CONFIG=${HOME}/.config/nvim

mkdir -p ${NVIM_CONFIG}

ln -shf ${DOT_FILES}/init.vim ${NVIM_CONFIG}/init.vim

