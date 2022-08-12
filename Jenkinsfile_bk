pipeline {
	agent any

	tools {
		maven 'mavenpro'	
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
					args '-v $(pwd):/usr/src/mymaven'
					reuseNode true
				}
			}
			steps {
				sh 'mvn clean install -DskipTests'

			}
		}

		stage('Test') {
			steps {
				sh 'mvn test'
			}
		}

		stage('Verify') {
			steps {
				sh 'mvn verify'
			}
		}

		stage('Docker Build') {
			steps {
			//	dockerImage = docker.build("taiqp/vprofileapp:v$BUILD_NUMBER", "./")
				sh 'docker build -t taiqp/vprofileapp:v100 .'
			}

		}

	}
}
