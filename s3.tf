# resource "aws_s3_bucket" "terraform_state" {
#   bucket = "masoudterraformstate1"
#   versioning {
#     enabled = true
#   }
#   lifecycle {
#     prevent_destroy = true
#   }
# }

