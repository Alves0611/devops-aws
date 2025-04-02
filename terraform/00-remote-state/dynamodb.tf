resource "aws_dynamodb_table" "this" {
  name         = "tflock-${data.aws_caller_identity.current.account_id}"
  billing_mode = var.state_lock_config.dynamodb_billing_mode
  hash_key     = var.state_lock_config.dynamodb_hash_key_attribute_name

  attribute {
    name = var.state_lock_config.dynamodb_hash_key_attribute_name
    type = var.state_lock_config.dynamodb_hash_key_attribute_type
  }
}
