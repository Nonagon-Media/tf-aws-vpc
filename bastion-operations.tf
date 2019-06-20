resource "aws_instance" "bastion-operations" {
	# The AMI to use
  ami = "${var.default_ami}"

  # The instance type
  instance_type   = "t2.medium"

  # The subnet into which to place the instance
  subnet_id = "${aws_subnet.n9n_operations_public.id}"

  # The Key Pair to use. In my case this already exists but tf can create it
  key_name = "n9n2019"

  # Attach security groups associated with the VPC
  vpc_security_group_ids = ["${aws_security_group.allow_ssh.id}"]

  tags = {
    Name = "n9n_bastion_operations"
    Hostname = "bastion.operations"
  }
}