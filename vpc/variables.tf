variable "cidr_values" {
  type = string
}

variable "environment" {
    type = string
    validation {
        condition     = contains(["dev", "qa", "uat", "prod"], var.environment)
        error_message = "Environments should be one of dev, qa, uat or prod"
    }
}

variable "project_name" {
    type = string
}

variable "vpc_tags" {
  type = map(string)
  default = {}
}