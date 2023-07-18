pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Fetch code from a Git repository
                git 'https://github.com/ArhaAmir/blog-clone.git'
            }
        }

        stage('Build') {
            steps {
                // Assuming your build steps, e.g., compiling code, running tests, etc.
                // Replace this with actual build commands for your project
                //sh 'your_build_command_here'
                echo 'building'
            }
        }

        stage('Deploy') {
            steps {
                // Assuming you have a web server where you want to deploy the built code
                // Replace 'your_server' and 'your_web_root' with appropriate values
                sh 'rails s'
                sh 'rsync -avz --delete your_local_build_folder/ your_server:your_web_root/'
            }
        }
    }

    post {
        success {
            // This block will be executed if the pipeline completes successfully
            echo 'Pipeline completed successfully!'
        }

        failure {
            // This block will be executed if the pipeline fails
            echo 'Pipeline failed!'
        }

        always {
            // This block will always be executed, regardless of pipeline success or failure
            // You can perform cleanup tasks or notifications here
        }
    }
}
