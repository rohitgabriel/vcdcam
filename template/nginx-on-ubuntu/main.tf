# This is a terraform generated template generated from blueprint89

##############################################################
# Keys - CAMC (public/private) & optional User Key (public)
##############################################################
variable "allow_unverified_ssl" {
  description = "Communication with vsphere server with self signed certificate"
  default     = "true"
}
variable "power_off" {
  description = "power on vapp or vm"
  default     = "false"
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


# VCD vm provision

data "template_file" "init" {
  #template = "${file("${path.cwd}/setup.sh")}"
  template = "${file("setup.sh")}"
}

provider "vcd" {
  allow_unverified_ssl = "${var.allow_unverified_ssl}"
  user = "${var.vcd_user_name}"
  password = "${var.vcd_user_password}"
  org = "${var.vcd_org_name}"
  url = "${var.vcd_host_url}"
  vdc = "${var.vcd_vdc_name}"
  max_retry_timeout = "120"
}


resource "vcd_vapp" "vtest" {
  name  = "${var.vcd_vapp_name}"
  network_name = "${var.vcd_network_name}"
  power_on = "${var.power_off}"
}


resource "vcd_vapp_vm" "vmname" {
  vapp_name = "${vcd_vapp.vtest.name}"
  name = "${var.vcd_vapp_name}"
  catalog_name = "${var.vcd_catalog_name}"
  template_name = "${var.vcd_vm_template_name}"
  network_name = "${var.vcd_network_name}"
  initscript    = "${data.template_file.init.rendered}"
  ip = "${var.vcd_ip_addr}"
}

output "vm_ip" {
    value = "${vcd_vapp_vm.vmname.ip}"
}
