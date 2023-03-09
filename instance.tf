resource "azurerm_windows_virtual_machine" "sycor" {
  count                 = length(var.vmname)
  name                  = var.vmname[count.index]
  resource_group_name   = azurerm_resource_group.sycor.name
  location              = azurerm_resource_group.sycor.location
  size                  = "Standard_F2"
  admin_username = lookup(var.admin_username, var.vmname[count.index], null)
  admin_password = lookup(var.admin_password, var.vmname[count.index], null)
  network_interface_id = azurerm_network_interface.sycor[count.index].id
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


