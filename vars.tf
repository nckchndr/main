variable "vpc_cidr" {
  type        = string
  description = "cidr for vpc"
  default     = "10.0.0.0/16"
}

variable "subnet_cidr" {
  type        = string
  description = "cidr for subnet"
  default     = "10.0.0.0/24"
}

variable "aws_az" {
  type        = string
  description = "availability zone"
  default     = "ca-central-1a"
}

variable "windows_instance_type" {
  type        = string
  description = "EC2 instance type for Windows Server"
  default     = "t2.micro"
}

variable "windows_instance_name" {
  type        = string
  description = "EC2 instance name for Windows Server"
  default     = "tfwinsrv01"
}

variable "windows_associate_public_ip_address" {
  type        = bool
  description = "Associate a public IP address to the EC2 instance"
  default     = true
}