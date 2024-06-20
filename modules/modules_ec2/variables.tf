#___EC2_Variables
variable "ec2_instance_type" {
    description = "Please Enter EC2 Instance Type"
    default = "t2.micro"
    type = string
}

variable "ami" {
    description = "Please Enter EC2 AMI"
    default = "ami-01e444924a2233b07"
    type = string
}

variable "Enviroment" {
  description = "Please Enter Enviroment"
  default = "Dev"
}

variable "tags" {
  default = {
    Name = "Server Build by Terraform"
    Owner = "Dmytro Babii"
  }
}

variable "security_groups" {
  type = set(string)
  
}

variable "subnet_id" {
  type = string
}