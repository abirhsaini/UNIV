pipeline{
    agent agent1
    
    environment {
        sonarQube = credentials('sonarqube')
    }
    stages{
        stage("check sonar quality"){
            agent{
                docker {
                    image 'openjdk:17'
                }
            }
            steps{

                script {
                    sh 'mvn clean install'
                    sh 'mvn sonar:sonar -Dsonar.token=${sonarQube}'
                }
            }
        }
    }
}
