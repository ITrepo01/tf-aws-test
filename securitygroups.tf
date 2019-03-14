resource "aws_security_group" "instance" {
  name = "${var.cluster_name}-instance-sg"

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_security_group_rule" "allow_vm_inbound" {
  type              = "ingress"
  security_group_id = "${aws_security_group.instance.id}"
  from_port         = "${var.Server_port}"
  to_port           = "${var.Server_port}"
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group" "elb" {
  name = "${var.cluster_name}-elb"
}

resource "aws_security_group_rule" "allow_inbound" {
  type              = "ingress"
  security_group_id = "${aws_security_group.elb.id}"
  from_port         = "${var.Server_port}"
  to_port           = "${var.Server_port}"
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "allow_outbound" {
  type              = "egress"
  security_group_id = "${aws_security_group.elb.id}"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
}
