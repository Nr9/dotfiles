# init according to man page

export RBENV_ROOT=/usr/local/var/rbenv
if (( $+commands[rbenv] ))
then
  eval "$(rbenv init -)"
fi
