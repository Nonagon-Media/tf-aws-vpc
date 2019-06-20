resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow SSH inbound traffic"

  # The VPC into which this instance is placed
  vpc_id = "${aws_vpc.n9n.id}"

  ingress {
    # SSH Inbound
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    # Allow SSH traffic from anywhere.
    # Normally, you would use an office endpoint, VPN or firewall address
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_ssh"
  }
}