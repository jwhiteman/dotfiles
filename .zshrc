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

# VIM MODE:
bindkey -v

# no delay entering normal mode
# https://coderwall.com/p/h63etq
# https://github.com/pda/dotzsh/blob/master/keyboard.zsh#L10
# 10ms for key sequences
# KEYTIMEOUT=1 # breaks the jk keybinding below

# show vim status
# http://zshwiki.org/home/examples/zlewidgets
function zle-line-init zle-keymap-select {
    RPS1="${${KEYMAP/vicmd/-- NORMAL --}/(main|viins)/-- INSERT --}"
    RPS2=$RPS1
    zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select

# add missing vim hotkeys
# http://zshwiki.org/home/zle/vi-mode
bindkey -a u undo
bindkey -a '^T' redo
bindkey '^?' backward-delete-char  #backspace

# history search in vim mode
# http://zshwiki.org./home/zle/bindkeys#why_isn_t_control-r_working_anymore
# ctrl+r to search history
bindkey -M viins '^r' history-incremental-search-backward
bindkey -M vicmd '^r' history-incremental-search-backward

# https://dougblack.io/words/zsh-vi-mode.html
bindkey '^P' up-history
bindkey '^N' up-history

# https://unix.stackexchange.com/questions/101182/bind-key-sequence-to-escape-zsh
bindkey jk vi-cmd-mode
# END VIM MODE
