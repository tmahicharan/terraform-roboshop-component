locals {
  ami_id=data.aws_ami.joindevops.id
  sg_id=data.aws_ssm_parameter.sg_id.value

  common_tags={
    terraform= "true"
    project= var.project
    environment= var.environment
  }
  common_name="${var.project}-${var.environment}"
  private_subnet_ids=split("," , data.aws_ssm_parameter.private_subnet_ids.value)
  vpc_id=data.aws_ssm_parameter.vpc_id.value
  port= "${var.component}" == "frontend" ? 80 : 8080
  path= "${var.component}" == "frontend" ? "/" : "/health"
  backend_listener_arn = data.aws_ssm_parameter.backend_listener_arn.value #data "aws_ssm_parameter" "backend_listener_arn"
  frontend_listener_arn = data.aws_ssm_parameter.frontend_listener_arn.value
  
  listener_arn= "${var.component}" == "frontend" ? local.frontend_listener_arn : local.backend_listener_arn
  host_header= "${var.component}" == "frontend" ? "${var.project}-${var.environment}.${var.domain_name}" : "${var.component}.backend-alb-${var.environment}.${var.domain_name}"
    
}