#!/bin/bash -e

vault_files="tests/vars.yml"

if [ "$1" != "clean" ] && [ "$1" != "decrypt" ]; then
  echo "only 'clean' or 'decrypt' are allowed"
  exit 1
fi

if [ "$1" = "decrypt" ]; then
  for SECRET in $vault_files; do
    openssl aes-256-cbc -k "$vault_file_pass" -in tests/.vault_pass.enc -out tests/.vault_pass.txt -d
    ANSIBLE_VAULT_PASSWORD_FILE=tests/.vault_pass.txt ansible-vault decrypt "$vault_files"
  done
elif [ "$1" = "clean" ]; then
  for SECRET in $vault_files; do
    ansible-vault encrypt $SECRET --vault-password-file=tests/.vault_pass.txt
  done
  rm -rf tests/.vault_pass.enc
fi
