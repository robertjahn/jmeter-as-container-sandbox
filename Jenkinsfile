pipeline {
    agent any
        stages {
	        stage('Rsync code to target by environment') {
	            steps {
                      echo "HI"
                      sh "./smoke.sh"
                   }
                }
        }
}
