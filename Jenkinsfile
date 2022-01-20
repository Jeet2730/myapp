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
              sh "docker push 273003/myapp:${BUILD_ID}"
                                                                                 }    
           
                 }
                                   } 

         stage('Deploy in Kubernetes'){
            steps{
                 sh "chmod +x change.sh"
                 sh "./change.sh ${BUILD_ID}"
               sshagent(['kops']) {
                  sh "scp -o StrictHostKeyChecking=no mydep.yaml ubuntu@3.110.55.154:/home/ubuntu/"   
                   script {
                     try{
                        sh "kubectl create -f mydep.yaml"
                         }
                      catch(error){     
                         sh "kubectl apply -f mydep.yaml"
                                  }
                     
                           
                           }         
                                  }                      
                 }
                                      }
         }

        }
