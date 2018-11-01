
##############################################################
# Vsphere data for provider
##############################################################
variable "allow_unverified_ssl" {
  description = "Communication with vsphere server with self signed certificate"
  default     = "true"
}

#Variable : vm_-name
variable "vm_name" {
  type = "string"
}
variable "count" {
  type = "string"
  default = "1"
}

#########################################################
##### Resource : vm_
#########################################################
variable "power_off" {
  description = "power on vapp or vm"
  default     = "false"
}

variable "vm_os_password" {
  type = "string"
  description = "Operating System Password for the Operating System User to access virtual machine"
}
variable "vm_os_user" {
  type = "string"
  description = "Operating System user for the Operating System User to access virtual machine"
  }

variable "vm_domain" {
    type        = "string"
    description = "Single Node Virtual Machine's domain name"
    default     = "icplab.com"
  }


variable "vm_vcpu" {
  description = "Number of virtual CPU for the virtual machine, which is required to be a positive Integer"
  default = "1"
}

variable "vm_memory" {
  description = "Memory assigned to the virtual machine in megabytes. This value is required to be an increment of 1024"
  default = "1024"
}

variable "dependsOn" {
  default = "true"
  description = "Boolean for dependency"
}



variable "vcd_user_name" {
  description = "User name for VCD login"
}

variable "vcd_user_password" {
  description = "Password for VCD login"
}

variable "vcd_org_name" {
  description = "Org name"
  default = "tstcs1"
}

variable "vcd_host_url" {
  description = "VCD host url"
  default     = "https://portal.nzcc.ihost.com/api"
}

variable "vcd_vdc_name" {
  description = "VDC name"
  default     = "TSTCS1-PAYG"
}

variable "vcd_vapp_name" {
  description = "Vapp name"
}

variable "vcd_catalog_name" {
  description = "catalog name"
  default = "Appliances and media"
}

variable "vcd_vm_template_name" {
  description = "template name"
  default = "Ubuntu-1604-linux"
}

variable "vcd_network_name" {
  description = "Network name"
  default = "TWG-ICP"
}

variable "vcd_ip_addr" {
  description = "Static IP address"
  default = "TWG-ICP"
}

variable "ansible_public_key_openssh" {
  type        = "string"
  description = "Ansible Node Public SSH key Details"
  default     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDhl+lothBobomKFiHdPx7b50UYyFg+5cUFA63K0kuGxXXxD5+eNULoPHvsl0nawLP+jau9lflAdBVd80rSk0jesKEsdau1gKOjSj5ppM00zkmwh1G4X+7ojhpNV1ZLMMxv0oPvBdR/LZ9tePJ5BGLxBvokoiyFBHuhZ4AXW/kyFKRpicaLiNBf3FwSrVq6EbZCI1k2Jn9nH/fIVW5tTFT9y24TWyOkAfogELjUVaONnEHnTlW4jR5vKf6VIe5IqxBs1HaL7iBbXCvIFBJ4euxHuAQCWlo4RbIKSF4X/5k0OrcMpPQE822RcYrsWmbZu5zTn0OaUOLrizTuD/WT1VWt7nk/jQzkxxy9+4y7tTrW6/P/tNsq/k6VoPHcXAC2oQ9VDyW7Ck2UiCriZz1+auQtP861XKYOxRgsYiNZzkW3UnDRi9tGHg9d3xO+eYpGtzKT7DwD1z1XT3biZuPYnT4yoPytMVV+1ddVBmPLreI98eAVCXleo2s66CTj3EnInSrP0a5BHxj1ChiiKb34bex9aI/ZIAI/LuzS7OFwcsXKZlwpKZZpShrNaX5fOVDNVk/WkRd485IBLHSm+n+d+E9I4fRsq+ZZtLcS0N1gmTO9AloDp8E4/GirXIuy/H4CacpXDPHTUcrNijbI4Op7L4vQxQQSRXJenR40bOPSvvY6Xw=="
}

variable "ansible_private_key" {
  type        = "string"
  description = "Ansible Node Private SSH key Details (base64)"
  default     = ""
}

variable "ansible_username" {
  description = "Ansible Username"
  default     = "root"
}

variable "ansible_password" {
  description = "Ansible Password"
  default     = "rootpassword"
}

variable "ansible_hostname" {
  description = "Ansible Host"
  default     = "10.0.0.40"
}

variable "playbook_location" {
  description = "PlayBook Location"
  default     = "/opt/ansible/playbooks/ansible-examples/lamp_simple"
}

variable "mysql_password" {
  description = "MySQL Password"
  default     = "Op3nPatterns"
}

variable "mysql_dbuser" {
  description = "MySQL Database UserName"
  default     = "dbuser"
}

variable "mysql_dbname" {
  description = "MySQL Database name"
  default     = "db01"
}

variable "mysql_dbport" {
  description = "MySQL Port Number"
  default     = "3309"
}
