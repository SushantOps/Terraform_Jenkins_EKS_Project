terraform {
  backend "s3" {
    bucket = "demo-eks-cicd-july-backup1"
    key    = "eks/terraform.tfstate"
    region = "us-east-1"

  }
}