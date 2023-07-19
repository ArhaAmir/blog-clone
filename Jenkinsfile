pipeline {
    agent any
    tools {SonarQube "sonar_zip"}
    //tool name: 'sonar_zip', type: 'hudson.plugins.sonar.SonarRunnerInstallation'

    stages {
        stage('Checkout') {
            steps {
                echo 'checkout'
                // Fetch code from a Git repository
                git 'https://github.com/ArhaAmir/blog-clone.git'
            }
        }
         
        stage('login') {
            steps {
                echo 'logging in'
                // Login in docker hub
                sh 'docker login -u arhaamir -p arhaamir1'
            }
        }

        stage('Build') {
            steps {
                sh 'docker build -t arhaamir/blog-clone-image:latest .'
                // Assuming your build steps, e.g., compiling code, running tests, etc.
                // Replace this with actual build commands for your project
                //sh 'your_build_command_here'
                echo 'building'
            }
        }

        stage('Deploy') {
            steps {
                sh 'docker push arhaamir/blog-clone-image:latest'
                echo 'Pushing to DockerHub'
                // Assuming you have a web server where you want to deploy the built code
                // Replace 'your_server' and 'your_web_root' with appropriate values
                echo 'deploying'
            }
        }
    }
}
