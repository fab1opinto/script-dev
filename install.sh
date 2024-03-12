#!/bin/bash

echo "atualizando os pacotes - update and upgrade..."
sudo apt update -y && sudo apt upgrade -y

echo "git..."
sudo apt install git -y

echo "linguagens de programação - languages..."
echo  "asdf node - nodejs"
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.14.0
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
echo ". $HOME/.asdf/asdf.sh" ". $HOME/.asdf/completions/asdf.bash" >> .bashrc
asdf plugin-add nodejs
asdf plugin-list
asdf list-all nodejs
asdf install nodejs 19.0.0
asdf global nodejs 19.0.0
node --version

echo "vue..."
npm install -g @vue/cli

echo "golang..."
sudo apt  install golang-go -y

echo "php..."
sudo apt install php8.1-cli -y
sudo apt install php-mbstring -y
sudo apt install php-dom -y
sudo apt install php-curl -y
sudo apt install php8.1-sqlite3
sudo apt install php8.1-mysql

echo "composer.."
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('sha384', 'composer-setup.php') === 'edb40769019ccf227279e3bdd1f5b2e9950eb000c3233ee85148944e555d97be3ea4f40c3c2fe73b22f875385f6a5155') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php
php -r "unlink('composer-setup.php');"
php composer.phar --version
echo "tornando o composer global"
sudo mv composer.phar /usr/local/bin/composer 

echo "lampp..."
wget https://sourceforge.net/projects/xampp/files/XAMPP%20Linux/8.0.30/xampp-linux-x64-8.0.30-0-installer.run/download
sudo chmod +x download
sudo ./download

echo "IDE'S..."
echo "vs code"
sudo snap install code --classic

echo "pycharm..."
sudo snap install pycharm-community --classic 

echo "bancos de dados e sgbds - database and sgbds..."
echo "dbeaver"
sudo snap install dbeaver-ce

echo "sqlite3"
sudo apt install sqlite3 -y
sudo apt install sqlitebrowser -y

echo "mariadb"
sudo apt update -y
sudo apt install mariadb-server -y

echo "mysql"
sudo apt update -y
sudo apt install mysql-server -y

echo "devops, virtualização, monitoramento, containers e orquestração, iac | virtualization, monitoring, containers and orchestration, iac..."
echo "vagrant"
sudo apt install vagrant -y

echo "terraform"
sudo snap install terraform 

echo "docker"
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

echo "corrigir..."
sudo apt install -f
echo "Auto remove..."
sudo apt autoremove -y
