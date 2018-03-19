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
    dir('riot-build') {
        checkout scm
    }
    try {
        stage('CLOUD: Prepare factory') {
            sh "#!/bin/bash\npython3 <(curl -sL https://github.com/liquidinvestigations/factory/raw/master/install.py) factory"
        }
        stage('CLOUD: Run the build script') {
            sh './factory/factory run --share riot-build:/mnt/riot-build /mnt/riot-build/factory-build'
        }
        stage('CLOUD: Archive artifact') {
            archiveArtifacts 'riot-build/riot-liquid.tar.gz'
        }
    } finally {
        deleteDir()
    }
}
