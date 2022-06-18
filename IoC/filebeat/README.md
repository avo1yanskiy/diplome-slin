Playbook Filebeat & nginxlog-exporter
=========

Роль для установки prometheus на хостах с ОС:CentOS, RHEL.

Путь запуска, сначала запускаем playbook agents.yaml

* Установка Filebeat ( с нужными конфигами и настройкой)
* Установка nginxlog-exporter (с нужными конфигами)
Requirements
------------

Поддерживаются только ОС семейств RHEL.

Playbook Variables
--------------

| Variable name | Default | Description |
|-----------------------|----------|-------------------------|
| Filebeat | Filebeat | установка Filebeat |
| nginxlog-exporter 1.9.2 | nginxlog-exporter 1.9.2 | установка nginxlog-exporter 1.9.2 |



Example Playbook
----------------


License
-------

MIT

Author Information: Volyanskiy Aleksandr

