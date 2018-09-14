# Add '~/bin' to the `$PATH`
export PATH="$HOME/bin:$PATH";

export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"

# show git branch 

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PS1="\u \[\033[35m\]\w\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "

# git branch tab completion 

source ~/git-completion.bash

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

export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)

export CLICOLOR=1
export LSCOLORS=gxFxCxDxBxegedabagaced
