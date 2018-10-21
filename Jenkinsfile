pipeline {
    agent any
        stages {
	        stage('Run Smoke Test') {
	            steps {
		    	withCredentials([[$class: 'UsernamePasswordMultiBinding',
                                  credentialsId: 'dockerhub',
                                  usernameVariable: 'DOCKER_HUB_USER',
                                  passwordVariable: 'DOCKER_HUB_PASSWORD']]) {
                                sh "./cleanup.sh jmeter-test"
                      		sh "./smoke.sh"
                                archiveArtifacts artifacts: 'results/**', fingerprint: true, allowEmptyArchive: true
                                archiveArtifacts artifacts: 'results_raw/**', fingerprint: true, allowEmptyArchive: true
                                archiveArtifacts artifacts: 'results_log/**', fingerprint: true, allowEmptyArchive: true
			}
                   }
                }
	}
	post {
	    cleanup{
		//deleteDir()
	    }
        }
}
