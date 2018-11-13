#!/bin/bash

# login shell file

if [ -f $HOME/.bashrc ]; then
   source $HOME/.bashrc
fi

[[ -s "/Users/maurice.oconnor/.gvm/scripts/gvm" ]] && source "/Users/maurice.oconnor/.gvm/scripts/gvm"
