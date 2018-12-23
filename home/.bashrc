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

# setup project

alias mk-config="cp ~/templates/node/.eslintrc . && cp ~/templates/node/.gitignore . && npm init -y"
alias mk-dir="mkdir -p test/unit"
alias mk-project="mk-dir && mk-config"

# setup eslint/airbnb for create-react-app along with SCSS and tests

alias mk-airbnb="cp ~/templates/airbnb/.eslintrc . && cp ~/templates/airbnb/.gitignore . && cp ~/templates/airbnb/package.json . && mk-dir"

export PS1="\h \[\033[35m\]\w\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "
export PATH=$PATH:~/mongodb/bin

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH=~/bin:$PATH

export CLICOLOR=1
export LSCOLORS=gxFxCxDxBxegedabagaced
