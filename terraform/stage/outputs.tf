output "app_external_ip" {
  value = "${module.app.app_external_ip}"
}

output "db_external_ip" {
  value = "${module.db.db_external_ip}"
}

output "ansible-host_external_ip" {
  value = "${module.ansible-host.ansible-host_external_ip}"
}