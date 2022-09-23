# Creating VPC 
resource "aws_vpc" "word-vpc" { 
 cidr_block = "192.168.0.0/16" 
  
tags = { 
 Name = "word-vpc"
} 
}
