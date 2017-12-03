export ZSH=/Users/jwhiteman/.oh-my-zsh

ZSH_THEME="robbyrussell"

EDITOR='vim'
export EDITOR

alias cdk="cd ~/Desktop"
alias o="open ."
alias wk="cd ~/Work"
alias td="wk; vim TODO.md"
alias par="cd ~/Work/par8o"
alias pat="wk; cd pat"

alias e="egrep -iIre"

plugins=(git)

source $ZSH/oh-my-zsh.sh
export PATH="$HOME/.rbenv/bin:$PATH"

eval "$(rbenv init -)"
export PATH="/usr/local/opt/mysql@5.6/bin:$PATH"

export LDFLAGS="-L/usr/local/opt/mysql@5.6/lib"
export CPPFLAGS="-I/usr/local/opt/mysql@5.6/include"

. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

# PAT
export PAT_LOG_LEVEL="info"

# GO
export GOPATH=$HOME/.go
export PATH=$PATH:$GOPATH/bin

# Add ~/bin to $PATH
export PATH=$PATH:$HOME/bin

source ~/.zsh-secrets
