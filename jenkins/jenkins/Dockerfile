FROM jenkins/jenkins:2.504.1-lts-jdk17

RUN jenkins-plugin-cli --plugins docker-plugin
RUN jenkins-plugin-cli --plugins artifactory
RUN jenkins-plugin-cli --plugins jfrog
RUN jenkins-plugin-cli --plugins parameterized-trigger
RUN jenkins-plugin-cli --plugins configuration-as-code:1971.vf9280461ea_89
RUN jenkins-plugin-cli --plugins envinject

COPY jenkins-cli.jar /usr/bin/jenkins-cli.jar
COPY jenkins.yaml /var/jenkins_home/jenkins.yaml

USER root

RUN apt -q --yes --force-yes install openssh-client

RUN mkdir $JENKINS_HOME/.ssh/
RUN ssh-keygen -f $JENKINS_HOME/.ssh/id_rsa -P ""
RUN chown -R jenkins $JENKINS_HOME/.ssh/

RUN mkdir /ssh_keys && chown jenkins /ssh_keys

COPY entry-point.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

USER jenkins