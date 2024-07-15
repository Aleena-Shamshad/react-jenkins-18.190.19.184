pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/Aleena-Shamshad/react-jenkins-18.190.19.184.git'
            }
        }

        stage('Install Dependencies') {
            steps {
                sh 'npm install'
            }
        }

        stage('Build') {
            steps {
                sh 'npm run build'
            }
        }

        stage('Deploy') {
            steps {
                sh '''
                sudo cp -r build/* /var/www/html/
                sudo systemctl restart nginx
                '''
            }
        }
    }
}
