variable "keypair" {
  default = "admin"
}
variable "name" {
  default = "war-machine-ec2"
}
variable "ami" {
  default = "ami-0b8b44ec9a8f90422"
}
variable "instance-type" {
  default = "t2.micro"
}

variable "iam-role" {
  default = "Jenkins-iam-role"
}
variable "sg-name" {
  default = "Jenkins-sg"
}
