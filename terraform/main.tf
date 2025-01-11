provider "azurerm" {
  features {}
}

data "azurerm_resource_group" "example" {
  name = var.resource_group_name
}

data "azurerm_subnet" "example" {
  name                 = var.subnet_name
  virtual_network_name = var.virtual_network_name
  resource_group_name  = data.azurerm_resource_group.example.name
}

resource "azurerm_public_ip" "example" {
  name                = "${var.name}-public-ip"
  resource_group_name = data.azurerm_resource_group.example.name
  location            = var.location
  allocation_method   = "Static"
  sku                 = "Standard"
}

module "application_gateway" {
  source = "./modules/application_gateway"

  name                           = var.name
  resource_group_name            = data.azurerm_resource_group.example.name
  location                       = var.location
  sku_name                       = var.sku_name
  sku_tier                       = var.sku_tier
  sku_capacity                   = var.sku_capacity
  subnet_id                      = data.azurerm_subnet.example.id
  public_ip_address_id           = azurerm_public_ip.example.id
  frontend_port                  = var.frontend_port
  cookie_based_affinity          = var.cookie_based_affinity
  backend_http_settings_port     = var.backend_http_settings_port
  backend_http_settings_protocol = var.backend_http_settings_protocol
  backend_http_settings_request_timeout = var.backend_http_settings_request_timeout
  http_listener_protocol         = var.http_listener_protocol
  request_routing_rule_type      = var.request_routing_rule_type
  tags                           = var.tags
}
