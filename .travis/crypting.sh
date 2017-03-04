#!/bin/bash -e

vault_files="tests/vars.yml"

if [ "$1" != "clean" ] && [ "$1" != "decrypt" ]; then
  echo "only 'clean' or 'decrypt' are allowed"
  exit 1
fi

if [ "$1" = "decrypt" ]; then
  for SECRET in $vault_files; do
    ANSIBLE_VAULT_PASSWORD_FILE=tests/.vault_pass.txt ansible-vault view $SECRET > ${SECRET::-4}
  done
elif [ "$1" = "clean" ]; then
  for SECRET in $vault_files; do
    rm ${SECRET::-4}
  done
fi
