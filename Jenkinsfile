pipeline {
    agent any

    stages {

        stage('Checkout') {
            steps {
                echo 'Checking out code from GitHub...'
                checkout scm
            }
        }

        stage('Install Dependencies') {
            steps {
                echo 'Installing frontend dependencies...'
                dir('frontend') {
                    bat 'npm install'
                }
            }
        }

        stage('Build') {
            steps {
                echo 'Building frontend application...'
                dir('frontend') {
                    bat 'npm run build'
                }
            }
        }

        stage('Test') {
            steps {
                echo 'Running tests...'
                dir('frontend') {
                    bat 'npm test -- --watchAll=false'
                }
            }
        }

        stage('Security Scan') {
            steps {
                echo 'Running basic security checks...'
                dir('frontend') {
                    bat 'npm audit --audit-level=high'
                }
            }
        }

        stage('Docker Build') {
            steps {
                echo 'Building Docker image...'
                bat 'docker build -t bitewise:latest .'
            }
        }
    }

    post {
        success {
            echo '======================================'
            echo 'BiteWise CI/CD PIPELINE PASSED'
            echo '======================================'
        }

        failure {
            echo '======================================'
            echo 'BiteWise PIPELINE FAILED'
            echo 'Check the Console Output'
            echo '======================================'
        }
    }
}
