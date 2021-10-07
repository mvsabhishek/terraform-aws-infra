#!/bin/sh

export AWS_PROFILE=terraform
terraform init
terraform plan -var-file=environments/dev-us-east-2.tfvars

rm -rf .terraform*
