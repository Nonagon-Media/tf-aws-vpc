###############
### SUBNETS ###
###############

# Operations
resource "aws_subnet" "n9n_operations_public" {
  vpc_id     = "${aws_vpc.n9n.id}"
  cidr_block = "192.168.1.0/24"
  availability_zone = "us-west-2a"
  tags = {
    Name = "N9N Operations Public Subnet"
  }
}

resource "aws_subnet" "n9n_operations_private" {
	vpc_id 		 = "${aws_vpc.n9n.id}"
  cidr_block = "192.168.10.0/24"
  availability_zone = "us-west-2a"
  tags = {
    Name = "N9N Operations Private Subnet"
  }
}

# Applications
resource "aws_subnet" "n9n_applications_public" {
  vpc_id     = "${aws_vpc.n9n.id}"
  cidr_block = "192.168.2.0/24"
  availability_zone = "us-west-2b"
  tags = {
    Name = "N9N Applications Public Subnet"
  }
}

resource "aws_subnet" "n9n_applications_private" {
	vpc_id 		 = "${aws_vpc.n9n.id}"
  cidr_block = "192.168.20.0/24"
  availability_zone = "us-west-2b"
  tags = {
    Name = "N9N Applications Private Subnet"
  }
}

# Development
resource "aws_subnet" "n9n_development_public" {
  vpc_id     = "${aws_vpc.n9n.id}"
  cidr_block = "192.168.3.0/24"
  availability_zone = "us-west-2c"
  tags = {
    Name = "N9N Development Public Subnet"
  }
}

resource "aws_subnet" "n9n_development_private" {
	vpc_id 		 = "${aws_vpc.n9n.id}"
  cidr_block = "192.168.30.0/24"
  availability_zone = "us-west-2c"
  tags = {
    Name = "N9N Development Private Subnet"
  }
}