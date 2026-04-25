pipeline {
    agent any

    environment {
        APP_NAME = "sync-service"
        BUILD_ARTIFACT = "target/sync-service.jar"
    }

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build') {
            steps {
                sh 'mvn clean package -DskipTests'
            }
        }

        stage('Run Tests') {
            steps {
                sh 'mvn test'
            }
        }

        stage('Deploy to QA') {
            when {
                branch 'develop'
            }
            steps {
                sh 'bash deploy.sh qa'
            }
        }

        stage('Deploy to Staging') {
            when {
                branch 'staging'
            }
            steps {
                sh 'bash deploy.sh staging'
            }
        }

        stage('Approval for Production') {
            when {
                branch 'main'
            }
            steps {
                input message: "Approve Production Deployment?"
            }
        }

        stage('Deploy to Production') {
            when {
                branch 'main'
            }
            steps {
                sh 'bash deploy.sh prod'
            }
        }
    }

    post {
        success {
            echo "Deployment successful"
        }
        failure {
            echo "Deployment failed"
        }
    }
}
