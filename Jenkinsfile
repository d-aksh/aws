pipeline{
    agent any
    stages{
        stage('Git clone')
        {
            steps{
               
              checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/d-aksh/aws']]])
            }
        }
        stage('Build') {
			steps {
				sh 'docker build -t ImpressicoAkash/akash_image:latest .'
			}
		}
	stage('Push') {
	    steps {
		script {
		   
      withCredentials([string(credentialsId: 'awspwd', variable: 'awspwd')])
      {
			sh "docker login -u ImpressicoAkash -p ${awspwd}"
	    }
	    sh "docker push ImpressicoAkash/akash_image"
		}
	    }
	}
			stage('start') {
		    steps {
				    sh "docker run -itd -p 80:80 --name webserver ImpressicoAkash/akash_image"
		        }
		    }
		
		
		
    }
}
