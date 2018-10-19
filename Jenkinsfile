pipeline {
    agent any
        stages {
	        stage('Rsync code to target by environment') {
	            steps {
		    	withCredentials([[$class: 'UsernamePasswordMultiBinding',
                                  credentialsId: 'dockerhub',
                                  usernameVariable: 'DOCKER_HUB_USER',
                                  passwordVariable: 'DOCKER_HUB_PASSWORD']]) {
				sh "rm -f results_raw/*"
                      		sh "./smoke.sh"
			}
                   }
                }
        }
}
