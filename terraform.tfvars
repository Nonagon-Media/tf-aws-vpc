### GLOBALS ###
aws_region = "us-west-2"
default_ami = "ami-0db180c518750ee4f"

### VPC ###
n9n_cidr = "192.168.0.0/16"

### PUBLIC SUBNETS ###
operations_public = "192.168.1.0/24"
applications_public = "192.168.2.0/24"
development_public = "192.168.3.0/24"

### PRIVATE SUBNETS ###
operations_private = "192.168.10.0/24"
applications_private = "192.168.20.0/24"
development_private = "192.168.30.0/24"


