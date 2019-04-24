
resource "google_compute_instance" "app" {
name = "ansible-host"
machine_type = "g1-small"
zone = "${var.zone}"
tags = ["ansible-host"]

boot_disk {
initialize_params { image = "${var.ansible-host_disk_image}" }
}

network_interface {
network = "default"
access_config = {}
}
metadata {
ssh-keys = "appuser:${file(var.public_key_path)}"
}
connection {
type = "ssh"
user = "appuser"
agent = false
# путь до приватного ключа
private_key = "${file("${var.private_key_path}")}"
}
provisioner "remote-exec" {
script = "../files/ansible_install.sh"
}

}



# resource "google_compute_address" "app_ip" { name = "ansible-host-ip" }



