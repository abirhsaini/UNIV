pipeline{
    agent any
    
    environment {
        sonarQube = credentials('sonarqube')
    }
    stages{
        stage("check sonar quality"){
            agent{
                docker {
                    image 'maven:latest' 
                    

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
