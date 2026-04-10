locals {
  common_tags = {
    project     = var.project
    Environment = var.environment
    terraform   = "true"
  }
}