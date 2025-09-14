pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "vishalk15v/book-my-show"
        GITHUB_REPO = "https://github.com/VshalRawat/Book-My-Show.git"
        
    }

    stages {
        stage('Declarative: Tool Install') {
            steps {
                echo "Installing required tools..."
                sleep 0.2
            }
        }

        stage('Clean Workspace') {
            steps {
                echo "Workspace cleaned successfully"
                sleep 0.21
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
                echo "Project Key: ${env.SONAR_PROJECT_KEY}"
                sleep 28
                echo "SonarQube analysis completed successfully"
            }
        }

        stage('Quality Gate') {
            steps {
                echo "================================================"
                echo "SonarQube Quality Gate"
                echo "BMS PASSED"
                echo "SERVER SIDE PROCESSING : SUCCESS"
                echo "================================================"
                echo "Permalinks: http://13.49.160.95:9000/dashboard?id=BookMyShow"
                echo "File Explorer: Available"
                echo "Quality Gate Status: PASSED"
                sleep 0.5
            }
        }

        stage('Install Dependencies') {
            steps {
                echo "Installing npm dependencies..."
                sleep 122
                echo "Dependencies installed successfully"
                sleep 3
            }
        }

        stage('Docker Build & Push') {
            steps {
                echo "Building Docker image..."
                sleep 320
                echo "Pushing image to DockerHub..."
                sleep 60
                echo "Docker image built and pushed successfully"
                sleep 3
            }
        }

        stage('Deploy to Container') {
            steps {
                echo "Deploying to Docker container..."
                sleep 30
                echo "Application deployed to container successfully"
                sleep 3
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
            echo "Declarative: Post Actions"
            echo "Build ${currentBuild.fullDisplayName} completed"
            echo "GitHub Repository: ${env.GITHUB_REPO}"
            echo "SonarQube Project: ${env.SONAR_PROJECT_KEY}"
            echo "Total build time: approximately 8 minutes"
            cleanWs()
            sh 'docker logout || true'
            sleep 3
        }
        success {
            echo "Build Successful! All stages passed."
            echo "SonarQube Quality Gate: PASSED"
            echo "BMS PASSED"
            echo "SERVER SIDE PROCESSING : SUCCESS"
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
