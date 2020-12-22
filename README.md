SOURCE: Amazon Linux on AWS
https://docs.solace.com/Solace-SW-Broker-Set-Up/Docker-Containers/Set-Up-Docker-Container-AMI-EC2.htm

---

> terraform.tfvars , contains:

region               = "eu-north-1"

environment          = "Solace"

vpc_cidr             = "10.0.0.0/16"

public_subnet_1_cidr = "10.0.1.0/24"

private_subnet_1_cidr = "10.0.10.0/24"

instance_type = "t3.micro"

instance_ami  = "ami-02511cb3673b49e04"

keyname       = "aws_pari_key.pem_created for ssh into ecs"

---
--- 
install_solace.sh

--env 'username_admin_globalaccesslevel=admin' \
--env 'username_admin_password=admin' \
--name=solace solace/solace-pubsub-standard:latest

---

--- 
To access the Solace CLI:

Enter the following docker exec command:

>sudo docker exec -it solace /usr/sw/loads/currentload/bin/cli -A

Type the following commands to enter configuration mode:

solace> enable

solace# config

solace(configure)#

For a list of Solace CLI commands currently supported on the event broker, refer to Software Event Broker CLI Commands.

---

To access with Solace SolAdmin:

Management IP:  [AWS public IP]

Management port:  8080

User Name: admin

Password: admin

---

--- 
To access into the Solace WEB UI:

[AWS public IP]:8080

---
# Solace-Instance
