pipeline {

agent any

stages {

stage('Clone Code') {
steps {
git 'https://github.com/shubh-2344/DevOps2024.git'
}
}

stage('Build with Maven') {
steps {
sh 'mvn clean package'
}
}

stage('Run Tests') {
steps {
sh 'mvn test'
}
}

stage('Build Docker Image') {
steps {
sh 'docker build -t devops2024 .'
}
}

stage('Deploy with Docker Compose') {
steps {
sh 'docker-compose down'
sh 'docker-compose up -d --build'
}
}

}

}