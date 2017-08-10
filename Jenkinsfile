node{
    stage('Preperations'){
        git credentialsId: 'ubuntu', url: 'git@github.com:mibsen/ca-project.git'
        sh 'make build'
        sh 'make tag'

    }
    stage('Run test'){
        sh 'docker run ca-project python tests.py'
    }
    stage('Deploy to Stage'){
        sh 'make BUILD_NUMBER=$BUILD_NUMBER staging'
    }
}