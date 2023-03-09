resource "azurerm_network_security_group" "sycor" {
  name                = "sycor"
  location            = azurerm_resource_group.sycor.location
  resource_group_name = azurerm_resource_group.sycor.name


  tags = {
    environment = "Production"
  }
}

resource "azurerm_network_security_rule" "sycor" {
  name                        = "sycor"
  priority                    = 100
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "3389"
  destination_port_range      = "3389"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.sycor.name
  network_security_group_name = azurerm_network_security_group.sycor.name
}