#!/bin/bash

# Start vms
vagrant up

# Start k8s cluster
vagrant ssh kube-master -c "sudo /vagrant/bin/start_master.sh"
vagrant ssh kube-slave01 -c "sudo /vagrant/bin/start_agent.sh"
vagrant ssh kube-slave02 -c "sudo /vagrant/bin/start_agent.sh"
