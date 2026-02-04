variable "regiao_aws" {
    description = "Região da AWS"
    type = string
    default = "us-east-1"
}

variable "chave_acesso_aws" {
  description = "Chave de acessso da AWS"
  type = string
  sensitive = true
}

variable "chave_secreta_aws" {
  description = "Chave Secreta da AWS"
  type = string
  sensitive = true
}

variable "nome_bucket" {
  description = "Nome do bucket S3"
  type = string
}