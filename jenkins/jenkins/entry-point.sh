#!/bin/bash

sleep 5

ssh-keyscan agent.jenkins.net >> ~/.ssh/known_hosts

cp ~/.ssh/id_rsa.pub /ssh_keys/jenkins.pub

# TODO normal inject certificates
#CLIENT_CERTIFICATE=$(cat /certs/client/cert.pem) # cat /certs/client/cert.pem
#CLIENT_KEY=$(cat /certs/client/key.pem)          # cat /certs/client/key.pem
#SERVER_CERTIFICATE=$(cat /certs/client/ca.pem)   # cat /certs/client/ca.pem
#SSH_PRIVATE_KEY=$(cat ~/.ssh/id_rsa)             # cat /ssh_keys/jenkins
#
#sed -i "s~{CLIENT_CERTIFICATE}~$(echo $CLIENT_CERTIFICATE)~g" /var/jenkins_home/jenkins.yaml
#sed -i "s~{CLIENT_KEY}~$(echo $CLIENT_KEY)~g" /var/jenkins_home/jenkins.yaml
#sed -i "s~{SERVER_CERTIFICATE}~$(echo $SERVER_CERTIFICATE)~g" /var/jenkins_home/jenkins.yaml
#
#sed -i "s~{SSH_PRIVATE_KEY}~$(echo $SSH_PRIVATE_KEY)~g" /var/jenkins_home/jenkins.yaml
#
#cat /var/jenkins_home/jenkins.yaml

jenkins.sh