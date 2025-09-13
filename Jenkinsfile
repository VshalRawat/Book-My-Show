pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "vishalk15v/book-my-show"
    }

    tools {
        sonarScanner 'SonarScanner' // This should match the name in Jenkins Global Tool Configuration
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
                withSonarQubeEnv('MySonarQube') { 
                    dir('bookmyshow-app') {
                        sh 'sonar-scanner -Dsonar.projectKey=book-my-show -Dsonar.sources=src'
                    }
                }
            }
        }

        stage('Install Dependencies') {
            steps {
                dir('bookmyshow-app') {
                    sh 'npm install'
                }
            }
        }

        stage('Docker Build & Push') {
            steps {
                dir('bookmyshow-app') {
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
        }

        stage('Deploy to Docker Container') {
            steps {
                script {
                    sh 'docker stop bms_app || true'
                    sh 'docker rm bms_app || true'
                    sh "docker run -d --name bms_app -p 3000:3000 ${env.DOCKER_IMAGE}:${env.BUILD_NUMBER}"
                }
            }
        }

        stage('Email Notification') {
            steps {
                mail to: 'vishalrawat27m@gmail.com',
                     subject: "Jenkins Build ${currentBuild.fullDisplayName}",
                     body: "Build Status: ${currentBuild.currentResult}\nCheck console output at ${env.BUILD_URL}"
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
