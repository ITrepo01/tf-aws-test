data "aws_availability_zones" "all" {}

data "template_file" "user_data" {
  template = "${file("${path.module}/user-data.sh")}"

  vars {
    Server_port = "${var.Server_port}"
  }
}
