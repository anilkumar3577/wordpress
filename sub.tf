# Creating 1st web subnet
resource "aws_subnet" "w-pub-1" {
 vpc_id = "${aws_vpc.word-vpc.id}"
 cidr_block = "192.168.100.0/24"
 map_public_ip_on_launch = true
 availability_zone = "us-west-2a"
tags = {
 Name = "w-pub-1"
}
}
# Creating 2nd web subnet
resource "aws_subnet" "w-pub-2" {
 vpc_id = "${aws_vpc.word-vpc.id}"
 cidr_block = "192.168.200.0/24"
 map_public_ip_on_launch = true
 availability_zone = "us-west-2b"
tags = {
 Name = "w-pub-2"
}
}
