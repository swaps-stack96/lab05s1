output "DNSs" {
  value = azurerm_public_ip.publicIp1[*].domain_name_label
}

output "linux_avail_set_names" {
  value = azurerm_availability_set.availabilitySet[*].name
}


output "Linux_vms_ops" {
  value = azurerm_linux_virtual_machine.VM1[*].name
}

output "Nic_ops" {
  value = azurerm_network_interface.net_interface1[*].name
}

output "PIPs" {
  value = azurerm_public_ip.publicIp1[*].name
}

output "VMVnetName" {
  value = azurerm_virtual_network.vnet.name
}

output "AddressSpace" {
  value = azurerm_virtual_network.vnet.address_space
}

output "SubnetName1" {
  value = azurerm_subnet.subnet1.name
}

output "SubnetName2" {
  value = azurerm_subnet.subnet2.name
}

output "AddressSpace1" {
  value = azurerm_subnet.subnet1.address_prefixes
}

output "AddressSpace2" {
  value = azurerm_subnet.subnet2.address_prefixes
}



