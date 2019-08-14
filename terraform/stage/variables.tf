variable project {
  description = "Project ID"
}

variable region {
  description = "Region"

  # Значение по умолчанию
  default = "europe-west1"
}

variable zone {
  description = "zone"

  # Значение по умолчанию
  default = "europe-west1-b"
}

variable public_key_path {
  # Описание переменной
  description = "Path to the public key used for ssh access"
}

variable private_key_path {
  # Описание переменной
  description = "Path to the private key used for ssh access"
}

variable disk_image {
  description = "Disk image"
}

variable app_disk_image {
  description = "Disk image for reddit app"
  default     = "reddit-app-base"
}

variable db_disk_image {
  description = "Disk image for reddit db"
  default     = "reddit-db-base"
}

variable ansible-host_disk_image {
  description = "Disk image for ansible host"
  default     = "reddit-app-base"
}

variable ansible_path {
  description = "путь до папки с ansible"
}