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

variable "vcd_network_name" {
  description = "A unique name for the network"
}

variable "vcd_edge_gateway" {
  description = "The name of the edge gateway "
}

variable "vcd_network_netmask" {
  description = "The netmask for the new network. Defaults to 255.255.255.0"
  default = "255.255.255.0"
}

variable "vcd_gateway_address" {
  description = "The gateway for this network"
}

variable "vcd_network_dns1" {
  description = "First DNS server to use"
  default     = "8.8.8.8"
}

variable "vcd_network_dns2" {
  description = "Second DNS server to use"
  default     = "8.8.4.4"
}
variable "vcd_network_dnssuffix" {
  description = "A FQDN for the virtual machines on this network"
}

variable "vcd_network_dhcp_pool" {
  description = "A range of IPs to issue to virtual machines that don't have a static IP"
}

variable "vcd_network_dhcp_start_address" {
  description = "The first address in the IP Range"
}

variable "vcd_network_dhcp_end_address" {
  description = "The end address in the IP Range"
}



# VCD vm provision

#data "template_file" "init" {
  #template = "${file("${path.cwd}/setup.sh")}"
  #template = "${file("setup.sh")}"
#}

provider "vcd" {
  allow_unverified_ssl = "${var.allow_unverified_ssl}"
  user = "${var.vcd_user_name}"
  password = "${var.vcd_user_password}"
  org = "${var.vcd_org_name}"
  url = "${var.vcd_host_url}"
  vdc = "${var.vcd_vdc_name}"
  max_retry_timeout = "60"
}


resource "vcd_network" "net" {
  name         = "${var.vcd_network_name}"
  edge_gateway = "${var.vcd_edge_gateway}"
  gateway      = "${var.vcd_gateway_address}"

  dhcp_pool {
    start_address = "${var.vcd_network_dhcp_start_address}"
    end_address   = "${var.vcd_network_dhcp_end_address}"
  }

  #static_ip_pool {
  #  start_address = "${var.vcd_user_name}"
  #  end_address   = "${var.vcd_user_name}"
  #}
}
