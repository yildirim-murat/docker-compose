pipeline {
  agent any

  environment {
    GITHUB_TOKEN = credentials('GithubToken')
  }
  
  stages {
    stage("Verify Tooling") {
      steps {
        sh 'docker info'
      }
    }
    
    stage('Prune Docker data') {
      steps {
        sh 'docker system prune -a --volumes -f'
      }
    }

  }
  
  post {
    always {echo 'CI/CD Pipeline Operations have been discontinued.'}
    success { echo 'CI/CD pipeline ran successfully!' }
    failure { echo 'CI/CD pipeline failed!' }   
  }
}
