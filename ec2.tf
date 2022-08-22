# Create EC2 Instance
resource "aws_instance" "windows-server" {
  ami                         = data.aws_ami.windows-2019.id
  instance_type               = var.windows_instance_type
  subnet_id                   = aws_subnet.subnetI.id
  vpc_security_group_ids      = [aws_security_group.aws-windows-sg.id]
  source_dest_check           = false
  key_name                    = aws_key_pair.key_pair.key_name
  user_data                   = data.template_file.windows-userdata.rendered
  associate_public_ip_address = var.windows_associate_public_ip_address
  get_password_data           = true
  tags = {
    Name = "Win-Ansible"
  }

}
#security group
# Define the security group for the Windows server
resource "aws_security_group" "aws-windows-sg" {
  name        = "windows-sg"
  description = "Allow incoming connections"
  vpc_id      = aws_vpc.vpc.id
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow incoming HTTP connections"
  }
  ingress {
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow incoming RDP connections"
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "windows-sg"
  }
}
