# Déclaration de variable est possible ici ou dans un fichier externe (vars.tf)

# Provider => plug-ins développés par HashiCorp ou par la communauté
# Définition d'un provider qui existe (développé par soi ou référence à un provider développé par la communauté : https://registry.terraform.io/browse/providers)
# Respecter la casse !
# LE module fournissant le provider fournit aussi une API 

provider "aws" {
    # Credentials information 
    # Première manière de réutiliser une variable ==> permet pas de faire des opérations
    #region = var.AWS_REGION 
    # Deuxième manière de réutiliser une variable ==> la deuxième permet de faire des opérations
    region = "${var.AWS_REGION}" 
    access_key= "AKIA4RFLI7DNMPTDCMSR"
    secret_key= "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"
}

# Déclaration de ressource permise par l'API du provider 

#resource "<Type_Resource>" "<Nom>"{
#   [Config]
#}

resource "aws_instance" "ec2_Instance1_JR" {
    instance_type = "t2.micro"
    ami = "${var.AWS_REGION_AMIS[var.AWS_REGION]}"
    # ami doit être cherché
    # Nom de l'instance donné dans tags ==> ne pas oublier le "=" pour tags
    tags = {
        # Name avec un "N" majuscule !
        Name = "jules_instance"
    }
    # On fait un tableau
    vpc_security_group_ids = [aws_security_group.ec2_security_group.id]
    key_name = aws_key_pair.key_pair_1.key_name # type.nom_ressource.attribut
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group
resource "aws_security_group" "ec2_security_group" {
    name = "jules_vpc_name"
    # Règles de stratégie sortantes
    egress {
        protocol = "-1"  # -1 pour "all"
        from_port = 0
        to_port = 0
        cidr_blocks = ["0.0.0.0/0"]
    }
    # Règles de stratégie entrantes
    ingress {
        protocol = "tcp"
        from_port = 10
        to_port = 80
        cidr_blocks = ["0.0.0.0/0"]
    }
}


resource "aws_key_pair" "key_pair_1"{
    key_name = "key_jules"
    # On a génrer une clé ssh online
    # On  pourrait le faire avec le fichier :  public_key = file("./id_rsa.pub")
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCF1iPz/E2Im1pt3aU0VR305ruE8HSkx07onRs2ddn+tm/chHukeO3RudUr4GuOHhQcJSjFS8UmkKQJXSsuVeaP3C9CnjFjDnCxqLyzrzgCZKIRP0lqu76vFRNt8sjlZkaC18EJ28qP7aDIsUVwIos+hAk/2W6kDrVWHoF+ec5RYg1osKxUVccWnts3ssmshdoIf6WybZ2eWpZJ7u5myEk3XdnB2ygyLcNNBGQ33fW83e7fS8RaCg6fiGrcBygP1juHB8QSyHqHKyOXNtQqdESw6dN/OuIAsmf+gdPe99R7ZzIrXJXu+e9VVnTWYF1ucPWjeZJtTXqpGe3LW5me0SnX"
}

output "ip_adress" {
    value = aws_instance.ec2_Instance1_JR.public_ip
}