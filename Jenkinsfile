pipeline {
    agent any
        stages {
	        stage('Rsync code to target by environment') {
	            steps {
		    	withCredentials([[$class: 'UsernamePasswordMultiBinding',
                                  credentialsId: 'dockerhub',
                                  usernameVariable: 'DOCKER_HUB_USER',
                                  passwordVariable: 'DOCKER_HUB_PASSWORD']]) {
				echo "HI"
				deleteDir()
				checkout scm
                      		sh "./smoke.sh"
			}
                   }
                }
        }
}
