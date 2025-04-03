terraform {
  backend "s3" {
    bucket         = "tfstate-891377404175"
    key            = "cluster/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "tflock-891377404175"
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.93"
    }
  }
}
