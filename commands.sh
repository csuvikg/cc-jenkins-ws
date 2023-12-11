#!/bin/bash

python3 -m venv venv
. venv/bin/activate
pip3 install -r cicd-requirements.txt

pytest
pylint app.py --fail-under=8.0

docker build -t dind-jenkins jenkins
docker run -v /var/run/docker.sock:/var/run/docker.sock -p 8080:8080 dind-jenkins
