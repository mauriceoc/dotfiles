#!/bin/bash

set -e
set -x

echo "=== CLONE GIT REPOS ==="

cd repos

git clone https://github.com/tomislav/osx-terminal.app-colors-solarized.git
git clone https://github.com/mrzool/bash-sensible.git

