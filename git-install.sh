#!/bin/bash

set -e
set -x

echo "=== CLONE GIT REPOS ==="

mkdir -p repos \
&& cd repos \
&& git clone https://github.com/tomislav/osx-terminal.app-colors-solarized.git \
&& git clone https://github.com/mrzool/bash-sensible.git \
&& cd ..

mkdir -p vim/bundle \
&& cd vim/bundle \
&& git clone git://github.com/godlygeek/tabular.git \
&& cd ..

