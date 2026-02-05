#!/bin/bash

echo "Inicializando o Terraform..."
terraform init

if [ $? -ne 0 ]; then
  echo "Erro no comando terraform init"
  exit 1
fi

echo "Validando os arquivos Terraform..."
terraform validate

if [ $? -ne 0 ]; then
  echo "Erro na validação dos arquivos Terraform"
  exit 1
fi

echo "Gerando o plano de execução..."
terraform plan -out=tfplan

if [ $? -ne 0 ]; then
  echo "Erro no comando terraform plan"
  exit 1
fi

echo "Aplicando a infraestrutura (ec2 e bucket s3)..."
terraform apply tfplan

if [ $? -ne 0 ]; then
  echo "Erro no comando terraform apply"
  exit 1
fi

echo "Infraestrutura (ec2 e bucket s3) criada com sucesso!"
