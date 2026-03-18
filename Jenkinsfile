pipeline {

agent any

stages {

stage('Clone Code') {
steps {
git 'https://github.com/shubh-2344/DevOps2024.git'
}
}

stage('Build Project') {
steps {
sh 'mvn clean package'
}
}

stage('Deploy Website') {

steps {

sshagent(['deploy-server']) {

sh '''
ssh root@163.53.201.45 "

cd /opt/devops2024

if [ ! -d .git ]; then
git clone https://github.com/shubh-2344/DevOps2024.git .
else
git pull
fi

docker-compose down
docker-compose up -d --build

"
'''

}

}

}

}

}