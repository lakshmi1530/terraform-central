variable "environment" {
    type = string
    validation {
        condition     = contains(["dev", "qa", "uat", "prod"], var.environment)
        error_message = "Environments should be one of dev, qa, uat or prod"
    }
}

variable "project" {
    type = string
}

variable "sg_names" {
    type = list(string)
}

variable "vpc_id" {
    type = string
}

variable "sg_tags" {
    type = map(string)
    default = {}
}