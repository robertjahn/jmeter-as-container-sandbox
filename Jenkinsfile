node {
    environment {
        APP_NAME = "SampleNodeJs"
        STAGING = "Staging"
        PRODUCTION = "Production"
    }
	
    stage('Checkout') {
	
	// get our test code
	git url: 'https://github.com/robertjahn/jmeter-as-container.git', branch: 'master'
	    
        // into a dynatrace-cli subdirectory we checkout the CLI
        dir ('dynatrace-cli') {
            git url: 'https://github.com/Dynatrace/dynatrace-cli.git', branch: 'master'
        }
    }
	
    stage('Run Smoke Test') {
	   
	dir ('dynatrace-scripts') {
            //sh './pushevent.sh SERVICE CONTEXTLESS DockerService SampleNodeJsStaging ' +
            //   '"STARTING Load Test" ${JOB_NAME} "Starting a Load Test as part of the Testing stage"' + 
            //   ' ${JENKINS_URL} ${JOB_URL} ${BUILD_URL} ${GIT_COMMIT}'
        }
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
