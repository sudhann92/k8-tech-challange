provider "aws" {
  region = "us-west-2"  
}

module "eks_cluster" {
  source  = "terraform-aws-modules/eks/aws"
  version = "17.19.0"
  cluster_name       = "my-eks-cluster"
  cluster_version    = "1.20"
  subnets            = ["subnet-12345678", "subnet-23456789"]  
  vpc_id             = "vpc-12345678"                         
  cluster_create_timeout = "20m"

}