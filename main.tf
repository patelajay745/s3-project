resource "aws_instance" "web" {

  count                  = 1
  ami                    = var.ami
  instance_type          = var.instance-type
  vpc_security_group_ids = [aws_security_group.default.id]

  key_name = var.keypair

  iam_instance_profile = aws_iam_instance_profile.instance-profile.name
  root_block_device {
    volume_size = 30
  }

  user_data = <<-EOF
              #!/bin/bash
              sudo apt-get update -y
              sudo apt-get install -y awscli
              aws s3 cp s3://my-terraform-freelance-project/test.war /home/ubuntu/test.war
              EOF
  tags = {
    Name = var.name
  }

}

output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  //value       = aws_instance.web.public_dns
  //ssh -i "admin-ajay.pem" ubuntu@
  //string to coonect ec2
  value = "ssh -i ${var.keypair}.pem ubuntu@${aws_instance.web[0].public_dns}"
}
