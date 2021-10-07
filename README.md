# terraform-aws-infra
AWS infrastructure via Terraform

Version Log:

| Name | Version |
|:---:|:---:|
| Terraform | v1.0.7 |
| AWS Provider | v3.61.0 |
| terraform-aws-vpc | v3.7.0 |

## Setting up infrastructure with terraform on AWS:

A good practice on an enterprise scale is to use a CI/CD tool like Jenkins,Teamcity or Terraform-Cloud to automate the process of creating a plan and applying Terraform code. However, it is always possible to run Terraform functionalities from your local. Here's a guide on how to:

- Setup your AWS account and (IAM) user. If you already have a user in your AWS with PowerUser policy attached, you're good to go. Otherwise, create an IAM user and attach AWS-managed PowerUser policy to it. Make sure to download the credentials (Accesskey & Secret). 
- On your local, download awscli and use the credentials to configure your awscli. Preferably, create a separate profile for the credentials. We will use the profile in our terraform provider configuration. FYI, I have used 'terraform' as my AWS Profile Name on my local.
-- To avoid using --profile AWS_Profile_Name everytime with awscli, you could set an environment: export AWS_PROFILE=terraform.
