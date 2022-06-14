resource "azurerm_availability_set" "availabilitySet" {
  name                         = var.linux_avs
  location                     = var.location
  resource_group_name          = azurerm_resource_group.rg.name
  platform_fault_domain_count  = "2"
  platform_update_domain_count = "5"
}

resource "azurerm_network_interface" "net_interface1" {
  count               = var.nb_count
  name                = "${var.linux_name}-nic-${format("%1d", count.index + 1)}"
  location            = var.location
  resource_group_name = var.rg
  tags                = local.common_tags

  ip_configuration {
    name                          = "${var.linux_name}-ipconfig1-${format("%1d", count.index + 1)}"
    subnet_id                     = azurerm_subnet.subnet1.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = element(azurerm_public_ip.publicIp1[*].id, count.index + 1)
  }
}



resource "azurerm_public_ip" "publicIp1" {
  count               = var.nb_count
  name                = "${var.linux_name}-pip-${format("%1d", count.index + 1)}"
  resource_group_name = var.rg
  location            = var.location
  allocation_method   = "Static"
  tags                = local.common_tags
}


resource "azurerm_linux_virtual_machine" "VM1" {
  count                           = var.nb_count
  name                            = "${var.linux_name}${format("%1d", count.index + 1)}"
  computer_name                   = "${var.linux_name}-comp-${format("%1d", count.index + 1)}"
  resource_group_name             = var.rg
  location                        = var.location
  size                            = var.size
  admin_username                  = var.username
  admin_password                  = var.password
  disable_password_authentication = false
  tags                            = local.common_tags
  network_interface_ids = [
    element(azurerm_network_interface.net_interface1[*].id, count.index + 1)
  ]


  os_disk {
    name                 = "${var.linux_name}-os-disk-${format("%1d", count.index + 1)}"
    caching              = var.os_disk_attr["caching"]
    storage_account_type = var.os_disk_attr["stroage_acc_type"]
  }

  source_image_reference {
    publisher = var.OSLinuxInfo["OS_Linux_publisher"]
    offer     = var.OSLinuxInfo["OS_Linux_Offer"]
    sku       = var.OSLinuxInfo["OS_Sku"]
    version   = var.OSLinuxInfo["OS_version"]
  }
}
