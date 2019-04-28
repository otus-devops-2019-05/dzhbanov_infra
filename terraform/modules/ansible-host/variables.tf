variable public_key_path {
description = "Path to the public key used to connect to instance"
}
variable zone {
description = "Zone"
}
variable ansible-host_disk_image {
description = "Disk image for ansible host"
default = "Ubuntu 16.04 LTS"
}

variable private_key_path {
# Описание переменной
description = "Path to the private key used for ssh access"
}

variable ansible_path {
  description = "путь до папки с ansible"
}