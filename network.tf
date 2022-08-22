# create VPC
resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
}
#Create subnet
resource "aws_subnet" "subnetI" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.subnet_cidr
  availability_zone = var.aws_az
}
#Create IGW
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
}
#Create Route table
resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "route table win"
  }
}
#associate route table
resource "aws_route_table_association" "rta" {
  subnet_id      = aws_subnet.subnetI.id
  route_table_id = aws_route_table.rt.id
}