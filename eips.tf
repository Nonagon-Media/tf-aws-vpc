###################
### ELASTIC IPS ###
###################

resource "aws_eip" "n9n_eip" {
	vpc = true
	depends_on = ["aws_internet_gateway.n9nigw"]
}