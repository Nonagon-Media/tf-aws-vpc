########################
### INTERNET GATEWAY ###
########################

# To make the public subnets accessible to the internet, an Internet Gateway is required

resource "aws_internet_gateway" "n9nigw" {
	vpc_id = "${aws_vpc.n9n.id}"

	tags = {
		Name = "N9N IGW"
	}
}