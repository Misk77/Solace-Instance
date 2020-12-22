SOURCE: Amazon Linux on AWS
https://docs.solace.com/Solace-SW-Broker-Set-Up/Docker-Containers/Set-Up-Docker-Container-AMI-EC2.htm


--- 

--env 'username_admin_globalaccesslevel=admin' \
--env 'username_admin_password=admin' \
--name=solace solace/solace-pubsub-standard:latest

---

To access the Solace CLI:

Enter the following docker exec command:

>sudo docker exec -it solace /usr/sw/loads/currentload/bin/cli -A

Type the following commands to enter configuration mode:

solace> enable

solace# config

solace(configure)#

For a list of Solace CLI commands currently supported on the event broker, refer to Software Event Broker CLI Commands.
# Solace-Instance
