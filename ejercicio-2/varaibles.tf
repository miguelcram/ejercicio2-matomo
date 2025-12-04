variable "matomo_database" {
  type        = string
  description = "Nombre de la base de datos para Matomo"
}

variable "matomo_user" {
  type        = string
  description = "Usuario de la base de datos para Matomo"
}

variable "matomo_password" {
  type        = string
  description = "Contraseña del usuario de la base de datos para Matomo"
}

variable "matomo_root_password" {
  type        = string
  description = "Contraseña root de la base de datos MariaDB"
}

variable "dockerhub_user" {
  type        = string
  description = "Usuario de DockerHub"
}
