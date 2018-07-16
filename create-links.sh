#!/bin/bash

echo "=== CREATE LINKS ==="

set -e

ln -s ~/dotfiles/bashrc ~/.bashrc
ln -s ~/dotfiles/gitconfig ~/.gitconfig:
ln -s ~/dotfiles/vim ~/.vim

