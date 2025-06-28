#!/bin/bash

echo "[JENKINS] Replace secrets in /var/jenkins_home/jenkins.yaml"
# TODO
# inject client certificate
#docker exec jenkins bash -c 'tr "\n" "\n\t\t\t\t\t\t" < /certs/client/cert.pem > /var/jenkins_home/cert.back'
#docker exec jenkins bash -c 'sed -e "/{CLIENT_CERTIFICATE}/{r /var/jenkins_home/cert.back" -e "d}" $JENKINS_HOME/jenkins.yaml > $JENKINS_HOME/jenkins_back.yaml'
#docker exec jenkins bash -c 'yes | cp -rf $JENKINS_HOME/jenkins_back.yaml $JENKINS_HOME/jenkins.yaml'

#docker exec jenkins bash -c 'sed -e "/{CLIENT_KEY}/{r /certs/client/key.pem" -e "d}" $JENKINS_HOME/jenkins.yaml > $JENKINS_HOME/jenkins_back.yaml && yes | cp -rf $JENKINS_HOME/jenkins_back.yaml $JENKINS_HOME/jenkins.yaml'
#docker exec jenkins bash -c 'sed -e "/{SERVER_CERTIFICATE}/{r /certs/client/ca.pem" -e "d}" $JENKINS_HOME/jenkins.yaml > $JENKINS_HOME/jenkins_back.yaml && yes | cp -rf $JENKINS_HOME/jenkins_back.yaml $JENKINS_HOME/jenkins.yaml'
#docker exec jenkins bash -c 'sed -e "/{SSH_PRIVATE_KEY}/{r $JENKINS_HOME/.ssh/id_rsa" -e "d}" $JENKINS_HOME/jenkins.yaml > $JENKINS_HOME/jenkins_back.yaml && yes | cp -rf $JENKINS_HOME/jenkins_back.yaml $JENKINS_HOME/jenkins.yaml'
#docker exec jenkins bash -c 'rm -f $JENKINS_HOME/jenkins_back.yaml'

echo "[AGENT] Add jenkins keys to authorized_keys"
docker exec agent bash -c 'cat /ssh_keys/jenkins.pub >> ~/.ssh/authorized_keys && chmod 0644 ~/.ssh/authorized_keys'

echo "[JENKINS] Add agent.jenkins.net to known known_hosts"
docker exec jenkins bash -c 'ssh-keyscan agent.jenkins.net >> ~/.ssh/known_hosts'

# sed -e "/{SSH_PRIVATE_KEY}/{r $JENKINS_HOME/.ssh/id_rsa" -e "d}" $JENKINS_HOME/jenkins.yaml > $JENKINS_HOME/jenkins_back.yaml
# docker exec jenkins bash -c 'tr "\n" "\n\t\t\t\t\t\t" < /certs/client/cert.pem > out.txt'

# tr "\n" "\t\t\t\t\t\t" < /certs/client/cert.pem > /var/jenkins_home/cert.back