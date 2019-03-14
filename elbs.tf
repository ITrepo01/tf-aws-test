resource "aws_elb" "example" {
  name               = "${var.cluster_name}-asg-example"
  availability_zones = ["${data.aws_availability_zones.all.names}"]
  security_groups    = ["${aws_security_group.elb.id}"]

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    interval            = 30
    target              = "HTTP:${var.Server_port}/"
  }

  listener {
    lb_port           = 80
    lb_protocol       = "http"
    instance_port     = "${var.Server_port}"
    instance_protocol = "http"
  }
}
