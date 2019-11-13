pipeline {
    agent {
        docker {
            image 'chef/chefdk:latest'
        }
    }

    // triggers {
    //     pollSCM 'H/5 * * * *'
    // }

    options {
      timeout(15)
      timestamps()
      ansiColor('xterm')
      disableConcurrentBuilds()
    }

	environment {
		CHEF_LICENSE = 'accept'
	}

    stages {
        stage('install') {
            steps {
                sh label: 'Delete lock files if exist', returnStatus: true, script: "rm policyfiles/*.json"
                script {
                    for (f in findFiles(glob: "policyfiles/*.rb")) {
                        sh "chef install ${f}"
                    }
                }
                
            }
        }
        stage('export') {
            steps {
                sh 'mkdir -p exportdir'
                
                script {
                    for (f in findFiles(glob: "policyfiles/*.rb")) {
                        sh "chef export ${f} exportdir --archive"
                    }
                }                
            }
        }
    }
    post {
        always {
            cleanWs()
        }
    }

}