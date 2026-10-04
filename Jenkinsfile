
pipeline {
    agent any

    stages {

        stage('Checkout') {
            steps {
                echo 'Checking out code from GitHub...'
                checkout scm
            }
        }

        stage('Build') {
            steps {
                echo 'Checking Python application files...'
                bat 'python --version'
                bat 'python -m py_compile combine.py'
                bat 'python -m py_compile nutrition_engine.py'
                bat 'python -m py_compile train.py'
            }
        }

        stage('Test') {
            steps {
                echo 'Running basic Python validation...'
                bat 'python -m py_compile combine.py'
                bat 'python -m py_compile nutrition_engine.py'
                bat 'python -m py_compile train.py'
            }
        }

        stage('Security Scan') {
            steps {
                echo 'Running dependency security check...'
                bat 'python -m pip check'
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
            echo 'BiteWise DEVSECOPS PIPELINE PASSED'
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

