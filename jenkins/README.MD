**Jenkins**

Инфраструктура для поднятия Jenkins в Docker

Сервсиы:

| Сервис        | image                                                  | host                    | network//ip      | web             |
|---------------|--------------------------------------------------------|-------------------------|------------------|-----------------|
| Docker host   | docker:27.3-dind                                       | docker.jenkins.net      | net//172.10.0.10 |                 |
| Jenkins agent | docker:27.3-cli                                        | agent.jenkins.net       | net//172.10.0.11 |                 |
| Jenkins       | jenkins/jenkins:latest                                 | jenkins.net             | net//172.10.0.12 | localhost:8080  |
| Maildev       | maildev/maildev:2.1.0                                  | maildev.jenkins.net     | net//172.10.0.13 | localhost:1080  |
| Artifactory   | releases-docker.jfrog.io/jfrog/artifactory-oss:7.63.12 | artifactory.jenkins.net | net//172.10.0.14 | localhost:8082  |


> Building Docker Images using Jenkins: https://digitalavenue.dev/blog/2021-03-13-build-docker-images-jenkins/ </br>
> Docker in Docker with Docker Compose: https://jasongrace2282.github.io/blog/programming/docker-compose-with-dind.html </br>
> Docker network : https://habr.com/ru/articles/790212/ <br/>


**После первого запуска**

1. Меняем пароль jfrog artifactory
```shell
default - admin/password
```

1. Ssh ключи для подключения jenkins-agent -> jenkins
```shell
docker exec agent bash -c "cat /ssh_keys/jenkins.pub >> ~/.ssh/authorized_keys && chmod 0644 ~/.ssh/authorized_keys"
docker exec jenkins bash -c "ssh-keyscan agent.jenkins.net >> ~/.ssh/known_hosts"
```

2.  Credentials для агента

настройки -> credentials -> ssh-agent

```shell
docker exec jenkins bash -c "cat ~/.ssh/id_rsa"
```

3. Сертификаты для докера

настройки -> credentials -> docker

Client Key

```shell
docker exec jenkins bash -c "cat /certs/client/key.pem"
```
Client Certificate

```shell
docker exec jenkins bash -c "cat /certs/client/cert.pem"
```

Server CA Certificate 
```shell
docker exec jenkins bash -c "cat /certs/client/ca.pem"
```

4. Credentials для frogs

настройки -> credentials -> docker

пароль из пункта 1
