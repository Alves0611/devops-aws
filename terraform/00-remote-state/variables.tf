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

variable "state_lock_config" {
  type = object({
    dynamodb_billing_mode            = string
    dynamodb_hash_key_attribute_name = string
    dynamodb_hash_key_attribute_type = string
  })

  default = {
    dynamodb_billing_mode            = "PAY_PER_REQUEST"
    dynamodb_hash_key_attribute_name = "LockID"
    dynamodb_hash_key_attribute_type = "S"
  }

  description = "Configuration for the DynamoDB table used to lock the Terraform remote state"
}

