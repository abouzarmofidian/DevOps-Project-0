output "jenkins_public_ip" {
    description = "Public IP of jenkins instance"
    value = aws_instance.Jenkins.public_ip
}

output "ansible_public_ip" {
    description = "Public IP of ansible instance"
    value = aws_instance.Ansible.public_ip
}