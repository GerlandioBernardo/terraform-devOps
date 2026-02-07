# Provisionamento de EC2 (Ubuntu) e Bucket S3 com Terraform

Este projeto utiliza **Terraform** para provisionar automaticamente uma **instância EC2 com Ubuntu**, instalar **Docker e NGINX** via `user_data`, e criar um **bucket S3** na AWS.

📘 **Projeto desenvolvido para a disciplina de DevOps**, com foco em Infraestrutura como Código (IaC) utilizando a AWS.

O projeto pode ser executado de duas formas:

* 🔹 **Manual (passo a passo com comandos Terraform)**
* 🔹 **Automatizado (via script `deploy.sh`)**

---

## 📁 Estrutura do Projeto

```
.
├── main.tf
├── provider.tf
├── variables.tf
├── outputs.tf
├── versions.tf
├── terraform.tfvars.example
├── user_data.sh
├── deploy.sh
├── .gitignore
└── README.md
```

---

## 📚 Tecnologias Utilizadas

* Terraform
* AWS EC2
* AWS S3
* Ubuntu
* Docker
* NGINX

---

## 🔐 Pré-requisitos

Antes de começar, você precisa ter:

* Conta na **AWS**
* **Access Key** e **Secret Key** da AWS
* **Terraform CLI** instalado
* **Git**

### Verificando o Terraform

```bash
terraform -version
```

---

## ⚙️ Configuração das Credenciais

### Arquivo `terraform.tfvars`

Crie um arquivo chamado `terraform.tfvars` (não versionado):

```hcl
chave_acesso_aws  = "SUA_ACCESS_KEY"
chave_secreta_aws = "SUA_SECRET_KEY"
nome_bucket       = "NOME_BUCKET"
```

📌 O arquivo `terraform.tfvars.example` serve apenas como **modelo** e pode ser versionado.

---

## 🚀 Como obter o projeto

Clone o repositório:

```bash
git clone git@github.com:GerlandioBernardo/terraform-devOps.git
```
Entre na pasta do projeto:

```bash
cd terraform-devOps
```

⚠️ **Importante**: todos os comandos do Terraform devem ser executados dentro da pasta do projeto.

---

## 🚀 Execução Manual (Passo a Passo)

### 1️⃣ Inicializar o Terraform

```bash
terraform init
```

Baixa os providers necessários e prepara o projeto.

---

### 2️⃣ Validar a configuração

```bash
terraform validate
```

Verifica erros de sintaxe e configuração nos arquivos `.tf`.

---

### 3️⃣ Gerar o plano de execução

```bash
terraform plan
```

Mostra tudo que será criado (EC2, Security Group e S3).


---

### 4️⃣ Aplicar a infraestrutura

```bash
terraform apply
```

Digite `yes` quando solicitado.

---

### 5️⃣ Verificar recursos criados

```bash
terraform state list
```

Saída esperada:

```
data.aws_ami.ubuntu
aws_instance.maquina_ec2
aws_s3_bucket.bucket
aws_security_group.ifpb_security_group
```

---

### 6️⃣ Acessar o NGINX

No navegador:

```
http://IP_PUBLICO_DA_EC2
```

Você deverá ver a página padrão do **NGINX**, confirmando que o `user_data.sh` funcionou corretamente.

---

### 7️⃣ Destruir a infraestrutura

```bash
terraform destroy
```
Quando solicitado, digite **yes** para confirmar.

Esse comando **remove todos os recursos criados pelo Terraform na AWS**, incluindo:

- Instância EC2

- Bucket S3

- Security Group

⚠️ **Atenção**: use com cuidado, pois a remoção é irreversível e pode resultar em perda de dados.

---

## 🤖 Execução Automatizada (`deploy.sh`)

O script `deploy.sh` automatiza todo o processo:

* `terraform init`
* `terraform validate`
* `terraform plan`
* `terraform apply` (sem pedir `yes`)

### Tornar executável

```bash
chmod +x deploy.sh
```

### Executar

```bash
./deploy.sh
```

Ao final, a mensagem exibida será:

```
Infraestrutura (ec2 e bucket s3) criada com sucesso!
```

---

## 🐳 Docker e NGINX

A instalação é feita automaticamente via `user_data.sh`:

* Docker instalado e iniciado
* NGINX instalado e em execução

A comprovação é o acesso à página padrão do NGINX via navegador.

