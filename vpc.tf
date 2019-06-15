###########
### VPC ###
###########

resource "aws_vpc" "n9n" {
	cidr_block = "${var.n9n_cidr}"
	enable_dns_support = true
	enable_dns_hostnames = true

	tags = {
		Name = "n9n_vpc"
	}
}





