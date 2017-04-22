ZSH=$HOME/.oh-my-zsh
ZSH_THEME="../custom/themes/alcuadrado"
plugins=(git docker docker-compose brew zsh-syntax-highlighting yarn)
source $ZSH/oh-my-zsh.sh

#autocomplete on dir path
zstyle ':completion:*' special-dirs ..

#extra completions
fpath=(/usr/local/share/zsh-completions $fpath)

#some config
export EDITOR=vim
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export PATH=$HOME/bin:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH

#AUTO_TITLE conflicts with tmux
export DISABLE_AUTO_TITLE=true

#aliases
alias axel='axel -a'
alias aspell\-latex="aspell -l es -t -x check"
alias gitroot='cd "$(git rev-parse --show-toplevel)"'
alias dc='docker-compose'

#FZF

__list_non_ignored() {

    git rev-parse --is-inside-work-tree 2> /dev/null > /dev/null
    IN_REPO=$?

    if [[ "$IN_REPO" == "0" ]] ; then
        find . | grep -v "^\\.$" | grep -v "^\\./\\.git/" | grep -v "^\\./\\.git$" | cut -c 3- | git check-ignore --stdin -n --verbose | grep "::" | cut -c 4-
    else
        find . | grep -v "^\\.$" | cut -c 3-
    fi
}

export FZF_DEFAULT_COMMAND='__list_non_ignored'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if [[ $- == *i* ]]; then

# CTRL-S - Select a file from git status .
__fgitstatus() {
  git rev-parse --is-inside-work-tree 2> /dev/null > /dev/null || return

  local cmd="git status -s -uall . | cut -c4-"
  eval "$cmd" | $(__fzfcmd) -m | while read item; do
    printf '%q ' "$item"
  done
  echo
}

fzf-gitstatus-widget() {
  LBUFFER="${LBUFFER}$(__fgitstatus)"
  zle redisplay
}

zle     -N   fzf-gitstatus-widget
bindkey '^S' fzf-gitstatus-widget

fi

# Workaround for fzf https://github.com/junegunn/fzf/issues/201
alias clear='clear; tmux clear-history'
alias reset='reset; tmux clear-history'

#golang
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

if [ -z "$TMUX" ]; then tmux; fi


PATH="/Users/pato/perl5/bin${PATH+:}${PATH}"; export PATH;
PERL5LIB="/Users/pato/perl5/lib/perl5${PERL5LIB+:}${PERL5LIB}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/Users/pato/perl5${PERL_LOCAL_LIB_ROOT+:}${PERL_LOCAL_LIB_ROOT}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/Users/pato/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/pato/perl5"; export PERL_MM_OPT;

# Android
export PATH=$PATH:/Users/pato/Library/Android/sdk/platform-tools
export PATH=$PATH:/Users/pato/Library/Android/sdk/tools

# Colored man pages
man() {
    env \
        LESS_TERMCAP_mb=$(printf "\e[1;31m") \
        LESS_TERMCAP_md=$(printf "\e[1;31m") \
        LESS_TERMCAP_me=$(printf "\e[0m") \
        LESS_TERMCAP_se=$(printf "\e[0m") \
        LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
        LESS_TERMCAP_ue=$(printf "\e[0m") \
        LESS_TERMCAP_us=$(printf "\e[1;32m") \
            man "$@"
}

# Cargo
source $HOME/.cargo/env

# Node
export PATH=$PATH:$(yarn global bin)
