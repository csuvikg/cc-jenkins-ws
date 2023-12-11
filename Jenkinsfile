pipeline {
    agent any

    environment {
        PYLINT_SCORE = '8.0'
        DOCKER_REGISTRY = 'csuvikg'
        DOCKER_IMAGE = 'python-cicd-test'
        DOCKER_TAG = 'latest'
    }

    stages {
        stage('Install Dependencies') {
            steps {
                script {
                    sh '''
                    python3 -m venv venv
                    . venv/bin/activate
                    pip3 install -r cicd-requirements.txt
                    '''
                }
            }
        }

        stage('Run Pytest') {
            steps {
                sh '. venv/bin/activate && pytest'
            }
        }

        stage('Run Pylint') {
            steps {
                sh ". venv/bin/activate && pylint --fail-under=${env.PYLINT_SCORE} app.py"
            }
        }

        stage('Build Docker Image') {
            steps {
                sh "docker build -t ${env.DOCKER_REGISTRY}/${env.DOCKER_IMAGE}:${env.DOCKER_TAG} ."
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: 'docker-registry-credentials', usernameVariable: 'REGISTRY_USER', passwordVariable: 'REGISTRY_PASS')]) {
                        sh "docker login ${env.DOCKER_REGISTRY} -u ${REGISTRY_USER} -p ${REGISTRY_PASS}"
                    }

                    sh "docker push ${env.DOCKER_REGISTRY}/${env.DOCKER_IMAGE}:${env.DOCKER_TAG}"
                }
            }
        }
    }
}
