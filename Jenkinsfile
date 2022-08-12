pipeline {
        agent any
        environment{
            registryCredential = 'dockerhub'
        }
        tools {
                maven 'mavenpro'
                dockerTool 'dockerpro'
        }

        stages {
                stage('Fetch') {
                        steps {
                                git url : "https://github.com/taiqp/lavoro.git", branch : "main", credentialsId : "github"
                        }
                }

                stage('Build') {
                        agent {
                                docker{
                                        image 'maven:3.8.6-openjdk-8'
                                        reuseNode true
                                }
                        }
                        steps {
                                sh 'mvn clean install -DskipTests'

                        }
                }

                stage('Test') {
                        agent {
                                docker{
                                        image 'maven:3.8.6-openjdk-8'
                                        reuseNode true
                                }
                        }
                        steps {
                                sh 'mvn test'
                        }
                }

                stage('Verify') {
                        agent {
                                docker{
                                        image 'maven:3.8.6-openjdk-8'
                                        reuseNode true
                                }
                        }
                        steps {
                                sh 'mvn verify'
                        }
                }

                stage('Docker Build') {
                        steps {
                            
                            script{
                              dockerImage = docker.build("taiqp/vprofileapp:v$BUILD_NUMBER", "./")
                               // sh 'docker build -t taiqp/vprofileapp:v100 .'
                            }
                        }
                }

                stage('Docker Push') {
                        steps {
                            script {
                                docker.withRegistry("", registryCredential){
                                    dockerImage.push("v$BUILD_NUMBER")
                                    dockerImage.push('latest')
                                }
                }
                        }
                }

        }
}

