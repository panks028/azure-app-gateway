output "application_gateway_id" {
  description = "The ID of the Application Gateway."
  value       = module.application_gateway.application_gateway_id
}

output "public_ip_address_id" {
  description = "The ID of the Public IP Address."
  value       = azurerm_public_ip.example.id
}

output "subnet_id" {
  description = "The ID of the Subnet."
  value       = data.azurerm_subnet.example.id
}
