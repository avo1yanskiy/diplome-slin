## Для убунты.

## не забудь сделать "chmod +x ansible-yandex.sh"

#!/bin/bash
echo 'Привет, это установка ansible & terraform!'

sleep 5

sudo apt update

sudo apt -y install vim curl
sudo apt -y install wget
sudo apt -y install zip
sudo apt -y install git

sudo add-apt-repository ppa:ansible/ansible-2.10
sudo apt -y install ansible

echo 'Terraform'

git clone https://github.com/avo1yanskiy/dist.git
git clone https://github.com/avo1yanskiy/diplome-slin.git

sudo unzip dist/terraform_1.2.1_linux_amd64.zip

cp terraform /bin

nano echo "provider_installation {
  network_mirror {
    url = "https://terraform-mirror.yandexcloud.net/"
    include = ["registry.terraform.io/*/*"]
  }
  direct {
    exclude = ["registry.terraform.io/*/*"]
  }
}" > ~/.terraformrc