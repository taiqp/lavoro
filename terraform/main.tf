

resource "azurerm_linux_virtual_machine" "lavoro" {

  for_each              = toset(var.Role)
  name                  = each.value
  size                  = var.Size[each.value]
  network_interface_ids = [azurerm_network_interface.lavoro[each.key].id]

  resource_group_name = azurerm_resource_group.lavoro.name
  location            = azurerm_resource_group.lavoro.location
  admin_username      = "lavoro"

  admin_ssh_key {
    username   = "lavoro"
    public_key = file(var.PublicKey)
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

  provisioner "file" {
    source      = var.ProvisioningScript[each.value]
    destination = "/tmp/install.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/install.sh",
      "/tmp/install.sh",
    ]
  }
  connection {
    type        = "ssh"
    user        = "lavoro"
    private_key = file(var.PrivateKey)
    host        = self.public_ip_address
  }
}
