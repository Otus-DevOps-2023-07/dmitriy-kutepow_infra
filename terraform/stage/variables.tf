variable "cloud_id" {
  description = "Cloud"
}
variable "folder_id" {
  description = "Folder"
}
variable "zone" {
  description = "Zone"
  # Значение по умолчанию
  default = "ru-central1-a"
}
variable "public_key_path" {
  # Описание переменной
  description = "Path to the public key used for ssh access"
}
variable "image_id" {
  description = "Disk image"
}
variable "subnet_id" {
  description = "Subnet"
}
variable "service_account_key_file" {
  description = "key.json"
}
variable "ubuntu_private_key_path" {
  description = "key.json"
}
variable "app_disk_image" {
  description = "Disk image for reddit app"
  default     = "fd8etjdb7dla20tbv2et"
}
variable "db_disk_image" {
  description = "Disk image for reddit db"
  default     = "fd81f9ur1lpp6qv8jkc7"
}
