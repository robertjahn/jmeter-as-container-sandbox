pipeline {
    agent any
        stages {
	        stage('Run Smoke Test') {
	            steps {
		    	withCredentials([[$class: 'UsernamePasswordMultiBinding',
                                  credentialsId: 'dockerhub',
                                  usernameVariable: 'DOCKER_HUB_USER',
                                  passwordVariable: 'DOCKER_HUB_PASSWORD']]) {
                      		sh "./smoke.sh"
                                archiveArtifacts artifacts: 'results/**', fingerprint: true
                                archiveArtifacts artifacts: 'results_raw/**', fingerprint: true
                                archiveArtifacts artifacts: 'results_log/**', fingerprint: true
			}
                   }
                }
		post {
		    cleanup{
			deleteDir()
		    }
		}
        }
}
