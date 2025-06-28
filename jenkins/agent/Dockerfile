FROM ubuntu:22.04

USER root

RUN apt-get -q update

RUN apt-get -q --yes --force-yes install ca-certificates curl

RUN install -m 0755 -d /etc/apt/keyrings

RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc

RUN chmod a+r /etc/apt/keyrings/docker.asc

RUN echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
  tee /etc/apt/sources.list.d/docker.list > /dev/null

RUN apt-get -q --yes --force-yes update

RUN apt-get -q --yes --force-yes install docker-ce-cli \
    openssh-server \
    openssh-client \
    openjdk-17-jdk

RUN ssh-keygen -f ~/.ssh/id_rsa -P ""

RUN chmod 0700 ~/.ssh && \
    touch ~/.ssh/authorized_keys

COPY entry-point.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]