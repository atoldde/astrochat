#!/bin/bash -e

DIR=/entrypoint.d

if [ $# -eq 0 ]
then
  if [[ -d "${DIR}" ]]
  then
    /bin/run-parts --verbose --regex '^.*\.sh$' "${DIR}"
  fi
else
  exec "$@"
fi

exec php-fpm -F
