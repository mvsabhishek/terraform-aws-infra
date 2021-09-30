locals {
  standard_tags = {
    environment   = var.environment
    contact_email = var.contact_email
    createdBy     = var.createdBy
    owner         = var.owner
  }
}