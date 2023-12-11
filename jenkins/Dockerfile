# Use the official Jenkins runner base image
FROM jenkins/jenkins:latest

# Switch to root user
USER root

RUN apt update && apt install -y python3 python3-pip python3-venv

# Install docker
RUN curl -fsSL https://get.docker.com -o get-docker.sh && sh get-docker.sh
