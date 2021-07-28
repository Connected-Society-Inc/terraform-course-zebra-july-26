#!/bin/bash
terraform apply -auto-approve > out.log
export PUBLIC_IP=$(cat out.log | grep public_ip | cut -d '=' -f 2 | tr -d ' ' | tr -d '\"')
echo $PUBLIC_IP > hosts
ansible-playbook playbook.yaml all

