pipeline{
  agent any
  stages{
    stage('Build Docker Image'){
      steps{
        bat 'docker build -t products-jmeter .'
      }
    }
    stage('Run JMeter Test'){
      steps{
        bat '''
        if exist "result.jtl" del /f /q/ "result.jtl"
        if exist "html-report" rmdir /s /q "html-report"
        docker run --rm ^ -v "%WORKSPACE%:/results" ^
        products-jmeter ^ -n -t "/test/Products Performance Test Plan.jmx" ^ -l /results/result.jtl ^ -e -o /results/html-report
        '''
      }
    }
    stage('Publish HTML Report'){
            steps{
                publishHTML([
                    reportDir: 'html-report',
                    reportFiles: 'index.html',
                    reportName: 'JMeter Performance Report',
                    keepAll: true,
                    alwaysLinkToLastBuild: true,
                    allowMissing: false
                    ])
            }
        }
        post{
            always{
                emailext(
                    subject: 'JMeter Test - Build #' + env.BUILD_NUMBER + '-' + currentBuild.currentResult,
                    body: """
                    JMeter Test - Build #${env.BUILD_NUMBER}
                    Build Status: ${currentBuild.currentResult}
                    Check console output at ${env.BUILD_URL} to view the results.
                    Build Status: ${currentBuild.currentResult}
                    JMeter HTML Report is available in Jenkins.
                    """,
                    to: 'abishekn.kiaq@gmail.com'
                    )
            }
        }
    }
    }
