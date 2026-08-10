# AMI id
data "aws_ami" "joindevops" {
  owners      = ["973714476881"]
  most_recent = true

  filter {
    name   = "name"
    values = ["Redhat-9-DevOps-Practice"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

# SG id
data "aws_ssm_parameter" "sg_id" {
  name = "/${var.project}/${var.environment}/{var.component}-sg-id"  #/roboshop/dev/component-sg-id
}

# Both frontend and backend we place in private subnets 
data "aws_ssm_parameter" "private_subnet_ids" {
  name = "/${var.project}/${var.environment}-private-subnet-id"
}

# vpc id
data "aws_ssm_parameter" "vpc_id" {
  name =  "/${var.project}/${var.environment}-vpc_id"
}

# listeners
#backend
data "aws_ssm_parameter" "backend_listener_arn" {
  name =  "/${var.project}/${var.environment}/backend_alb_listener_arn"
}

# frontend
data "aws_ssm_parameter" "frontend_listener_arn" {
  name =  "/${var.project}/${var.environment}/frontend_alb_listener_arn"
}

