pipeline {
  agent any

  environment {
    IMAGE_NAME = "shoeshop-app"
    TAG = "latest"
  }

  stages {
    stage('Clone code') {
      steps {
        git url: 'https://github.com/Thisorp/shoeshop-devops.git', branch: 'main'
      }
    }

    stage('Build JAR') {
      steps {
	sh 'docker run --rm -v "$PWD":/app -w /app maven:3.8.7-openjdk-17 mvn clean package -DskipTests'
      }
    }

    stage('Build Docker Image') {
      steps {
        sh 'docker build -t $IMAGE_NAME:$TAG .'
      }
    }

    stage('Deploy with Docker Compose') {
      steps {
        sh 'docker-compose down || true'
        sh 'docker-compose up -d'
      }
    }
  }
}
