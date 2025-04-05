data "terraform_remote_state" "eks" {
  backend = "s3"
  config = {
    bucket = "tfstate-891377404175"
    key    = "cluster/terraform.tfstate"
    region = "us-east-1"
  }
}

data "terraform_remote_state" "network" {
  backend = "s3"
  config = {
    bucket = "tfstate-891377404175"
    key    = "network/terraform.tfstate"
    region = "us-east-1"
  }
}
