
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
access_config = {
nat_ip = "${google_compute_address.app_ip.address}"
}
}
metadata {
ssh-keys = "appuser:${file(var.public_key_path)}"
}
}






