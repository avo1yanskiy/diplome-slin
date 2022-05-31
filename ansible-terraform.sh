## Для убунты.

## не забудь сделать "chmod +x ansible-yandex.sh"

#!/bin/bash
echo 'Привет, это установка ansible & terraform!'

sleep 5

sudo apt update

sudo apt -y install vim
sudo apt -y install curl
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




nano ~/.terraformrc

```
provider_installation {
  network_mirror {
    url = "https://terraform-mirror.yandexcloud.net/"
    include = ["registry.terraform.io/*/*"]
  }
  direct {
    exclude = ["registry.terraform.io/*/*"]
  }
}
```


Александр, подскажите пожалуйста,

как мне прописать нужный ssh ключ виртуальной машины “бастион” во все машины через код, чет не могу придумать(((

+ Мне же как то надо будет прописывать в настройках того же прометеуса ип адсера машин которые будут мониториться, тоже не понятно откуда будут браться ипники:confused:

https://habr.com/ru/post/645719/