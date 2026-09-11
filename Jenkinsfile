pipeline {
    agent any

    environment {
        IMAGE = 'anadi07/flaskapp'
        AWS_REGION = 'ap-south-1'
        EKS_CLUSTER = 'devops-eks'
    }

    stages {
        stage('Checkout') {
            steps { checkout scm }
        }

        stage('Test') {
            steps {
                sh 'python3 -m venv .venv && . .venv/bin/activate && pip install -r app/requirements.txt pytest && pytest -q'
            }
        }

        stage('Docker Build') {
            steps {
                sh 'docker build -t ${IMAGE}:${BUILD_NUMBER} .'
            }
        }

        stage('Docker Push') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'dockerhub',
                    usernameVariable: 'DOCKER_USER',
                    passwordVariable: 'DOCKER_TOKEN'
                )]) {
                    sh 'echo "$DOCKER_TOKEN" | docker login -u "$DOCKER_USER" --password-stdin'
                    sh 'docker tag ${IMAGE}:${BUILD_NUMBER} ${IMAGE}:${BUILD_NUMBER}'
                    sh 'docker push ${IMAGE}:${BUILD_NUMBER}'
                }
            }
        }

        stage('Deploy to EKS') {
            steps {
                sh 'aws eks update-kubeconfig --region ${AWS_REGION} --name ${EKS_CLUSTER}'
                sh 'helm upgrade --install flask-app ./helm/flask-app --namespace flask-app --create-namespace --set image.repository=${IMAGE} --set image.tag=${BUILD_NUMBER}'
            }
        }
    }
}
