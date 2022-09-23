resource "aws_lb" "word-lb" {
  name               = "word-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.word-sg.id]
  subnets            = [aws_subnet.w-pub-1.id, aws_subnet.w-pub-2.id]
}

resource "aws_lb_target_group" "external-tg" {
  name     = "alb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.word-vpc.id
}

resource "aws_lb_target_group_attachment" "attach1" {
  target_group_arn = aws_lb_target_group.external-tg.arn
  target_id        = aws_instance.word-ec2.id
  port             = 80

  depends_on = [
    aws_instance.word-ec2,
  ]
}


resource "aws_lb_listener" "lb-listener" {
  load_balancer_arn = aws_lb.word-lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.external-tg.arn
  }
}
