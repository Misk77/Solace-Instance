output "solace_DNS_address" {
  value = aws_instance.solace-instance.public_dns
}

output "Solace_IP_address" {
  value = aws_instance.solace-instance.public_ip
}
