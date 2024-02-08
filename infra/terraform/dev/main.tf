provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "app_server" {
  ami           = "ami-0c55b159cbfafe1f0" # Exemple d'AMI pour Ubuntu 22.04
  instance_type = "t2.micro"
  # Configuration supplémentaire...
}

resource "aws_db_instance" "postgres" {
  engine               = "postgres"
  engine_version       = "16"
  instance_class       = "db.t2.micro"
  allocated_storage    = 20
  # Configuration supplémentaire...
}

# D'autres ressources comme les groupes de sécurité, VPC, etc.
