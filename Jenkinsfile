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
        sh "ansible-playbook site.yml"
      }

    }

  // Run terraform init
  stage('init') {
      node {
          withCredentials([azureServicePrincipal('principal-credentials-id')]) {
            sh 'az login --service-principal -u $AZURE_CLIENT_ID -p $AZURE_CLIENT_SECRET -t $AZURE_TENANT_ID'
            sh 'az account set -s $AZURE_SUBSCRIPTION_ID'
        }
        ansiColor('xterm') {
          sh 'terraform init'
        }
      }
 }

  // Run terraform plan
  stage('plan') {
    node {
      withCredentials([azureServicePrincipal('principal-credentials-id')]) {
            sh 'az login --service-principal -u $AZURE_CLIENT_ID -p $AZURE_CLIENT_SECRET -t $AZURE_TENANT_ID'
            sh 'az account set -s $AZURE_SUBSCRIPTION_ID'
      }
        ansiColor('xterm') {
          sh 'terraform plan'
        }
    }
  }

    // Run terraform apply
    stage('apply') {
      node {
        withCredentials([azureServicePrincipal('principal-credentials-id')]) {
            sh 'az login --service-principal -u $AZURE_CLIENT_ID -p $AZURE_CLIENT_SECRET -t $AZURE_TENANT_ID'
            sh 'az account set -s $AZURE_SUBSCRIPTION_ID' 
            }
            
             ansiColor('xterm') {
            sh 'terraform apply -auto-approve'
          }
        }
      }

    // Run terraform show
    /*stage('show') {
      node {
        withCredentials([azureServicePrincipal('principal-credentials-id')]) {
            sh 'az login --service-principal -u $AZURE_CLIENT_ID -p $AZURE_CLIENT_SECRET -t $AZURE_TENANT_ID'
            sh 'az account set -s $AZURE_SUBSCRIPTION_ID'
            sh 'az resource list' 
            }

          ansiColor('xterm') {
            sh 'terraform show'
          }
        }
      }
      */
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
