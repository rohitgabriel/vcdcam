provider "vcd" {
  allow_unverified_ssl = "${var.allow_unverified_ssl}"
  user = "${var.vcd_user_name}"
  password = "${var.vcd_user_password}"
  org = "${var.vcd_org_name}"
  url = "${var.vcd_host_url}"
  vdc = "${var.vcd_vdc_name}"
  max_retry_timeout = "120"
}

provider "camc" {
  version = "~> 0.2"
}

provider "random" {
  version = "~> 1.0"
}

provider "local" {
  version = "~> 1.1"
}

provider "null" {
  version = "~> 1.0"
}

provider "tls" {
  version = "~> 1.0"
}

resource "random_string" "random-dir" {
  length  = 8
  special = false
}

resource "tls_private_key" "generate" {
  algorithm = "RSA"
  rsa_bits  = "4096"
}

resource "null_resource" "create-temp-random-dir" {
  provisioner "local-exec" {
    command = "${format("mkdir -p  /tmp/%s" , "${random_string.random-dir.result}")}"
  }
}

module "deployVM_singlenode" {
  source = "./modules/vmware_provision"

  vapp_name = "${vcd_vapp.vtest.name}"
  name = "${var.vcd_vapp_name}"
  catalog_name = "${var.vcd_catalog_name}"
  template_name = "${var.vcd_vm_template_name}"
  network_name = "${var.vcd_network_name}"
  initscript    = "${data.template_file.init.rendered}"
  ip = "${var.vcd_ip_addr}"
  vm_private_ssh_key         = "${tls_private_key.generate.private_key_pem}"
  vm_public_ssh_key          = "${tls_private_key.generate.public_key_openssh}"
  vm_vcpu                    = "${var.singlenode_vcpu}"
  vm_name                    = "${var.singlenode_prefix_name}"
  vm_memory                  = "${var.singlenode_memory}"


  random                     = "${random_string.random-dir.result}"
}

module "ansible_install" {
  source               = "./modules/install_ansible"
  private_key          = "${tls_private_key.generate.private_key_pem}"
  vm_os_password       = "${var.vm_os_password}"
  vm_os_user           = "${var.vm_os_user}"
  vm_ipv4_address_list = "${concat(var.vm_ipv4_address)}"
  random               = "${random_string.random-dir.result}"
  dependsOn            = "${module.deployVM_singlenode.dependsOn}"
}
