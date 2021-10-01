module "vpc" {
  source = "git@github.com:terraform-aws-modules/terraform-aws-vpc.git?ref=v3.7.0"

  name = var.vpc_name
  cidr = "10.0.0.0/16"

  azs             = ["${local.region}a", "${local.region}b", "${local.region}c"]
  private_subnets = ["10.0.1.0/26", "10.0.2.0/26", "10.0.3.0/26"]
  public_subnets  = ["10.0.101.0/26", "10.0.102.0/26", "10.0.103.0/26"]

  enable_ipv6 = true

  enable_nat_gateway = false
  single_nat_gateway = true

  public_subnet_tags = {
    Name = "public-subnet"
  }

  tags = local.standard_tags

  vpc_tags = merge(
    local.standard_tags, {
      Name = var.vpc_name
  })
}