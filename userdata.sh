#!/bin/bash
sudo su
apt update -y
apt install -y git python3 python3-pip nodejs npm

cd /home/ubuntu

# Clone repo
git clone https://github.com/coder-ocean/flask-express-ec2-app.git

cd flask-express-ec2-app

# Start Flask Backend
cd backend

pip3 install -r requirements.txt

nohup python3 app.py > backend.log 2>&1 &

# Start Express Frontend
cd ../frontend

npm install

nohup npm start > frontend.log 2>&1 &