FROM jenkins/jenkins:jdk17
USER root
RUN groupadd docker
RUN apt-get update && apt-get install -y lsb-release
RUN curl -fsSLo /usr/share/keyrings/docker-archive-keyring.asc \
  https://download.docker.com/linux/debian/gpg
RUN echo "deb [arch=$(dpkg --print-architecture) \
  signed-by=/usr/share/keyrings/docker-archive-keyring.asc] \
  https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list
RUN apt-get update && apt-get install -y docker-ce-cli

RUN usermod -aG docker jenkins
RUN touch /var/run/docker.sock && \
    chmod 777 /var/run/docker.sock

USER jenkins
RUN jenkins-plugin-cli --plugins "blueocean docker-workflow"
