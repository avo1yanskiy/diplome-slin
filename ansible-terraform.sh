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


UP/DOWN

up{instance="192.168.100.3:9100", job="node_exporter-1"}
up{instance="192.168.101.6:9100", job="node_exporter-2"}


network 

node_network_receive_bytes_total{device="eth0", instance="192.168.100.3:9100", job="node_exporter-1"}


CPU

rate(process_cpu_seconds_total{job="SERVER"}[15m])

rate(process_cpu_seconds_total{job="SERVER"}[5m])
sum by (mode, instance) (rate(process_cpu_seconds_total{job="SERVER"}[1m]))

