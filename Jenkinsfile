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
                script{
                    sh 'sonar-scanner -Dsonar.projectKey=blog-clone0 -Dsonar.sources=. -Dsonar.host.url=http://localhost:9000  -Dsonar.token=sqp_9b3c17ee03b8c9126897776e58f3636058beebc9'
                     //sh 'docker run --rm -v $PWD:/usr/src -w /usr/src sonarsource/sonar-scanner-cli sonar-scanner -Dsonar.projectKey=blog-clone -Dsonar.sources=. -Dsonar.host.url=http://localhost:9000 -Dsonar.login=sqp_a8aab4c0d684a1cc0dcf76d2b2f9ab6a57286d57'
                  //sh 'sonar-scanner -Dsonar.projectKey=blog-clone -Dsonar.sources=. -Dsonar.host.url=http://localhost:9000 -Dsonar.token=sqp_a8aab4c0d684a1cc0dcf76d2b2f9ab6a57286d57'
                    }
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
