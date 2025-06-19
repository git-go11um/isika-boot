pipeline {
    agent any
    tools {
            maven 'Maven' // Assurez-vous que Maven est configuré dans Jenkins sous le nom 'Maven'
        }
    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerhub') // Use your credentials ID
    }
    stages {
        stage('Checkout') {
            steps {
                echo '---- Polling from SCM ----'
                git branch: 'main', url: 'https://github.com/git-go11um/isika-boot'
            }
        }
        stage('Compile') {
            steps {
                echo '---- Compilling code ----'
                bat 'mvn compile'
            }
        }
        stage('Test Unitaire') {
            steps {
                echo '---- Running Unit Tests ----'
                bat 'mvn test'
            }
        }
        stage('Package') {
            steps {
                echo '---- Building JAR ----'
                bat 'mvn package -DskipTests'
            }
        }
        
        stage('Push Docker Image') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'docker-hub-creds', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                bat "docker login -u %DOCKER_USER% -p %DOCKER_PASS%"
                bat "docker build -t %DOCKER_USER%/mon-image:latest ."
                bat "docker push %DOCKER_USER%/mon-image:latest"
                }
            }
        }
        stage('Deploy') {
            steps {
                echo '---- Deploy to Docker ----'
                bat 'docker rm -f mon-image || echo "Pas de conteneur à supprimer"'
                bat 'docker run -d --name mon-image -p 8980:8980 mon-image'
            }
        }
    }
    
}