
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
