// vim: ft=groovy
properties([
    buildDiscarder(logRotator(artifactDaysToKeepStr: '', artifactNumToKeepStr: '3', daysToKeepStr: '', numToKeepStr: '3')),
    pipelineTriggers([[$class: 'PeriodicFolderTrigger', interval: '2d']])
])

node('cloud') {
    stage('CLOUD: Host Debug Information') {
        sh 'set -x && hostname && uname -a && free -h && df -h'
    }
    deleteDir()
    checkout scm
    try {
        stage('CLOUD: Run the build script') {
            sh './build'
        }
        stage('CLOUD: Archive artifact') {
            archiveArtifacts 'riot-liquid.tar.gz'
        }
    } finally {
        deleteDir()
    }
}
