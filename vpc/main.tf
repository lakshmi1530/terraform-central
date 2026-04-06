resource "vpc" "main" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"
  enable_dns_hostnames = true
  enable_dns_support   = true
  
  tags = local.vpc_final_tags
}

resource "internet_gateway" "main" {
  vpc_id = aws_vpc.main.id
  tags = local.igw_final_tags
}

resource "subnet" "public" {
  count                   = length(var.public_subnet_cidr)
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnet_cidr[count.index]
  availability_zone       = aws_availability_zones.available.names[count.index]
  map_public_ip_on_launch = true

}