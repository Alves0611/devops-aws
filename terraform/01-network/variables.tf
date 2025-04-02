variable "region" {
  type        = string
  default     = "us-east-1"
  description = "The AWS region where the resources will be provisioned"
}

variable "tags" {
  type = map(string)
  default = {
    Managedby = "Terraform"
  }
  description = "Tags to be applied to all resources"
}

variable "vpc" {
  type = object({
    name       = string
    cidr_block = string
  })

  default = {
    name = "studying"
    cidr_block = "10.0.0.0/24"
  }
}