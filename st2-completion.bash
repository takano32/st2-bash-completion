# StackStorm completion for bash/zsh
# vim: set ft=sh ff=unix fileencoding=utf-8 expandtab ts=2 sw=2 :

_st2 () {
  local cword=${COMP_CWORD}
  local cur=${COMP_WORDS[COMP_CWORD]}
  local prev=${COMP_WORDS[COMP_CWORD-1]}

  if [ $cword -eq 1 ]; then
    opts=""
    opts="run action action-alias auth login whoami apikey execution"
    opts="$opts inquiry key pack policy policy-type rule webhook"
    opts="$opts timer runner sensor trace trigger trigger-instance"
    opts="$opts rule-enforcement workflow service-registry role role-assignment"
    COMPREPLY=( $(compgen -W "$opts" -- "$cur") )
  elif [ $cword -eq 2 ]; then
    if [ $prev = "run" ]; then
      # ToDo
      true
    elif [ $prev = "login" ]; then
      user_list=`cut -d: -f1 /etc/passwd | grep -vE '^(#|_).*$'`
      COMPREPLY=( $(compgen -W "$user_list" -- "$cur") )
    elif [ $prev = "key" ]; then
      COMPREPLY=( $(compgen -W "list set delete" -- "$cur") )
    fi
  fi
} &&

  complete -F _st2 st2

