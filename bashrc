#!/bin/bash

BASH_CUSTOM="$HOME/dotfiles/bash-custom"

[ -f $BASH_CUSTOM ] && . $BASH_CUSTOM

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[ -f /Users/maurice.oconnor/code/grassland/node_modules/tabtab/.completions/serverless.bash ] && . /Users/maurice.oconnor/code/grassland/node_modules/tabtab/.completions/serverless.bash
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[ -f /Users/maurice.oconnor/code/grassland/node_modules/tabtab/.completions/sls.bash ] && . /Users/maurice.oconnor/code/grassland/node_modules/tabtab/.completions/sls.bash
