**Jenkins**

Инфраструктура для поднятия Jenkins в Docker

Building Docker Images using Jenkins: https://digitalavenue.dev/blog/2021-03-13-build-docker-images-jenkins/ </br>
Docker in Docker with Docker Compose: https://jasongrace2282.github.io/blog/programming/docker-compose-with-dind.html </br>
Docker network : https://habr.com/ru/articles/790212/ <br/>

Сервсиы:

    | Сервис        | image                             | host                   | network//ip          | volumes  |
    | ------------- | --------------------------------- |------------------------| -------------------- | -------- |
    | Docker host   | docker:27.3-dind                  | docker.jenkins.net     | net//172.10.0.1      |          |
    | Jenkins agent | docker:27.3-cli                   | agent.jenkins.net      | net//172.10.0.2      |          |
    | Jenkins       | jenkins/jenkins:2.504.1-lts-jdk17 | jenkins.net          | net//172.10.0.3      |          |
    | Maildev       | maildev/maildev:2.1.0             | maildev.jenkins.net  | net//172.10.0.4      |          |

