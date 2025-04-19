pipeline {
    agent any  // Use any available agent/node

    environment {
        // Define environment variables here if needed
        MY_ENV = "production"
    }

    stages {
        stage('Checkout') {
            steps {
                echo "Checking out code..."
                checkout scm
            }
        }

        stage('Build') {
            steps {
                echo "Building the project..."
                // Example build command
                sh './build.sh'
            }
        }

        stage('Test') {
            steps {
                echo "Running tests..."
                // Example test command
                sh './run-tests.sh'
            }
        }

        stage('Deploy') {
            when {
                branch 'main'  // Deploy only if on 'main' branch
            }
            steps {
                echo "Deploying to production..."
                // Example deployment command
                sh './deploy.sh'
            }
        }
    }

    post {
        always {
            echo "Cleaning up..."
        }
        success {
            echo "Pipeline succeeded!"
        }
        failure {
            echo "Pipeline failed."
        }
    }
}
