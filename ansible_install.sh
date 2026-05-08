#!/bin/bash
dnf install ansible -y
cd /tmp
git clone https://github.com/rajalingarao/4.4.expense-ansible.git
cd 4.4.expense-ansible
ansible-playbook -i inventory.ini db.yaml -e 'mysql_root_password=ExpenseApp@1'
ansible-playbook -i inventory.ini db.yaml -e 'mysql_root_password=ExpenseApp@1'
ansible-playbook -i inventory.ini backend.yaml
ansible-playbook -i inventory.ini frontend.yaml