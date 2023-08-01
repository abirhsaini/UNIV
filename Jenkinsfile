pipeline{
    agent any
    
    environment {
        sonarQube = credentials('sonarqube')
    }
    stages{
        stage("check sonar quality"){
            agent{
                docker {
                    image 'abirhsaini/maven-with-sonarqube:latest' 
                    args '-v /var/jenkins_home/.m2:/root/.m2'
                    

                }
            }
            steps{

                script {
                    sh 'mvn clean install -e'
                    sh 'mvn sonar:sonar -Dsonar.token=${sonarQube}'
                }
            }
        }
    }
}
