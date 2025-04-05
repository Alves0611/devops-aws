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

variable "karpenter" {
  type = object({
    karpenter_controller_role_name = string
    karpenter_controll_policy_name = string
  })

  default = {
    karpenter_controller_role_name = "karpenter-controller"
    karpenter_controll_policy_name = "arn:aws:iam::aws:policy/AWSKarpenterController"
  }
}
