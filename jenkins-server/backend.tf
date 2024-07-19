terraform {
  backend "s3" {
    bucket = "demo-eks-cicd-july-backup1"
    key    = "jenkins/terraform.tfstate"
    region = "us-east-1"

  }
}