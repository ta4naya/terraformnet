resource "azurerm_windows_virtual_machine" "sycor" {
  count                 = length(var.vmname)
  name                  = var.vmname[count.index]
  resource_group_name   = azurerm_resource_group.sycor.name
  location              = azurerm_resource_group.sycor.location
  size                  = "Standard_F2"
  admin_username        = var.admin_login[count.index]
  admin_password        = var.admin_password[count.index]
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


