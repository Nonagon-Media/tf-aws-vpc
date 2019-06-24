###############
### SUBNETS ###
###############

# Operations
resource "aws_subnet" "n9n_operations_public" {
  vpc_id     = "${aws_vpc.n9n.id}"
  cidr_block = "${var.operations_public}"
  availability_zone = "us-west-2a"
  tags = {
    Name = "N9N Operations Public Subnet"
  }
}

resource "aws_subnet" "n9n_operations_private" {
	vpc_id 		 = "${aws_vpc.n9n.id}"
  cidr_block = "${var.operations_private}"
  availability_zone = "us-west-2a"
  tags = {
    Name = "N9N Operations Private Subnet"
  }
}

# Applications
resource "aws_subnet" "n9n_applications_public" {
  vpc_id     = "${aws_vpc.n9n.id}"
  cidr_block = "${var.applications_public}"
  availability_zone = "us-west-2b"
  tags = {
    Name = "N9N Applications Public Subnet"
  }
}

resource "aws_subnet" "n9n_applications_private" {
	vpc_id 		 = "${aws_vpc.n9n.id}"
  cidr_block = "${var.applications_private}"
  availability_zone = "us-west-2b"
  tags = {
    Name = "N9N Applications Private Subnet"
  }
}

# Development
resource "aws_subnet" "n9n_development_public" {
  vpc_id     = "${aws_vpc.n9n.id}"
  cidr_block = "${var.development_public}"
  availability_zone = "us-west-2c"
  tags = {
    Name = "N9N Development Public Subnet"
  }
}

resource "aws_subnet" "n9n_development_private" {
	vpc_id 		 = "${aws_vpc.n9n.id}"
  cidr_block = "${var.development_private}"
  availability_zone = "us-west-2c"
  tags = {
    Name = "N9N Development Private Subnet"
  }
}