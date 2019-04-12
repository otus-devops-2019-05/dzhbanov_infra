terraform {
# Версия terraform
required_version = "0.11.13"
}
provider "google" {
# Версия провайдера
version = "2.0.0"
# ID проекта
project = "infra-235619"
region = "europe-west-1"
}
