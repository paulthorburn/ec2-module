
# Amazon Linux = "ami-09a7fe78668f1e2c0"
# Ubuntu = "ami-03ba3948f6c37a4b0"


# Configure the AWS Provider
provider "aws" {
  region     = "us-west-1"
}

# Create an EC2 Instance
resource "aws_instance" "instance" {
  ami           = "ami-03ba3948f6c37a4b0"
  instance_type = var.instance_type

  root_block_device {
    volume_type           = var.root_volume_type
    volume_size           = var.root_volume_size
    delete_on_termination = true
  }



  tags = {
    Name = "Hello World"
    Description = var.description
    Region = "us-west-1"
    UpdatedStuff = "Yes i did!"

    }
  }




variable "description" {
    type = string
    default = ""
  }

variable "instance_type" {
  default = "t3.micro"
}

variable "root_volume_size" {
  default = "50"
}
variable "root_volume_type" {
  default = "gp2"
}

