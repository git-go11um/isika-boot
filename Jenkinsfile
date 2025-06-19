pipeline {
    agent any

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
            }
        }
        stage('Test Unitaire') {
            steps {
                echo '---- Running Unit Tests ----'
            }
        }
        stage('Package') {
            steps {
                echo '---- Building JAR ----'
            }
        }
        stage('Building Image') {
            steps {
                echo '---- Building Image ----'
            }
        }
        stage('Deploy') {
            steps {
                echo '---- Deploy to Docker ----'
            }
        }
    }
}