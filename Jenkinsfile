node{
    stage('Preperations'){
        git credentialsId: 'ubuntu', url: 'git@github.com:mibsen/ca-project.git'
        sh 'docker build -t codechan .'

    }
    stage('Run test'){
        sh 'docker run codechan python tests.py'
    }
    stage('Deploy to Stage'){
        sh 'make staging'
    }
}