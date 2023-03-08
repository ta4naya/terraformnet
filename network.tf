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
resource "azurerm_subnet" "sidcor" {
  name                 = "internal1"
  resource_group_name  = azurerm_resource_group.sycor.name
  virtual_network_name = azurerm_virtual_network.sycor.name
  address_prefixes     = ["10.0.3.0/24"]
}

resource "azurerm_network_interface" "sycor" {
  count               = length(var.vmnic)
  name                = var.vmnic[count.index]
  location            = azurerm_resource_group.sycor.location
  resource_group_name = azurerm_resource_group.sycor.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.sycor.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_network_interface" "sidcor" {
  count               = length(var.vmnic2)
  name                = var.vmnic2[count.index]
  location            = azurerm_resource_group.sycor.location
  resource_group_name = azurerm_resource_group.sycor.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.sidcor.id
    private_ip_address_allocation = "Dynamic"
  }
}

 