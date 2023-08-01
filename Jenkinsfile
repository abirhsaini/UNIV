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
                    args '-v /root/.m2:/root/.m2' 

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
