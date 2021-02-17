#!/bin/bash

sudo yum update -y
sudo amazon-linux-extras install docker
sudo yum install docker
sudo service docker start
sudo usermod -a -G docker ec2-user



sudo mkdir /var/lib/solace
sudo dd if=/dev/zero of=/var/lib/solace/swap count=2048 bs=1MiB
sudo mkswap -f /var/lib/solace/swap
sudo chmod 0600 /var/lib/solace/swap
sudo swapon -f /var/lib/solace/swap
sudo grep -q 'solace\/swap' /etc/fstab || sudo sh -c 'echo "/var/lib/solace/swap none swap sw 0 0" >> /etc/fstab'
sudo service docker stop
sudo su
echo OPTIONS="--iptables=false --storage-driver=devicemapper" >> /etc/sysconfig/docker
sudo su ec2-user
sudo systemctl enable docker.service
sudo systemctl enable containerd.service
sudo service docker start
sudo docker pull solace/solace-pubsub-standard

sudo tee /root/docker-create <<-EOF
#!/bin/bash
sudo docker create \
--network=host \
--uts=host \
--shm-size=1g \
--ulimit core=-1 \
--ulimit memlock=-1 \
--ulimit nofile=2448:42192 \
--env 'username_admin_globalaccesslevel=admin' \
--env 'username_admin_password=admin' \
--name=solace solace/solace-pubsub-standard:latest
EOF

sudo chmod +x /root/docker-create
sudo /root/docker-create
sudo docker start solace






