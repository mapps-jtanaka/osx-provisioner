#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# env
export HOMEBREW_CASK_OPTS="--appdir=/Applications"
export EDITOR="vim"
export PATH=/usr/local/opt/coreutils/libexec/gnubin:${HOME}/.gem/ruby/2.3.0:${PATH}
export MANPATH=/usr/local/opt/coreutils/libexec/gnuman:${MANPATH}
export LESSOPEN="| /usr/local/bin/src-hilite-lesspipe.sh %s"
export LESS=" -R "

if [ -e "$HOME/go" ]; then
  export GOPATH="$HOME/go"
  export GOBIN="$GOPATH/bin"
fi

# alias
alias ctags="`brew --prefix`/bin/ctags"
alias ls="ls --color"
alias v="view"

alias vau="vagrant up"
alias vas="vagrant ssh"
alias vah="vagrant halt"

alias m='(){ (cd ~/.macbook-provisioning; make $1) }'

# for tmux window name
function ssh() {
    local window_name=$(tmux display -p '#{window_name}')
    command env TERM=xterm ssh $@
    tmux rename-window $window_name
}

# misc
#if [ -z $TMUX ] ; then
#    if [ -z "`ps aux | grep tmux | grep -v grep`" ] ; then
#        tmux
#    else
#        tmux attach
#    fi
#fi
