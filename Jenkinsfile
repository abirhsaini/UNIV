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
                    timeout(time: 1,unit: "HOURS"){
                        def gp=waitForQualityGate()
                        if (gp.status!= "OK"){
                            error "Pipline aborted due to quality gate failure ${gp.status}"
                        }
                    }
                    
                }
            }
        }
    }
}
