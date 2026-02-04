output "id_publico_maquina_ec2" {
  description = "Id publico da maquina EC2"
  value = aws_instance.maquina_ec2.public_ip
}

output "nome_bucket" {
  description = "Nome da bucket S3"
  value = aws_s3_bucket.bucket.bucket
}