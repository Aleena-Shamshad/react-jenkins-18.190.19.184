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
                sh 'npm install -g @angular/cli'
                sh 'npm install'
            }
        }

        stage('Build') {
            steps {
                sh 'ng build --prod'
            }
        }

        stage('Deploy') {
            steps {
                sh '''
                sudo cp -r dist/* /var/www/html/
                sudo systemctl restart nginx
                '''
            }
        }
    }
}
