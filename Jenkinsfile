pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "vishalk15v/book-my-show"
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
                echo "Run SonarQube Scan here (requires SonarQube setup)"
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
                        sh """
                          echo 'Logging in to DockerHub...'
                          echo \$DOCKER_HUB_PASSWORD | docker login -u \$DOCKER_HUB_USERNAME --password-stdin
                          
                          echo 'Building Docker Image...'
                          docker build -t ${DOCKER_IMAGE}:${BUILD_NUMBER} .
                          
                          echo 'Tagging as latest...'
                          docker tag ${DOCKER_IMAGE}:${BUILD_NUMBER} ${DOCKER_IMAGE}:latest
                          
                          echo 'Pushing to DockerHub...'
                          docker push ${DOCKER_IMAGE}:${BUILD_NUMBER}
                          docker push ${DOCKER_IMAGE}:latest
                        """
                    }
                }
            }
        }

        stage('Deploy to Docker Container') {
            steps {
                script {
                    sh """
                      docker stop bms_app || true
                      docker rm bms_app || true
                      docker run -d --name bms_app -p 3000:3000 ${DOCKER_IMAGE}:${BUILD_NUMBER}
                    """
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
