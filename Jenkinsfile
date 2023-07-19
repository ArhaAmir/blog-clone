pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                echo 'checkout'
                // Fetch code from a Git repository
                git 'https://github.com/ArhaAmir/blog-clone.git'
            }
        }
         stage('SonarQube Analysis') {
            steps {
                sh '/sonar-scanner-4.2.0.1873-linux/bin/sonar-scanner  -Dsonar.projectKey=project -Dsonar.sources=. -Dsonar.host.url=http://172.17.0.2:9000 -Dsonar.login=sqp_3bc9819d208d136d55a9433c2f8a1d4dd26c0019'
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
