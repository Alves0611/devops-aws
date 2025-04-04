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
    node_group_role_name                   = string
    node_group_capacity_type               = string
    node_group_instance_types              = list(string)
    node_group_scaling_config_desired_size = string
    node_group_scaling_config_max_size     = string
    node_group_scaling_config_min_size     = string
  })

  default = {
    name                                   = "studying-cluster"
    role_name                              = "StudyingEKSClusterRole"
    version                                = "1.31"
    enabled_cluster_log_types              = ["api", "audit", "authenticator", "controllerManager", "scheduler"]
    access_config_authentication_mode      = "API_AND_CONFIG_MAP"
    node_group_name                        = "studying-node-group"
    node_group_role_name                   = "StudyingEKSNodeGroupRole"
    node_group_capacity_type               = "ON_DEMAND"
    node_group_instance_types              = ["t3.medium"]
    node_group_scaling_config_desired_size = "2"
    node_group_scaling_config_max_size     = "2"
    node_group_scaling_config_min_size     = "2"
  }
}

variable "ecr_repositories" {
  type = list(object({
    name                 = string
    image_tag_mutability = string
  }))

  default = [
    {
      name                 = "studying/production/frontend"
      image_tag_mutability = "MUTABLE"
    },
    {
      name                 = "studying/production/backend"
      image_tag_mutability = "MUTABLE"
    }
  ]
}
