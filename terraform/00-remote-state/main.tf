provider "aws" {
  region = var.region

  default_tags {
    tags = {
      Managedby = "Terraform"
    }
  }
}
