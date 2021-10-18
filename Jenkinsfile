pipeline {
    agent any

	options {
		skipDefaultCheckout(true)
	}

    stages {
		stage ('Clean & Checkout') {
			steps {
				cleanWs()
				checkout scm
			}
		}

        stage ('CI Test') {
            steps {	
                copyArtifacts(projectName: "/OliveTin/OliveTin-rc-builder/main", filter: "configs/**,integration-tests/**,dist/OliveTin-*linux-amd64.tar.gz")
                
                sh "make container"

				dir("integration-tests") {
                	sh "make cypress"
                
                	archiveArtifacts artifacts: 'results/**', fingerprint: false
				}
            }
        }
    }
}
