###################
### ELASTIC IPS ###
###################

# This is for the Internet Gateway
resource "aws_eip" "n9n_eip" {
	vpc = true
	depends_on = ["aws_internet_gateway.n9nigw"]
}

### BASTIONS ###
# Each AZ should have a bastion in the public subnet

# Operations
resource "aws_eip" "n9n_operations_bastion_eip" {
	vpc = true
	instance = "${aws_instance.bastion-operations.id}"
}