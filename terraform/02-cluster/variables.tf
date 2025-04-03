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

variable "vpc_resources" {
  type = object({
    vpc = string
  })

  default = {
    vpc = "studying"
  }
}

variable "eks_cluster" {
  type = object({
    name                                   = string
    role_name                              = string
    version                                = string
    enabled_cluster_log_types              = list(string)
    access_config_authentication_mode      = string
    node_group_name                        = string
  })

  default = {
    name                                   = "studying-cluster"
    role_name                              = "StudyingEKSClusterRole"
    version                                = "1.31"
    enabled_cluster_log_types              = ["api", "audit", "authenticator", "controllerManager", "scheduler"]
    access_config_authentication_mode      = "API_AND_CONFIG_MAP"
  }
}
