# StackStorm completion for bash/zsh
# vim: set ft=sh ff=unix fileencoding=utf-8 expandtab ts=2 sw=2 :

_st2 () {
  local cword=${COMP_CWORD}
  local cur=${COMP_WORDS[COMP_CWORD]}
  local prev=${COMP_WORDS[COMP_CWORD-1]}

  if [ $cword -eq 1 ]; then
    COMPREPLY=( $(compgen -W "login key" -- "$cur") )
  elif [ $cword -eq 2 ]; then
    if [ $prev = "login" ]; then
      COMPREPLY=( $(compgen -W "`cut -d: -f1 /etc/passwd | grep -vE '^(#|_).*$'`" -- "$cur") )
    elif [ $prev = "key" ]; then
      COMPREPLY=( $(compgen -W "list set delete" -- "$cur") )
    fi
  fi
} &&

  complete -F _st2 st2

