variable "project" {
  default ="roboshop"
}

variable "environment" {
  default ="dev"
}

variable "component" {
  
}

variable "rule_priority" {
  
}

# Domain
variable "domain_name" {
  type = string
  default= "mahidevops.fun"
}

variable "instance_profile" {
  default = null
}