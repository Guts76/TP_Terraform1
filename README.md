# TP Terraform 

## Description
Création d'une instance EC2 Amazon à partir de VS Code

## Prérequis
1. VS Code
2. Un compte AWS
3. Terraform
4. Une clé SSH générer sur Internet 

   
## Démarrage

Se placer à la racine du projet et exécuter les commandes suivantes 

``` shell
terraform init 

terraform plan

terraform apply

# Attention à bien nommer son fichier avec la clé privé avec une extension .pem
ssh -i "jules_key.pem" ubuntu@ec2-3-66-225-240.eu-central-1.compute.amazonaws.com
```

## Notes

Documentation Terraform sur la génération de clé publique : 
[Terraform](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/key_pair)

Génration d'une clé ssh : 
[8gwifi.org](https://8gwifi.org/sshfunctions.jsp)


