variable "project_name" {
  default = "guelo-project"
  type = string
  description = "O nome do seu projeto na GCP"
}

variable "chave_ssh" {
  default = "/Users/bruno/.ssh/id_rsa.pub"
  type = string
  description = "local na sua maquina onde a sua chave publica está"
}

variable "region" {
  default = "us-central1"
  type = string
  description = "A regiao onde seu cluster vai ficar"
}

variable "zone" {
  default = "us-central1-a"
  type = string
  description = "A zona onde seu cluster vai ficar"
}

variable "ip_cidr_range" {
  default = "10.240.0.0/24"
  type = string
  description = "Range de IP interno usado no cluster"
}

variable "quantidade_control_plane" {
  default = 1
  type = number
  description = "Quantidade de control planes que tera o seu cluster"
}

variable "quantidade_workers" {
  default = 2
  type = number
  description = "Quantidade de workers que tera o seu cluster"
}

variable "tipo_da_maquina" {
  default = "e2-standard-2"
  type = string
  description = "Tipo da maquina do deploy"
}

variable "sistema_operacional" {
  default = "ubuntu-os-cloud/ubuntu-2204-lts"
  type = string
  description = "Sistema operacional usado"
}

variable "disk_size" {
  default = 20
  type = number
  description = "Tamanho do disco da maquina"
}

variable "user_so" {
  default = "guelo"
  type = string
  description = "usuario default para uso do SO"
}