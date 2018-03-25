export ZSH=/Users/jwhiteman/.oh-my-zsh

ZSH_THEME="powerlevel9k/powerlevel9k"

EDITOR='vim'
export EDITOR

alias cdk="cd ~/Desktop"
alias o="open ."

alias td="vim ~/Documents/Text/todo.md"
alias wtd="vim ~/Documents/Text/work-todo.md"

plugins=(git)

source $ZSH/oh-my-zsh.sh
export PATH="$HOME/.rbenv/bin:$PATH"

eval "$(rbenv init -)"
export PATH="/usr/local/opt/mysql@5.6/bin:$PATH"

export LDFLAGS="-L/usr/local/opt/mysql@5.6/lib"
export CPPFLAGS="-I/usr/local/opt/mysql@5.6/include"

. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

export GOPATH=$HOME/.go
export PATH=$PATH:$GOPATH/bin

export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'

export PATH=$PATH:$HOME/bin

source ~/.zsh-secrets
source ~/.zsh-vim
source ~/.zsh-theme
