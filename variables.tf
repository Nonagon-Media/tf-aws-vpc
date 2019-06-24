###############
### GLOBALS ###
###############

variable "aws_region" {
  description = "AWS region"
  #default = "us-west-2"
}

variable "default_ami" {
  description = "Ubuntu 18.04 SSD"
  #default = "ami_0db180c518750ee4f"
}

# # variable "key_path" {
# 	# In a real environme dont do this
# 	description = "SSH public key"
# 	default = "/home/sthompson/.ssh/satellite.pub"
# }


###########
### VPC ###
###########

variable "n9n_cidr" {
	description = "CIDR for the N9N VPC"
	#default = "192.168.0.0/16"
}

###############
### SUBNETS ###
###############

variable "operations_public" {
	description = "CIDR for public subnet in AZ a _ Operations"
	#default = "192.168.1.0/24"
}

variable "applications_public" {
	description = "CIDR for public subnet in AZ b _ Applications"
	#default = "192.168.2.0/24"
}

variable "development_public" {
	description = "CIDR for public subnet in AZ c _ Development"
	#default = "192.168.3.0/24"
}

variable "operations_private" {
	description = "CIDR for private subnet in AZ a _ Operations"
	#default = "192.168.10.0/24"
}

variable "applications_private" {
	description = "CIDR for private subnet in AZ b _ Applications"
	#default = "192.168.20.0/24"
}

variable "development_private" {
	description = "CIDR for private subnet in AZ c _ Development"
	#default = "192.168.30.0/24"
}