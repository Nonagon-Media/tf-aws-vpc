####################
### ROUTE TABLES ###
####################

# To allow traffic to the internet through a NAT Gateway
# Each subnet requires a Route Table

# Operations Public
resource "aws_route_table" "operations_public_rt" {
	vpc_id = "${aws_vpc.n9n.id}"

	route {
		cidr_block = "0.0.0.0/0"
		gateway_id = "${aws_internet_gateway.n9nigw.id}"
		}

	tags = {
		Name = "N9N Ops Public"
	}
	}

# Operations Private
resource "aws_route_table" "operations_private_rt" {
	vpc_id = "${aws_vpc.n9n.id}"

	tags = {
		Name = "N9N Ops Private"
	}
	}

# Applications Public
resource "aws_route_table" "applications_public_rt" {
	vpc_id = "${aws_vpc.n9n.id}"

	route {
		cidr_block = "0.0.0.0/0"
		gateway_id = "${aws_internet_gateway.n9nigw.id}"
		}

	tags = {
		Name = "N9N Apps Public"
	}
	}

# Applications Private
resource "aws_route_table" "applications_private_rt" {
	vpc_id = "${aws_vpc.n9n.id}"

	tags = {
		Name = "N9N Apps Private"
	}
}

# Development Public
resource "aws_route_table" "development_public_rt" {
	vpc_id = "${aws_vpc.n9n.id}"

	route {
		cidr_block = "0.0.0.0/0"
		gateway_id = "${aws_internet_gateway.n9nigw.id}"
		}

	tags = {
		Name = "N9N Dev Public"
	}
	}

# Development Private
resource "aws_route_table" "development_private_rt" {
	vpc_id = "${aws_vpc.n9n.id}"

	tags = {
		Name = "N9N Dev Private"
	}
	}

##############
### ROUTES ###
##############

# Allow Operations Private Subnet internet access through the NAT Gateway
resource "aws_route" "operations_private_route" {
	route_table_id = "${aws_route_table.operations_private_rt.id}"
	destination_cidr_block = "0.0.0.0/0"
	nat_gateway_id = "${aws_nat_gateway.n9n_nat.id}"
	
}

# Allow Applications Private Subnet internet access through the NAT Gateway
resource "aws_route" "applications_private_route" {
	route_table_id = "${aws_route_table.applications_private_rt.id}"
	destination_cidr_block = "0.0.0.0/0"
	nat_gateway_id = "${aws_nat_gateway.n9n_nat.id}"
}

# Allow Development Private Subnet internet access through the NAT Gateway
resource "aws_route" "development_private_route" {
	route_table_id = "${aws_route_table.development_private_rt.id}"
	destination_cidr_block = "0.0.0.0/0"
	nat_gateway_id = "${aws_nat_gateway.n9n_nat.id}"
}

################################
### ROUTE TABLE ASSOCIATIONS ###
################################

# Operations
# Associate operations public subnet to operations public route table
resource "aws_route_table_association" "operations_public_association" {
	subnet_id = "${aws_subnet.n9n_operations_public.id}"
	route_table_id = "${aws_vpc.n9n.main_route_table_id}"
}

# Associate operations private subnet to operations private route table
resource "aws_route_table_association" "operations_private_association" {
	subnet_id = "${aws_subnet.n9n_operations_private.id}"
	route_table_id = "${aws_route_table.operations_private_rt.id}"
}

# Applications
# Associate applications public subnet to applications public route table
resource "aws_route_table_association" "applications_public_association" {
	subnet_id = "${aws_subnet.n9n_applications_public.id}"
	route_table_id = "${aws_vpc.n9n.main_route_table_id}"
}

# Associate applications private subnet to applications private route table
resource "aws_route_table_association" "applications_private_association" {
	subnet_id = "${aws_subnet.n9n_applications_private.id}"
	route_table_id = "${aws_route_table.applications_private_rt.id}"
}

# Development
# Associate development public subnet to development public route table
resource "aws_route_table_association" "development_public_association" {
	subnet_id = "${aws_subnet.n9n_development_public.id}"
	route_table_id = "${aws_vpc.n9n.main_route_table_id}"
}

# Associate development private subnet to development private route table
resource "aws_route_table_association" "development_private_association" {
	subnet_id = "${aws_subnet.n9n_development_private.id}"
	route_table_id = "${aws_route_table.development_private_rt.id}"
}