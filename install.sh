#!/bin/bash

# atualizando os pacotes - update and upgrade
sudo apt update -y && sudo apt upgrade -y

# git
sudo apt install git -y

# linguagens de programação - languages
# asdf node - nodejs
sudo apt install curl git -y
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.14.0
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
echo ". $HOME/.asdf/asdf.sh" ". $HOME/.asdf/completions/asdf.bash" >> .bashrc
asdf plugin-add nodejs
asdf plugin-list
asdf list-all nodejs
asdf install nodejs 22.11.0
asdf global nodejs 22.11.0
node --version

# vue
npm install -g @vue/cli

#golang
sudo apt  install golang-go -y

# php
sudo apt install php8.1-cli -y

#lampp
wget https://sourceforge.net/projects/xampp/files/XAMPP%20Linux/8.0.30/xampp-linux-x64-8.0.30-0-installer.run/download
sudo chmod +x download
sudo ./download

#IDE'S
#vs code
sudo snap install code --classic

# pycharm
sudo snap install pycharm-community --classic 

# bancos de dados e sgbds - database and sgbds
#dbeaver
sudo snap install dbeaver-ce

# sqlite3
sudo apt install sqlite3 -y
sudo apt install sqlitebrowser -y

#devops, virtualização, monitoramento, containers e orquestração, iac | virtualization, monitoring, containers and orchestration, iac
#vagrant
sudo apt install vagrant -y

#terraform
sudo snap install terraform 

#docker 
sudo apt remove docker docker-engine docker.io containerd runc -y
sudo apt update -y
sudo apt install apt-transport-https ca-certificates curl gnupg-agent software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get install docker-ce docker-ce-cli containerd.io -y
docker --version
sudo usermod -aG docker $(whoami)
newgrp docker