#! /bin/bash

# run this as root
#
ansible-galaxy install jdauphant.ssl-certs
ansible-playbook playbook.yml
