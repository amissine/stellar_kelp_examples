# source: util/common.sh {{{1

log () { # {{{1
  echo `date +%s` $BASHPID $@ >>./syserr
}
