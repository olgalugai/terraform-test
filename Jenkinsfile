// Jenkinsfile
try {
  stage('checkout') {
    node {
      cleanWs()
      checkout scm
    }
  }
node {
    /* .. snip .. */
    stage('Login') {
        node {
        withCredentials([azureServicePrincipal('principal-credentials-id')]) {
            sh 'az login --service-principal -u $AZURE_CLIENT_ID -p $AZURE_CLIENT_SECRET -t $AZURE_TENANT_ID'
            sh 'az account set -s $AZURE_SUBSCRIPTION_ID'
        }
      }
    }
}
    stage ('ansible') {
      node {
        sh 'cd ansible && ansible-playbook site.yml && cat ../modules/base-networking/main.tf'
      }

    }

    stage ('validation') {
      node {
        sh 'cd .. && terraform validate'
      }

    }
      
    currentBuild.result = 'SUCCESS'
}
catch (err) {
  currentBuild.result = 'FAILURE'
  throw err
}
finally {
  if (currentBuild.result == 'SUCCESS') {
    currentBuild.result = 'SUCCESS'
  }
}
