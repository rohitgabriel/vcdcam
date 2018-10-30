
##############################################################
# Vsphere data for provider
##############################################################


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

variable "allow_unverified_ssl" {
    description = "Communication with vsphere server with self signed certificate"
    default     = "true"
}

variable "vm_private_ssh_key" { }
variable "vm_public_ssh_key" { }

variable "vm_vcpu" {
  description = "Number of virtual CPU for the virtual machine, which is required to be a positive Integer"
  default = "1"
}

variable "vm_memory" {
  description = "Memory assigned to the virtual machine in megabytes. This value is required to be an increment of 1024"
  default = "1024"
}

variable "random" { type = "string" description = "Random String Generated"}

variable "dependsOn" {
  default = "true"
  description = "Boolean for dependency"
}

variable "user" {
  description = "User name for VCD login"
}

variable "name" {
  description = "VM name"
}

variable "vcd_user_name" {
  description = "User name for VCD login"
}

variable "password" {
  description = "Password for VCD login"
}

variable "org" {
  description = "Org name"
  default = "tstcs1"
}

variable "url" {
  description = "VCD host url"
  default     = "https://portal.nzcc.ihost.com/api"
}

variable "vdc" {
  description = "VDC name"
  default     = "TSTCS1-PAYG"
}

variable "vapp_name" {
  description = "Vapp name"
}

variable "catalog_name" {
  description = "catalog name"
  default = "Appliances and media"
}

variable "template_name" {
  description = "template name"
  default = "Ubuntu-1604-linux"
}

variable "network_name" {
  description = "Network name"
  default = "TWG-ICP"
}

variable "ip" {
  description = "Static IP address"
  default = "TWG-ICP"
}
