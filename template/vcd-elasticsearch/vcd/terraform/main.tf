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

  vapp_name = "${var.vcd_vapp_name}"
  name = "${var.vcd_vapp_name}"
  catalog_name = "${var.vcd_catalog_name}"
  template_name = "${var.vcd_vm_template_name}"
  network_name = "${var.vcd_network_name}"
  ip = "${var.vcd_ip_addr}"
  vm_private_ssh_key         = "${tls_private_key.generate.private_key_pem}"
  vm_public_ssh_key          = "${tls_private_key.generate.public_key_openssh}"
  vm_vcpu                    = "${var.vm_vcpu}"
  vm_name                    = "${var.vm_name}"
  vm_memory                  = "${var.vm_memory}"
  allow_unverified_ssl = "${var.allow_unverified_ssl}"
  user = "${var.vm_os_user}"
  password = "${var.vm_os_password}"
  org = "${var.vcd_org_name}"
  url = "${var.vcd_host_url}"
  vdc = "${var.vcd_vdc_name}"
  vm_os_password       = "${var.vm_os_password}"
  vm_os_user           = "${var.vm_os_user}"
  random                     = "${random_string.random-dir.result}"
  vcd_user_name = "${var.vcd_user_name}"
}


module "add_ansible_public_key" {
  source               = "./modules/add_public_ssh_key"
  private_key          = "${tls_private_key.generate.private_key_pem}"
  vm_os_password       = "${var.vm_os_password}"
  vm_os_user           = "${var.vm_os_user}"
  vcd_ip_addr          = "${var.vcd_ip_addr}"
  random               = "${random_string.random-dir.result}"
  dependsOn            = "${module.deployVM_singlenode.dependsOn}"
  public_key           = "${var.ansible_public_key_openssh}"
}

module "execute_elasticsearch_playbook" {
  source               = "./modules/execute_ansible"
  ansible_username     = "${var.ansible_username}"
  ansible_password     = "${var.ansible_password}"
  ansible_private_key  = "${var.ansible_private_key}"
  ansible_hostname     = "${var.ansible_hostname}"
  playbook_location    = "${var.playbook_location}"
  vcd_ip_addr          = "${var.vcd_ip_addr}"
  dependsOn            = "${module.add_ansible_public_key.dependsOn}"
}
