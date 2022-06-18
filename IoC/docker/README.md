Playbook Docker & docker-compose
=========

Playbook для установки docker на хосте с ОС:CentOS, RHEL.

Путь запуска, сначала запускаем Playbook docker.yaml

* Установка на хост docker, docker-compose.
* После установки запускаются контейнеры с elasticsearch & kibana (копируются все конфиги)

Requirements
------------

Поддерживаются только ОС семейств RHEL.

Playbook Variables
--------------

| Variable name | Default | Description |
|-----------------------|----------|-------------------------|
| docker |  | установка docker |
| docker-compose |  | установка docker-compose |


Example Playbook
----------------


License
-------

MIT

Author Information: Volyanskiy Aleksandr

