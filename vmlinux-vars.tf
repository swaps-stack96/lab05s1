locals {
  common_tags = {
    Name : "Terraform-Class"
    Project : "Learning"
    ContactEmail : "swapnil.shah996@gmail.com"
    Environment : "Lab"
  }
}


variable "linux_name" {
  default = "n01522053-db1-u-vm1"
}

variable "size" {
  default = "Standard_B1s"
}

variable "username" {
  default = "swapnil-n01522053"
}

variable "password" {
  default = "Swapnil@2053"
}

variable "os_disk_attr" {
  type = map(string)
  default = {
    stroage_acc_type = "Premium_LRS"
    disk_size        = "32"
    caching          = "ReadWrite"
  }
}

variable "OSLinuxInfo" {
  type = map(string)
  default = {
    OS_Linux_publisher = "Canonical"
    OS_Linux_Offer     = "UbuntuServer"
    OS_Sku             = "19.04"
    OS_version         = "latest"
  }
}

variable "linux_avs" {
  default = "availabilitySet"
}

variable "nb_count" {
  default = "2"
}
