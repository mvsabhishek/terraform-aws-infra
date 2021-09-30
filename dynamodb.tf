resource "aws_dynamodb_table" "terraform-lock-db" {
  name           = "terraform_state_lock"
  read_capacity  = 5
  write_capacity = 5
  hash_key       = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }

  tags = merge(
    local.standard_tags,
    {
      "Name" = "DynamoDB Terraform State Lock Table"
    }
  )
}