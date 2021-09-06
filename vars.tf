variable "AWS_REGION" {
    type = string
    # Méthode 1 pour déclarer variable : default = "eu-central-1"
    # Méthode 2 : On peut ne pas rentrer de valeur par défaut ==> la déclaration se fera après avoir rentré la commande terraform apply
}

# string, numbre, booleen, map (sorte de dictionnaire), liste

variable "AWS_REGION_AMIS" {
    type = map
    default = {
        "eu-central-1" : "ami-05f7491af5eef733a"
        "eu-west-3" : "ami-0f7cd40eac2214b37"
    }
}

# liste = ["valeur1","valeur2","valeur3"]

# Variables d'entrée ou variable de sortie
# Variable de sortie ("variable d'output")