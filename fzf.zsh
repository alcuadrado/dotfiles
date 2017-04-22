
__list_non_ignored() {

    git rev-parse --is-inside-work-tree 2> /dev/null > /dev/null
    IN_REPO=$?

    if [[ "$IN_REPO" == "0" ]] ; then
        find . | grep -v "^\\.$" | grep -v "^\\./\\.git/" | grep -v "^\\./\\.git$" | cut -c 3- | git check-ignore --stdin -n --verbose | grep "::" | cut -c 4-
    else
        find . | grep -v "^\\.$" | cut -c 3-
    fi
}


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

export FZF_DEFAULT_COMMAND='__list_non_ignored'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
