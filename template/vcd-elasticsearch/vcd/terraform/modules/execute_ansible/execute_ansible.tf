resource "null_resource" "execute_ansible_dependsOn" {
  provisioner "local-exec" {
    command = "echo The dependsOn output for Single Node is ${var.dependsOn}"
  }
}

resource "null_resource" "execute_ansible" {
  depends_on = ["null_resource.execute_ansible_dependsOn"]

  # Specify the ssh connection
  connection {
    type        = "ssh"
    user        = "${var.ansible_username}"
    password    = "${var.ansible_password}"
    private_key = "${var.ansible_private_key}"
    host        = "${var.ansible_hostname}"
  }

  # Create the Host File for example
  provisioner "file" {
    content = <<EOF
[webservers]
${var.vcd_ip_addr}

[dbservers]
${var.vcd_ip_addr}
EOF

    destination = "/tmp/ansible-playbook-host-elasticsearch"
  }

  # Produce a YAML file to override defaults.
  provisioner "file" {
    content = <<EOF

EOF

    destination = "/tmp/ansible-playbook-override"
  }

  # Execute the script remotely
  provisioner "remote-exec" {
    inline = [
      "sleep 90 && cd ${var.playbook_location} && ansible-playbook -i \"/tmp/ansible-playbook-host-elasticsearch\" main.yml -e \"ansible_python_interpreter=/usr/bin/python3\"",
    ]
  }
}

resource "null_resource" "execute_ansible_finished" {
  depends_on = ["null_resource.execute_ansible"]

  provisioner "local-exec" {
    command = "echo 'Ansible Binaries installed'"
  }
}
