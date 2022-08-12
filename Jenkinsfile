pipeline {
	agent any
	stages {
		stage('Fetch') {
			steps {
				git url : "https://github.com/taiqp/lavoro.git", branch : "main", credentialIds : "github"
			}
		}
	}
}
