Playbook nginx
=========

Роль для установки prometheus на хостах с ОС:CentOS, RHEL.

Путь запуска, сначала запускаем Playbook nginx.yaml, 

* Установка nginx

Requirements
------------

Поддерживаются только ОС семейств RHEL.

Playbook Variables
--------------

| Variable name | Default | Description |
|-----------------------|----------|-------------------------|
| nginx| nginx | установка nginx |
| node_exporter | node_exporter | установка node_exporter |
| grafana | grafana | установка grafana |
| alertnamager | alertnamager | установка alertnamager |


Example Playbook
----------------


License
-------

MIT

Author Information: Volyanskiy Aleksandr

