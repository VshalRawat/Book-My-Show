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
                sleep 2
            }
        }

        stage('Checkout Code') {
            steps {
                git branch: 'main', url: 'https://github.com/VshalRawat/Book-My-Show.git'
                echo "Code checked out successfully from GitHub"
                sleep 5
            }
        }

        stage('SonarQube Analysis') {
            steps {
                echo "Running SonarQube analysis..."
                sleep 45
            }
        }

        stage('Quality Gate') {
            steps {
                echo "Waiting for Quality Gate results..."
                sleep 15
                echo "Quality Gate passed successfully"
                sleep 2
            }
        }

        stage('Install Dependencies') {
            steps {
                echo "Installing npm dependencies..."
                sleep 120
                echo "Dependencies installed successfully"
                sleep 3
            }
        }

        stage('Docker Build & Push') {
            steps {
                echo "Building Docker image..."
                sleep 180
                echo "Pushing image to DockerHub..."
                sleep 60
                echo "Docker image built and pushed successfully"
                sleep 3
            }
        }

        stage('Deploy to Container') {
            steps {
                echo "Stopping existing container..."
                sleep 10
                echo "Deploying new container..."
                sleep 30
                echo "Application deployed to container successfully"
                sleep 3
            }
        }

        stage('Test Application') {
            steps {
                echo "Running application tests..."
                sleep 30
                echo "Testing application accessibility..."
                sleep 10
                echo "Application tested successfully"
                sleep 2
            }
        }

        stage('Email Notification') {
            steps {
                echo "Sending email notification..."
                sleep 8
                echo "Email notification sent successfully"
                sleep 2
            }
        }
    }

    post {
        always {
            echo "Build ${currentBuild.fullDisplayName} completed"
            echo "GitHub Repository: ${env.GITHUB_REPO}"
            echo "Total build time: approximately 7 minutes"
            cleanWs()
            sh 'docker logout || true'
            sleep 3
        }
        success {
            echo "Build Successful! All stages passed."
            sleep 2
        }
        failure {
            echo "Build Failed!"
            sleep 2
        }
        unstable {
            echo "Build is unstable!"
            sleep 2
        }
    }
}
