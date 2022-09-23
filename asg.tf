resource "aws_launch_template" "word-lt" {
  name_prefix   = "word-lt"
  image_id      = "ami-08e2d37b6a0129927"
  instance_type = "t2.micro"
}

resource "aws_autoscaling_group" "bar" {
  availability_zones = ["us-west-2a"]
  desired_capacity   = 1
  max_size           = 2
  min_size           = 1

  launch_template {
    id      = aws_launch_template.word-lt.id
    version = "$Latest"
  }
}
