# Ansible Role: DDClient

| **Travis-CI** |
| ---- |
| [![Build Status](https://travis-ci.org/jpartain89/ansible-role-ddclient.svg?branch=master)](https://travis-ci.org/jpartain89/ansible-role-ddclient) |

Installs DDClient from Wimpunk's Github Repo, and then configure's the ddclient.conf file.

## Requirements

CPANM will be installed, along with Perl and `libio-socket-ssl-perl`

## Role Variables

Each line under `ddclient_conf` will be placed in `/etc/ddclient/ddclient.conf` as-is, except for `name`. I added this distinction in case you had multiple addresses you configured using DDClient.

```bash
ddclient_conf:
  - name: DynDNS2
    protocol: dyndns2
    use: web
    server: domains.google.com
  - name: Other
    protocol: other
    ...
```

## Example Playbook

    - hosts: ddclient
      become: true

      vars:
        ddclient_conf:
          - name: DynDNS2
            protocol: dyndns2
            use: web
            server: domains.google.com
            ddclient_cpan_install:
              - "Data::Validate::IP"
              - "IO::Socket::SSL"
              - "IO::Socket::INET6" # This one can be left out since it requries IPv6
              - "JSON::PP"

      roles:
         - jpartain89.ddclient

## License

GPLv2

## Author Information

JPCDI, JPartain89 and Justin Partain
