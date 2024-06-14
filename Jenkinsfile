pipeline{
    agent any
    stages{
        stage("Code cloning"){
            steps{
                git url:"https://github.com/Randeep0211/django-notes-app.git" , branch:"main"
                echo "Code clonned successfully"
            }
        }
        stage("Code Build"){
            steps{
                sh "docker build -t django-notes-app:latest ."
                echo "Code Build successfully"
            }
        }
        stage("Push to Docker Hub"){
            steps{
                withCredentials([usernamePassword(credentialsId:"dockerhubcreds", passwordVariable:"dockerPass", usernameVariable:"dockerUser")]){
                    sh "docker login -u ${env.dockerUser} -p ${env.dockerPass}"
                    sh "docker tag django-notes-app:latest ${env.dockerUser}/django-notes-app:latest"
                    sh "docker push ${env.dockerUser}/django-notes-app:latest"
                    echo "Image file pushed on Docker Hub"
                }
            }
        }
    }
}
