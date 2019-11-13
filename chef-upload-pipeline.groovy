pipeline {
    agent {
        docker {
            image 'chef/chefdk:latest'
            args '-u root:root'
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
                sh label: 'Delete lock files if exist', returnStatus: true, script: "mkdir cookbook && ls|grep -v cookbook|xargs mv -t cookbook"
                dir('cookbook') {
                  script {
                    for (f in findFiles(glob: "policyfiles/*.rb")) {
                        sh "chef install ${f}"
                    }
                  }
                }
                
            }
        }
        stage('export') {
            steps {
                sh 'mkdir -p exportdir'
                dir('cookbook') {
                  script {
                    for (f in findFiles(glob: "policyfiles/*.rb")) {
                        sh "chef export ${f} ../exportdir --archive"
                    }
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