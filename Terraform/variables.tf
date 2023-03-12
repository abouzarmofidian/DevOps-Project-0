variable "region" {
  type = string
}
variable "access_key" {
  type    = string
  default = "my_access_key"
}
variable "secret_key" {
  type    = string
  default = "my_secret_key"

}
variable "vpc_cidr" {
  type = string
}
variable "vpc_name" {
  type = string
}
variable "gw_name" {
  type = string
}
variable "all_cidr" {
  type = string
}
variable "public_subnet1_cidr" {
  type = string
}
variable "public_subnet2_cidr" {
  type = string
}
variable "private_subnet_cidr" {
  type = string
}
variable "availability_zone" {
  type = string
}