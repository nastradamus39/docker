#!/bin/bash

sleep 10

/etc/init.d/ssh start

chmod 0700 ~/.ssh && touch ~/.ssh/authorized_keys

cat /ssh_keys/jenkins.pub >> ~/.ssh/authorized_keys && chmod 0644 ~/.ssh/authorized_keys

SSH_PRIVATE_KEY=$(cat /ssh_keys/jenkins)   # cat /ssh_keys/jenkins
sed -i "s~{SSH_PRIVATE_KEY}~$(echo $SSH_PRIVATE_KEY)~g" /var/jenkins_home/jenkins.yaml

cat /var/jenkins_home/jenkins.yaml

tail -f /dev/null