locals {
  common_tags = {
    project     = var.project_name
    Environment = var.environment
    terraform   = "true"
  }
  vpc_final_tags = merge(
    local.common_tags,
    {
        Name = "${var.project_name}-${var.environment}-vpc"
    },
    var.vpc_tags
  )
}