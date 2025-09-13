pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "vshalrawat/book-my-show:latest"
    }

    stages {
        stage('Clean Workspace') {
            steps {
                cleanWs()
            }
        }

        stage('Checkout Code') {
            steps {
                git branch: 'main', url: 'https://github.com/VshalRawat/Book-My-Show.git'
            }
        }

        stage('SonarQube Analysis') {
            steps {
                echo "Run SonarQube Scan here"
            }
        }

        stage('Install Dependencies') {
            steps {
                sh 'npm install'
            }
        }

        stage('Docker Build & Push') {
            steps {
                script {
                    docker.withRegistry('', 'Vishal-Dockerhub-Credentials') {
                        def img = docker.build("${env.DOCKER_IMAGE}:${env.BUILD_NUMBER}")
                        img.push()
                        sh "docker tag ${env.DOCKER_IMAGE}:${env.BUILD_NUMBER} ${env.DOCKER_IMAGE}:latest"
                        sh "docker push ${env.DOCKER_IMAGE}:latest"
                    }
                }
            }
        }

        stage('Deploy to Docker Container') {
            steps {
                script {
                    sh 'docker stop bms_app || true'
                    sh 'docker rm bms_app || true'
                    sh 'docker run -d --name bms_app -p 3000:3000 ${env.DOCKER_IMAGE}:${env.BUILD_NUMBER}'
                }
            }
        }
    }

    post {
        always {
            echo "Build finished!"
        }
        success {
            echo "Build and Deploy Successful!"
        }
        failure {
            echo "Build Failed!"
        }
    }
} 
