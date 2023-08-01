pipeline{
    agent any
    
    environment {
        sonarQube = credentials('sonarqube')
    }
    stages{
        stage("check sonar quality"){
            
            steps{

                script {
                    withSonarQubeEnv(credentialsID:'sonarqube'){
                        sh 'mvn clean install '
                        sh 'mvn sonar:sonar '

                    }
                    
                }
            }
        }
    }
}
