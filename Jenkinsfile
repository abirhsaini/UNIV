pipeline{
    agent any
    
    environment {
        sonarQube = credentials('sonarqube')
    }
    stages{
        stage("check sonar quality"){
            
            steps{

                script {
                    sh 'mvn clean install -e'
                    sh 'mvn sonar:sonar -Dsonar.token=${sonarQube}'
                }
            }
        }
    }
}
