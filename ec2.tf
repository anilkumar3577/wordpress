resource "aws_instance" "word-ec2" {
 ami = "ami-08e2d37b6a0129927"
 instance_type = "t2.micro"
 key_name = "word"
 vpc_security_group_ids = ["${aws_security_group.word-sg.id}"]
 subnet_id = "${aws_subnet.w-pub-1.id}"
 associate_public_ip_address = true
 user_data = "${file("data.sh")}"
tags = {
 Name = "word-ec2"
}
}
