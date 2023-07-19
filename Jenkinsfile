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
              withSonarQubeEnv('project') {
                sh 'mvn clean package sonar:project'
                    timeout(time: 1, unit: 'HOURS') {
                waitForQualityGate abortPipeline: true
              }
             script{
                 sh 'sonar-scanner -Dsonar.projectKey=project -Dsonar.sources=. -Dsonar.host.url=http://192.168.100.23:9000 -Dsonar.token=sqp_3bc9819d208d136d55a9433c2f8a1d4dd26c0019'
                    //sh 'sonar-scanner -Dsonar.projectKey=blog-clone0 -Dsonar.sources=. -Dsonar.host.url=http://192.168.1.105:9000  -Dsonar.token=sqp_9b3c17ee03b8c9126897776e58f3636058beebc9'
                sh 'docker run --network=host -e --rm -v $PWD:/usr/src -w /usr/src sonarsource/sonar-scanner-cli sonar-scanner -Dsonar.projectKey=blog-clone0 -Dsonar.sources=. -Dsonar.host.url=http://192.168.100.23:9000 -Dsonar.login=sqp_9b3c17ee03b8c9126897776e58f3636058beebc9'
                  //sh 'sonar-scanner -Dsonar.projectKey=blog-clone -Dsonar.sources=. -Dsonar.host.url=http://192.168.100.23:9000 -Dsonar.token=sqp_3bc9819d208d136d55a9433c2f8a1d4dd26c0019'
              }
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
