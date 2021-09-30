# Declare variables

variable "aws_region" {
  type        = string
  description = "AWS Region"
  default     = "us-east-2"
}

variable "aws_account_number" {
  type        = string
  description = "AWS Account Number"
  default     = "963767040018"
}

variable "environment" {
  type        = string
  description = "Environment"
  default     = "siva-proto"
}

variable "contact_email" {
  type        = string
  description = "Contact Email"
  default     = "mvsabhishek@gmail.com"
}

variable "createdBy" {
  type        = string
  description = "Resource created by"
  default     = "terraform"
}

variable "owner" {
  type        = string
  description = "Owner of the resource"
  default     = "Siva Munukutla"
}
