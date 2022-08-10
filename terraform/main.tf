

resource "azurerm_linux_virtual_machine" "lavoro" {

  for_each            = toset(var.Role)
  name                = each.value
  resource_group_name = azurerm_resource_group.lavoro.name
  location            = azurerm_resource_group.lavoro.location
  size                = var.Size(each.value)

  admin_username      = "lavoro"
  network_interface_ids = [azurerm_network_interface.lavoro[each.key].id]

  admin_ssh_key {
    username   = "lavoro"
    public_key = file("~/.ssh/id_rsa.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }

}