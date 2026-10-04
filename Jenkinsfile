
pipeline {
    agent any

    stages {

        stage('Checkout') {
            steps {
                echo 'Checking out code from GitHub...'
                checkout scm
            }
        }

        stage('Frontend Install') {
            steps {
                echo 'Installing frontend dependencies...'
                dir('frontend') {
                    bat 'npm install'
                }
            }
        }

        stage('Frontend Build') {
            steps {
                echo 'Building React frontend...'
                dir('frontend') {
                    bat 'npm run build'
                }
            }
        }

        stage('Python Check') {
            steps {
                echo 'Checking Python files...'
                bat 'python --version'
                bat 'python -m py_compile nutrition_engine.py'
                bat 'python -m py_compile combine.py'
            }
        }
    }

    post {
        success {
            echo '======================================'
            echo 'BiteWise CI Pipeline PASSED'
            echo '======================================'
        }

        failure {
            echo '======================================'
            echo 'BiteWise CI Pipeline FAILED'
            echo 'Check the Console Output'
            echo '======================================'
        }
    }
}
```
