# Ansible Role: DDClient

[![Build Status](https://travis-ci.org/jpartain89/ansible_ddclient.svg?branch=master)](https://travis-ci.org/jpartain89/ansible_ddclient)

Installs DDClient from Wimpunk's Github Repo, and then configure's the ddclient.conf file.

## Requirements

CPANM will be installed, along with Perl and `libio-socket-ssl-perl`

## Role Variables

Each line under `ddclient_conf` will be placed in `/etc/ddclient/ddclient.conf` as-is.

```
ddclient_conf:
  - "protocol=dyndns2"
  - "use=web"
  - "server=domains.google.com"
```

## Example Playbook

    - hosts: ddclient
      become: true

      vars:
        ddclient_conf:
          - "protocol=dyndns2"
          - "use=web"
          - "server=domains.google.com"

      roles:
         - jpartain89.ddclient

## License

GPLv2

## Author Information

JPCDI, JPartain89 and Justin Partain
