FROM jenkins/jenkins:2.504.1-lts-jdk17

COPY jenkins-cli.jar /usr/bin/jenkins-cli.jar
COPY jenkins.yaml /var/jenkins_home/jenkins.yaml

# plugins
RUN jenkins-plugin-cli --plugins docker-plugin \
    artifactory \
    jfrog \
    parameterized-trigger \
    configuration-as-code \
    envinject \
    pipeline-stage-view

USER root

# ssh client and keys
RUN apt -q --yes --force-yes install openssh-client

RUN mkdir $JENKINS_HOME/.ssh/ && \
    touch $JENKINS_HOME/.ssh/known_hosts && \
    ssh-keygen -f $JENKINS_HOME/.ssh/id_rsa -P "" && \
    chown -R jenkins $JENKINS_HOME/.ssh/ && \
    mkdir /ssh_keys && chown jenkins /ssh_keys && \
    cp $JENKINS_HOME/.ssh/id_rsa.pub /ssh_keys/jenkins.pub

RUN chown jenkins /var/jenkins_home/jenkins.yaml && \
    chown jenkins /usr/bin/jenkins-cli.jar

COPY entry-point.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["sh", "/entrypoint.sh"]

USER jenkins