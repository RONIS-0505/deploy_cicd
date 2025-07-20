#!/bin/bash

ansible-playbook  -i inventory/start_conf_server.ini playbooks/configure_server-playbook.yaml -K