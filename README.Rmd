# aws-vpc
This module creates AWS VPC with 3 public ,3 private subnets ,IG and NAT.

IG will be created on public subnet 1

NAT gateway will be created on private subnet 1 


```





module "wordpress_db" {

source = "ckmzdevops/aws-vpc"

region          = "us-east-1"

cidr_block   = "10.0.0.0/16"

public_cidr1 = "10.0.101.0/24"

public_cidr2 = "10.0.102.0/24"

public_cidr3 = "10.0.103.0/24"

private_cidr1 = "10.0.1.0/24"

private_cidr2 = "10.0.2.0/24"

private_cidr3 = "10.0.3.0/24"

tags = {

	Name = "VPC"
	Team = "Team1"
	
}



}
<<<<<<< HEAD:README.md

```
=======
>>>>>>> 9218c66a6ef1134264478701095e67bc25729d38:README.Rmd
