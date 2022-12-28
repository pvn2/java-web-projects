pipeline{
    agent any
    
    //Global tool configuration maven apath
    tools {
        maven "maven"
    }
    
    stages{
        stage("Code checkout"){
            steps{
                git branch: 'develop', url: 'https://github.com/pvn2/java-web-projects.git'
            }
        }
        stage("Maven build"){
            steps{
                sh "mvn clean package"
            }
        }
        stage("Sonar report"){
            steps{
                sh "mvn sonar:sonar"
            }
        }
        stage("Upload artifact in nexus"){
            steps{
                sh "mvn clean deploy"
            }
        }
        stage("Deploy application in tomcat"){
            steps{
             sshagent(['dd675ca7-b8ba-4c28-b021-564f76677c14']) {
             sh "scp -o StrictHostKeyChecking=no /var/lib/jenkins/workspace/PipelineJobScriptedWay-01/target/LoginRegisterApp.war ec2-user@3.109.216.181:/etc/apache-tomcat-9.0.70/webapps/"
                }
            }
        }
    }
    
}