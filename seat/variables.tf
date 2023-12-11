variable "instance_type" {
  type    = string
  default = "t3.large"
}

variable "student_id" {
  type = string
  default = "glenn"
}

variable "student_email" {
  type = string
  default = "glenn.bech@gmail.com"
}

variable "region" {
  type = string
  default = "eu-west-1"
}

variable "name_prefix" {
  type    = string
  default = "fargate-basic-example"
}