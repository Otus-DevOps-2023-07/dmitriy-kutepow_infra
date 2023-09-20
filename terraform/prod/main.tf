terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "0.95.0"
    }
  }
}

provider "yandex" {
  service_account_key_file = var.service_account_key_file
  cloud_id                 = var.cloud_id
  folder_id                = var.folder_id
  zone                     = var.zone
}

module "app" {
  source                   = "../modules/app"
  service_account_key_file = var.service_account_key_file
  cloud_id                 = var.cloud_id
  ubuntu_private_key_path  = var.ubuntu_private_key_path
  image_id                 = var.image_id
  folder_id                = var.folder_id
  public_key_path          = var.public_key_path
  app_disk_image           = var.app_disk_image
  subnet_id                = var.subnet_id
}

module "db" {
  source                   = "../modules/db"
  service_account_key_file = var.service_account_key_file
  cloud_id                 = var.cloud_id
  ubuntu_private_key_path  = var.ubuntu_private_key_path
  image_id                 = var.image_id
  folder_id                = var.folder_id
  public_key_path          = var.public_key_path
  db_disk_image            = var.db_disk_image
  subnet_id                = var.subnet_id
}
