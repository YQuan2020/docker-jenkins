FROM jenkins/jenkins:lts
MAINTAINER YQ
EXPOSE 8080 50000
USER root
# Install prerequisites for Docker
RUN apt-get update && apt-get install -y sudo build-essential libltdl7 && rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["/sbin/tini", "--", "/usr/local/bin/jenkins.sh"]

