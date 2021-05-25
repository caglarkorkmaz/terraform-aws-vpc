This module creates AWS VPC with 3 public ,3 private subnets ,IG and NAT.

1 IG will be created on public subnet1

1 NAT gateway will be created on private subnet1



```

    module "vpc_team1" {

    source = "ckmzdevops/vpc/aws"
     
    # Please provide the version here. (using latest version recommended)
    version = ""
    
    region       = "us-east-1"
    cidr_block   = "10.0.0.0/16"
    public_cidr1 = "10.0.101.0/24"
    public_cidr2 = "10.0.102.0/24"
    public_cidr3 = "10.0.103.0/24"
    private_cidr1 = "10.0.1.0/24"
    private_cidr2 = "10.0.2.0/24"
    private_cidr3 = "10.0.3.0/24"

    # If true, it will map public IP on resources that are created on 3 public subnets.
    map_public_ip_on_launch = true

    enable_dns_hostnames = true
    enable_dns_support  = true

    tags = {
    Name = "VPC-Group-Project"
    Team = "Team1"
    }

    }   


    output "region" {
        value = module.vpc_team1.region
    }

    output "vpc_id" {
        value = module.vpc_team1.vpc
    }
    output "public" {
        value = module.vpc_team1.public_subnets
    }
    output "private" {
        value = module.vpc_team1.private_subnets
    }


```
