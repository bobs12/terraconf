resource "aws_instance" "test" {
  ami = var.ami
  instance_type = var.ec2_instance_type
  key_name = "ReaKey"
  security_groups = var.security_groups
  subnet_id = var.subnet_id
  associate_public_ip_address = "true"
  tags = merge(var.tags, { Name = "${var.Enviroment} Server Build by Terraform"})
  provisioner "remote-exec" {
    inline = [
    "sudo apt update -y",
    "sudo apt install -y docker.io",
    "sudo systemctl start docker",
    "sudo systemctl enable docker",          
    "sudo usermod -aG docker ubuntu",
    "sudo docker pull nginx",
    "sudo docker run --name docker-nginx -p 8000:80 -d nginx"

  ]
  connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("../ReaKey.pem") 
      host        = self.public_ip
  }
  }
}

