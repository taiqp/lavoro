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
