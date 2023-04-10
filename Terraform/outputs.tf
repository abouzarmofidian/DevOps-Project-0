output "jenkins_public_ip" {
    description = "Public IP of jenkins instance"
    value = aws_instance.Jenkins.public_ip
}