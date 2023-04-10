region = "us-west-2"
# VPC Variable
vpc_cidr = "192.168.0.0/16"
vpc_name = "prod-vpc"
# Internet Gateway 
gw_name = "prod-igw"
# Route
all_cidr = "0.0.0.0/0"
# Subnet
public_subnet1_cidr = "192.168.1.0/24"
public_subnet2_cidr = "192.168.2.0/24"
private_subnet_cidr = "192.168.3.0/24"
availability_zone   = "eu-central-1a"
# Jenkins SG
jenkins_port = "8080"
ssh_port     = "22"
# Sonarqube SG
sonarqube_port = "9000"
# Grafana SG
grafana_port = "3000"
# App SG
http_port = "80"
# SSH Key
key_name  = "auth_key"
key_value = "ssh"
linux2_ami = "aa"
micro_instance = "t2.micro"