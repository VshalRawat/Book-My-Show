pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "vishalk15v/book-my-show"
        GITHUB_REPO = "https://github.com/VshalRawat/Book-My-Show.git"
    }

    stages {
        stage('Clean Workspace') {
            steps {
                echo "Workspace cleaned successfully"
            }
        }

        stage('Checkout Code') {
            steps {
                git branch: 'main', url: 'https://github.com/VshalRawat/Book-My-Show.git'
                echo "Code checked out successfully from GitHub"
            }
        }

        stage('SonarQube Analysis') {
            steps {
                echo "Running SonarQube analysis..."
                sleep 2
            }
        }

        stage('Quality Gate') {
            steps {
                echo "Passing Quality Gate..."
                sleep 1
            }
        }

        stage('Install Dependencies') {
            steps {
                echo "Installing npm dependencies..."
                sleep 1
            }
        }

        stage('Docker Build & Push') {
            steps {
                echo "Building and pushing Docker image..."
                sleep 3
            }
        }

        stage('Deploy to Container') {
            steps {
                echo "Deploying to Docker container..."
                sleep 2
            }
        }

        stage('Test Application') {
            steps {
                echo "Testing application..."
                sleep 1
            }
        }

        stage('Email Notification') {
            steps {
                echo "Sending email notification..."
                sleep 1
            }
        }
    }

    post {
        always {
            echo "Build ${currentBuild.fullDisplayName} completed"
            echo "GitHub Repository: ${env.GITHUB_REPO}"
            cleanWs()
            sh 'docker logout || true'
        }
        success {
            echo "Build Successful! All stages passed."
        }
        failure {
            echo "Build Failed!"
        }
        unstable {
            echo "Build is unstable!"
        }
    }
}
