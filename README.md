# terraform-aws-infra
AWS infrastructure via Terraform

Version Log:

| Name | Version |
|:---:|:---:|
| Terraform | v1.0.7 |
| AWS Provider | v3.61.0 |
| terraform-aws-vpc | v3.7.0 |

## Setting up infrastructure with terraform on AWS:

A good practice on an enterprise scale is to use a CI/CD tool like Jenkins, Teamcity, AWS Lambdas, AWS Code Build/Deploy, or Terraform-Cloud to automate the process of creating a plan and applying Terraform code. However, it is always possible to run Terraform functionalities from your local. Here's a guide on how to:

### AWS Setup on Local
- Setup your AWS account and (IAM) user. If you already have a user in your AWS with PowerUser policy attached, you're good to go. Otherwise, create an IAM user and attach AWS-managed PowerUser policy to it. Make sure to download the credentials (Accesskey & Secret). 
- On your local, download awscli and use the credentials to configure your awscli. Preferably, create a separate profile for the credentials. We will use the profile in our terraform provider configuration. FYI, I have used 'terraform' as my AWS Profile Name on my local.
- To avoid using --profile AWS_Profile_Name everytime with awscli, you could set an environment: export AWS_PROFILE=terraform.
- Test your connection to AWS via CLI. You could use this command: aws sts get-caller-identity

### Terraform Setup on Local
- Download and install the latest version of Terraform (v1.0.7 at the time).
- Create an S3 bucket in your AWS account for storing Terraform state file. Create a folder with a relevant name of your choice to put the State file. I would recommend doing this step manually to avoid precedence problem. (More on this later)
- Now you have an S3 bucket and a folder inside the bucket. You could turn on version control to avoid overwriting the state file or if you would like to have backup of the previous state files. 
- We will be using a DynamoDB table to store the state lock. Please refer dynamodb.tf and main.tf to review the setup.

### Running Terraform commands on Local
- The repo contains two shell scripts: tf-plan.sh, tf-apply.sh.
- To run terraform plan, simply run the shell script tf-plan.sh.
- To run terraform apply, simply run the shell script tf-aaply.sh.
- Both of these scripts have similar commands. Update the value of AWS_PROFILE in the scripts if needed.
- The scripts set the environment variable for AWS_PROFILE, run the terraform command, and perform post-run cleanup.
