variable "vm_os_password" {
  type = "string"

  description = "Operating System Password for the Operating System User to access virtual machine"
}

variable "vm_os_user" {
  type = "string"

  description = "Operating System user for the Operating System User to access virtual machine"
}

variable "vcd_ip_addr" {
  type = "string"

  description = "IPv4 Address's in List format"
}

variable "private_key" {
  type = "string"

  description = "Private SSH key Details to the Virtual machine"
}

variable "random" {
  type = "string"

  description = "Random String Generated"
}

variable "dependsOn" {
  default = "true"

  description = "Boolean for dependency"
}

variable "public_key" {
  type        = "string"
  description = "Public SSH key to be added to the Virtual machine"
}