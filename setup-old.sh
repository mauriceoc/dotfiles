#!/bin/bash

echo "=== SETUP ==="

set -e
set -x

DOT_FILES="${HOME}/dotfiles"
BASHRC="${HOME}/.bashrc"
NVIM_CONFIG=${HOME}/.config/nvim

[ ! -f ${BASHRC} ] && cp ${DOT_FILES}/bash-init ${HOME}/.bashrc

ln -shf ${DOT_FILES}/bash_profile ${HOME}/.bash_profile
ln -shf ${DOT_FILES}/pgclirc ${HOME}/.pgclirc
ln -shf ${DOT_FILES}/gitconfig ${HOME}/.gitconfig
ln -shf ${DOT_FILES}/tmux.conf ${HOME}/.tmux.conf

#dirs
ln -shf ${DOT_FILES}/tmux ${HOME}/.tmux
ln -shf ${DOT_FILES}/vim  ${HOME}/.vim

mkdir -p ${NVIM_CONFIG}

ln -shf ${DOT_FILES}/init.vim ${NVIM_CONFIG}/init.vim

