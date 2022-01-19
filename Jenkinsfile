pipeline{
   agent any
   stages{ 
      stage('Buid Docker Image'){
         steps{
             sh "docker build . -t 273003/myapp:${BUILD_ID}"
              }
                                } 
         stage('Push Docker Image'){
            steps{
              withCredentials([string(credentialsId: 'dhub', variable: 'pass')]) {
              sh "docker login -u 273003 -p ${pass}"
              sh "docker push 273003/myapp:v1"
                                                                                 }    
           
                 }
                                   } 

         }

        }
