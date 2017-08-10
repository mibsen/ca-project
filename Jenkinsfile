node{
    stage('Preperations'){
        git credentialsId: 'ubuntu', url: 'git@github.com:mibsen/ca-project.git'
        sh 'make build'
        sh 'make tag'

    }
    stage('Run test'){
        sh 'docker run ca-project python tests.py'
    }
    stage('Deploy to Staging'){
        sh 'make BUILD_NUMBER=$BUILD_NUMBER staging'
    }
    stage('Functional test'){
        retry(2){
            sleep 5 SECONDS
            sh 'curl http://52.59.57.105:6892/'
        }
    }
    stage('Deploy to Production'){
        sh 'make BUILD_NUMBER=$BUILD_NUMBER production'
    }
}