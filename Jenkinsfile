pipeline {
    agent any
        stages {
	        stage('Rsync code to target by environment') {
	            steps {
		    	withCredentials([[$class: 'UsernamePasswordMultiBinding',
                                  credentialsId: 'dockerhub',
                                  usernameVariable: 'DOCKER_HUB_USER',
                                  passwordVariable: 'DOCKER_HUB_PASSWORD']]) {
				cleanWs()
				echo "HI"
                      		sh "./smoke.sh"
			}
                   }
                }
        }
}
