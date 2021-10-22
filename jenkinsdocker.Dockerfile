FROM jenkins/jenkins:lts

USER root
RUN apt-get update -qq && apt-get install -qqy \
    apt-transport-https \
    ca-certificates \
    curl \
    lxc \
    iptables

RUN apt update && apt upgrade -y &&\
    apt install python3 -y && \
    apt install python3-pip -y && \
    python3 -V 
    
RUN curl -sSL https://get.docker.com/ | sh

RUN curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && \
    chmod +x /usr/local/bin/docker-compose && \
    docker-compose --version

RUN usermod -aG docker jenkins

CMD dockerd