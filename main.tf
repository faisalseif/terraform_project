#provider "aws" {
#    region = "us-east-2"
#    access_key = "AKIA2I7WQMD467NNCN5B"
#    secret_key = "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"
#}

resource "aws_instance" "my-first-server" {
    ami =           "ami-085925f297f89fce1"
    instance_type = "t2.micro"
    tags = {
        Name = "ubuntu server"
    }
}

resource "aws_vpc" "first-vpc" {
    cidr_block = "10.0.0.0/16"
    tags = {
        Name = "Production"
    }
}
resource "aws_subnet" "subnet1" {
    vpc_id      = aws_vpc.first-vpc.id
    cidr_block  = "10.0.1.0/24"
    tags = {
        Name = "prod-subnet"
    }
}

resource "aws_vpc" "second-vpc" {
    cidr_block = "10.1.0.0/16"
    tags = {
        Name = "Dev"
    }
}
resource "aws_subnet" "subnet2" {
    vpc_id      = aws_vpc.second-vpc.id
    cidr_block  = "10.1.1.0/24"
    tags = {
        Name = "dev-subnet"
    }
}