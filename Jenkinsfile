pipeline {
    agent any 
    environment {
        AWS_ACCESS_KEY_ID = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
        AWS_DEFAULT_REGION = "us-east-1"
    }
    stages {
        stage('Checkout SCM') {
            steps {
                script {
                    checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/SushantOps/Terraform_Jenkins_EKS_Project.git']])
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
         stage('Validate Terraform Code') {
            steps {
                script {
                    dir('EKS') {
                        sh 'terraform validate'
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
                    input(message: "Are you sure to proceed?", ok: "Proceed")
                }
            }
        }

        stage('Creating/Destroying an EKS Cluster') {
            steps {
                script{
                    dir('EKS') {
                        sh 'terraform $action --auto-approve'
                    }
                }
            }
        
        }
    }
}