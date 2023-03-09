resource "azurerm_virtual_network" "sycor" {
  name                = "sycor-network"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.sycor.location
  resource_group_name = azurerm_resource_group.sycor.name
}

resource "azurerm_subnet" "sycor" {
  name                 = "internal"
  resource_group_name  = azurerm_resource_group.sycor.name
  virtual_network_name = azurerm_virtual_network.sycor.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_network_interface" "sycor" {
  count               = 2
  name                = "nic-${count.index}"
  location            = azurerm_resource_group.sycor.location
  resource_group_name = azurerm_resource_group.sycor.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.sycor.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.sycor[count.index].id
  }
}
data "azurerm_network_interface" "sycor" {
    count               = 2
    name                = "nic-${count.index}"
    resource_group_name = azurerm_resource_group.sycor.name
}

resource "azurerm_network_interface_security_group_association" "sycor" {
   count               = 2
  network_interface_id      = data.azurerm_network_interface.sycor[count.index].id
  network_security_group_id = azurerm_network_security_group.sycor.id
}

 resource "azurerm_public_ip" "sycor" {
  count               = 2
  name                = "pip-${count.index}"
  resource_group_name = azurerm_resource_group.sycor.name
  location            = azurerm_resource_group.sycor.location
  allocation_method   = "Dynamic"

  tags = {
    environment = "Production"
  }
}