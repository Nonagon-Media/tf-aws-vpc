###################
### NAT GATEWAY ###
###################

resource "aws_nat_gateway" "n9n_nat" {
    allocation_id = "${aws_eip.n9n_eip.id}"
    subnet_id = "${aws_subnet.n9n_operations_public.id}"
    depends_on = ["aws_internet_gateway.n9nigw"]
}