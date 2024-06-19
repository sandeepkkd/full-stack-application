provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "app" {
  count         = 2
  ami           = "ami-0c55b159cbfafe1f0" # Use a suitable AMI ID for your region
  instance_type = "t2.micro"

  key_name = var.key_pair

  tags = {
    Name = "app-instance-${count.index}"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo yum update -y",
      "sudo yum install docker -y",
      "sudo service docker start",
      "sudo usermod -a -G docker ec2-user",
      "sudo docker run -d -p 80:80 your-dockerhub-username/your-frontend-image",
      "sudo docker run -d -p 3000:3000 your-dockerhub-username/your-backend-image"
    ]

    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = file(var.private_key_path)
      host        = self.public_ip
    }
  }
}

output "public_ips" {
  value = aws_instance.app[*].public_ip
}
