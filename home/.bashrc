#!/bin/bash

source ~/bash/home/bash-scripts.sh
source ~/bash/git-completion.bash;

# display directory & git branch

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# aliases

alias gomongo="mongod --dbpath ~/mongoDB/data"
alias projects="cd ~/projects"
alias 401="cd ~/Documents/Coding/code_fellows/401"
alias lynda="cd ~/Documents/Coding/Lynda"
alias coding="cd ~/Documents/Coding"
alias rm_screenshots="rm ~/Desktop/Screen*.png"
alias amber-health="cd ~/projects/amber-health"
# The Good 
alias theGood="cd ~/Documents/GitHub/ABTestBase"
alias parcelBuild="parcel build $@ -d build --experimental-scope-hoisting"

export PS1="\h \[\033[35m\]\w\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "
export PATH=$PATH:~/mongodb/bin

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH=~/bin:$PATH

export CLICOLOR=1
export LSCOLORS=gxFxCxDxBxegedabagaced

# Run 'nvm use' automatically every time there's 
# a .nvmrc file in the directory. Also, revert to default 
# version when entering a directory without .nvmrc

enter_directory() {
if [[ $PWD == $PREV_PWD ]]; then
    return
fi

PREV_PWD=$PWD
if [[ -f ".nvmrc" ]]; then
    nvm use
    NVM_DIRTY=true
elif [[ $NVM_DIRTY = true ]]; then
    nvm use default
    NVM_DIRTY=false
fi
}

export PROMPT_COMMAND=enter_directory