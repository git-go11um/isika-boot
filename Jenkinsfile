pipeline {
    agent any
    tools {
            maven 'Maven' // Assurez-vous que Maven est configuré dans Jenkins sous le nom 'Maven'
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
        stage('Building Image') {
            steps {
                echo '---- Building Image ----'
                bat 'docker build -t mon-image .'
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
    post {
        always {
            // Publie les résultats des tests
            junit '**/target/surefire-reports/*.xml'
        }
        success {
            echo 'Pipeline succeeded!'
        }
        failure {
            echo 'Pipeline failed!'
        }
    }
}