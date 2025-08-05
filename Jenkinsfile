pipeline {
    agent any

    environment {
        IMAGE_NAME = "my-static-site"
        DOCKERHUB_USERNAME = "shubhamtakalikar1@gmail.com" // Replace this
    }

    stages {
        stage('Clone Repo') {
            steps {
                git 'https://github.com/'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh "docker build -t $IMAGE_NAME ."
                }
            }
        }

        stage('Push to DockerHub') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub-creds', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                    sh """
                        echo "$PASSWORD" | docker login -u "$USERNAME" --password-stdin
                        docker tag $IMAGE_NAME $DOCKERHUB_USERNAME/$IMAGE_NAME
                        docker push $DOCKERHUB_USERNAME/$IMAGE_NAME
                    """
                }
            }
        }

        stage('Deploy Container') {
            steps {
                sh """
                    docker rm -f static-site || true
                    docker run -d --name static-site -p 8080:80 $DOCKERHUB_USERNAME/$IMAGE_NAME
                """
            }
        }
    }
}
