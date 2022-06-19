## не забудь сделать "chmod +x Install-app-config_ssh.sh"
## Установка для deb
#!/bin/bash

echo 'Привет, это установка ansible &  terraform & добавление config файла для доступа к хостам через БАСТИОН!!'

sleep 5

sudo apt update

sudo apt -y install vim curl wget zip git

sudo add-apt-repository ppa:ansible/ansible-2.10
sudo apt -y install ansible

echo 'Подключение репозиториев'

git clone https://github.com/avo1yanskiy/dist.git
git clone https://github.com/avo1yanskiy/diplome-slin.git