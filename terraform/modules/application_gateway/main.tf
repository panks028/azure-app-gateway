resource "azurerm_application_gateway" "example" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku {
    name     = var.sku_name
    tier     = var.sku_tier
    capacity = var.sku_capacity
  }
  gateway_ip_configuration {
    name      = "${var.name}-gateway-ip-config"
    subnet_id = var.subnet_id
  }
  frontend_ip_configuration {
    name                 = "${var.name}-frontend-ip-config"
    public_ip_address_id = var.public_ip_address_id
  }
  frontend_port {
    name = "${var.name}-frontend-port"
    port = var.frontend_port
  }
  backend_address_pool {
    name = "${var.name}-backend-pool"
  }
  backend_http_settings {
    name                  = "${var.name}-backend-http-settings"
    cookie_based_affinity = var.cookie_based_affinity
    port                  = var.backend_http_settings_port
    protocol              = var.backend_http_settings_protocol
    request_timeout       = var.backend_http_settings_request_timeout
  }
  http_listener {
    name                           = "${var.name}-http-listener"
    frontend_ip_configuration_name = "${var.name}-frontend-ip-config"
    frontend_port_name             = "${var.name}-frontend-port"
    protocol                       = var.http_listener_protocol
  }
  request_routing_rule {
    name                       = "${var.name}-request-routing-rule"
    rule_type                  = var.request_routing_rule_type
    http_listener_name         = "${var.name}-http-listener"
    backend_address_pool_name  = "${var.name}-backend-pool"
    backend_http_settings_name = "${var.name}-backend-http-settings"
  }
  tags = var.tags
}
