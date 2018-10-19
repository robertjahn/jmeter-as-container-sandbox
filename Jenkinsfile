podTemplate(label: 'mypod', containers: [
  containerTemplate(name: 'slave', image: 'jenkins/jnlp-slave', ttyEnabled: true, command: 'cat')
  ])
{
  node('mypod') {
    stage('Build') {
       sh "./smoke.sh"
    }
  }
}
