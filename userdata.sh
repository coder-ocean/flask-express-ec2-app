#!/bin/bash
sudo su
set -e

apt update -y
apt install -y git docker.io docker-compose

systemctl start docker
systemctl enable docker

usermod -aG docker ubuntu

cd /home/ubuntu

# Clone repo
git clone https://github.com/coder-ocean/flask-express-ec2-app.git

cd flask-express-ec2-app

# Run containers
docker compose up -d