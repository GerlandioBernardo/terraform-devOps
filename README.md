## Execução Automatizada 

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



