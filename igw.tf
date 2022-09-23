# Creating Internet Gateway
resource "aws_internet_gateway" "w-igw" {
 vpc_id = "${aws_vpc.word-vpc.id}"
tags = {
 Name = "w-igw"
}
}
