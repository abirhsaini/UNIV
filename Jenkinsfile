pipeline{
    agent any
    
    environment {
        sonarQube = credentials('sonarqube')
        VERSION = "${env.BUILD_ID}"
    }
    stages{
        // stage("check sonar quality"){
            
        //     steps{
        //         script {
        //             agent {
        //                 docker {
        //                 image 'maven:3.8.3-jdk-8' // Spécifiez ici l'image Docker avec Maven que vous souhaitez utiliser
        //                 args '-v /var/run/docker.sock:/var/run/docker.sock' // Montez le socket Docker pour pouvoir exécuter des commandes Docker à l'intérieur du conteneur
        //                 }
        //             }
        //             withSonarQubeEnv(credentialsID:'sonarqube'){
        //                 sh 'mvn clean install '
        //                 sh 'mvn sonar:sonar '
        //             }
        //             // timeout(time: 1,unit: "HOURS"){
        //             //     def gp=waitForQualityGate()
        //             //     if (gp.status!= "OK"){
        //             //         error "Pipline aborted due to quality gate failure ${gp.status}"
        //             //     }
        //             // }
                    
        //         }
        //     }
        // }
        stage(" docker build and push "){
            steps {
                script {
                    withCredentials([string(credentialsId: 'nexus-password', variable: 'nexus_password')]) {
                        sh "docker login -u admin -p ${nexus_password} nexus:8083"
                        sh "docker compose up -d"
                        sh "docker push nexus:8081/univ:${JENKINS_BUILD_ID}"
                        
                    }

                }

            }
        }
    }
}
