resource "aws_security_group" "main" {
  count = length(var.sg_names)
  vpc_id = var.vpc_id
  description = "allows inbound traffic for ${var.project} in ${var.environment} environment to ${var.sg_names[count.index]} application"
  name = "${var.project}-${var.environment}-${var.sg_names[count.index]}" #roboshop-dev-catalog-sg
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  tags = merge(
    var.sg_tags,
    local.common_tags,
    {
        Name = "${var.project}-${var.environment}-${var.sg_names[count.index]}" #roboshop-dev-catalog-sg, roboshop-dev-user-sg ...
    }
  )
}