resource "azurerm_windows_virtual_machine" "sycor" {
  count                 = length(var.vmname)
  name                  = var.vmname[count.index]
  resource_group_name   = azurerm_resource_group.sycor.name
  location              = azurerm_resource_group.sycor.location
  size                  = "Standard_F2"
  admin_username        = var.admin_login
  admin_password        = var.admin_password
  network_interface_ids = [azurerm_network_interface.sycor[count.index].id, ]
  os_disk {
    name                 = "${var.vmname[count.index]}-os-disk-01"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  source_image_reference {
    publisher = var.image_publisher
    offer     = var.image_offer
    sku       = var.image_sku
    version   = "latest"
  }
}

resource "azurerm_windows_virtual_machine" "sidcor" {
  count                 = length(var.vmname1)
  name                  = var.vmname1[count.index]
  resource_group_name   = azurerm_resource_group.sycor.name
  location              = azurerm_resource_group.sycor.location
  size                  = "Standard_F2"
  admin_username        = var.admin_login1
  admin_password        = var.admin_password2
  network_interface_ids = [azurerm_network_interface.sidcor[count.index].id, ]
  os_disk {
    name                 = "${var.vmname1[count.index]}-os-disk-01"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  source_image_reference {
    publisher = var.image_publisher
    offer     = var.image_offer
    sku       = var.image_sku
    version   = "latest"
  }
}

