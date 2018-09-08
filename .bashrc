# show git branch

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PS1="\u@\h \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "

# git branch tab completion

source ~/bash/git-completion.bash;

# mongodb

export PATH=$PATH:~/mongodb/bin

# aliases

alias gomongo="mongod --dbpath ~/mongoDB/data"
alias projects="cd ~/projects"
alias 401="cd ~/Documents/Coding/code_fellows/401"
alias lynda="cd ~/Documents/Coding/Lynda"
alias coding="cd ~/Documents/Coding"

# templates 

    # setup project

    alias mk-config="cp ~/templates/node/.eslintrc . && cp ~/templates/node/.gitignore . && npm init -y"
    alias mk-dir="mkdir -p test/unit"
    alias mk-project="mk-dir && mk-config"

    # setup eslint/airbnb for create-react-app along with SCSS and tests

    alias mk-airbnb="cp ~/templates/airbnb/.eslintrc . && cp ~/templates/airbnb/.gitignore . && cp ~/templates/airbnb/package.json . && mk-dir"

# Setting PATH for Python 3.6
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"
export PATH

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
