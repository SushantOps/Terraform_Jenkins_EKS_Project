pipeline {
    agent any 
    enviroment {
        AWS_ACCESS_KEY_ID = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_KEY_ID = credentials('AWS_SECRET_KEY_ID')
        AWS_DEFAULT_REGION = "us-east-1"
    }
    stages {
        stage ('Git Checkout') {
            steps{
                script{
                    heckout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/SushantOps/Terraform_Jenkins_EKS_Project.git']])
                }
            }
        }
        stage('Initialize Terraform') {
            steps {
                script {
                    dir('EKS') {
                        sh 'terraform init'
                    }
                }
            }
        }
        stage('Formatting Terraform Code') {
            steps {
                script {
                    dir('EKS') {
                        sh 'terraform fmt'
                    }
                }
            }
        }
        stage('Preview Infra using Terraform') {
            steps {
                script{
                    dir('EKS') {
                        sh 'terraform plan'
                    }
                    input (message: ""Are you sure to proceed?", ok: "Proceed"")
                }
            }
        }
        stage('Creating/Destroying an EKS Cluster') {
            steps {
                script {
                    dir('EKS') {
                        sh "terraform $action --auto-approve"
                    }
                }
            }
        }
        stage{
            steps{
                script{
                    dir('EKS/ConfigurationFiles'){
                        sh 'aws eks update-kubeconfig --name my-eks-cluster'
                        sh 'kubectl apply -g deploymemt.yaml'
                        sh 'kubectl apply -f service.yaml'
                    }
                }
            }
        }
    }
}