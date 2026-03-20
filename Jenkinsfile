pipeline {
    agent any

    environment {
        REMOTE_HOST = "163.53.201.45"
        REMOTE_USER = "oyster"
        APP_NAME = "devops-app"
    }

    stages {

        stage('Clone Code') {
            steps {
                git 'https://github.com/shubh-2344/DEvOps-Pro.git'
            }
        }

        stage('Copy Files to Server') {
            steps {
                sshagent(['remote-server']) {
                    sh '''
                    scp -o StrictHostKeyChecking=no -r * $REMOTE_USER@$REMOTE_HOST:/home/$REMOTE_USER/$APP_NAME
                    '''
                }
            }
        }

        stage('Deploy on Remote Server') {
            steps {
                sshagent(['remote-server']) {
                    sh '''
                    ssh -o StrictHostKeyChecking=no $REMOTE_USER@$REMOTE_HOST << EOF

                    cd /home/$REMOTE_USER/$APP_NAME

                    # Stop & remove old container
                    docker stop $APP_NAME || true
                    docker rm $APP_NAME || true

                    # Remove old image (optional)
                    docker rmi $APP_NAME || true

                    # Build new image
                    docker build -t $APP_NAME .

                    # Run container
                    docker run -d -p 8080:80 --name $APP_NAME $APP_NAME

                    EOF
                    '''
                }
            }
        }
    }
}