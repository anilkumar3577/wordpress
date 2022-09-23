resource "aws_route_table" "word-rt" {
 vpc_id = "${aws_vpc.word-vpc.id}"
route {
 cidr_block = "0.0.0.0/0"
 gateway_id = "${aws_internet_gateway.w-igw.id}"
 }
tags = {
 Name = "word-rt"
 }
}
# Associating Route Table
resource "aws_route_table_association" "attachment1" {
 subnet_id = "${aws_subnet.w-pub-1.id}"
 route_table_id = "${aws_route_table.word-rt.id}"
}
# Associating Route Table
resource "aws_route_table_association" "attachment2" {
 subnet_id = "${aws_subnet.w-pub-2.id}"
 route_table_id = "${aws_route_table.word-rt.id}"
}
