# This is a terraform generated template generated from blueprint89

##############################################################
# Keys - CAMC (public/private) & optional User Key (public)
##############################################################
variable "allow_unverified_ssl" {
  description = "Communication with vsphere server with self signed certificate"
  default     = "true"
}

##############################################################
# Define the vsphere provider
##############################################################


provider "camc" {
  version = "~> 0.2"
}

##############################################################
# Define pattern variables
##############################################################

##############################################################
# Vsphere data for provider
##############################################################


#########################################################
##### Resource : vm
#########################################################

variable "vcd_user_name" {
  description = "User name for VCD login"
}

variable "vcd_user_password" {
  description = "Password for VCD login"
}

variable "vcd_tenancy_name" {
  description = "Tenancy name"
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

variable "vcd_vm_name" {
  description = "VM name"
}

variable "vcd_catalog_name" {
  description = "catalog name"
  default = "Public IAAS"
}

variable "vcd_vm_template_name" {
  description = "template name"
  default = "W2016_STD_Full_Gold_201710"
}

variable "vcd_network_name" {
  description = "Network name"
  default = "TWG-ICP"
}

# VCD vm provision
provider "vcd" {
  allow_unverified_ssl = "${var.allow_unverified_ssl}"
  user = "${var.vcd_user_name}"
  password = "${var.vcd_user_password}"
  org = "${var.vcd_org_name}"
  url = "${var.vcd_host_url}"
  vdc = "${var.vcd_vdc_name}"
}


resource "vcd_vapp" "DO-NOT-DELETE-ROHIT" {
  name  = "${var.vcd_vm_name}"
  catalog_name = "${var.vcd_catalog_name}"
  template_name = "${var.vcd_vm_template_name}"
  network_name = "${var.vcd_network_name}"
}
