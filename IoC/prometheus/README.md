Playbook Prometheus & node_exporter
=========

Роль для установки prometheus на хостах с ОС:CentOS, RHEL.

Путь запуска, сначала запускаем Playbook prometheus.yaml, после node_exporter.yaml

* Установка Prometheus
* Установка node_exporter (на хосты)
Requirements
------------

Поддерживаются только ОС семейств RHEL.

Playbook Variables
--------------

| Variable name | Default | Description |
|-----------------------|----------|-------------------------|
| prometheus-2.30.3 | prometheus-2.30.3 | установка prometheus-2.30.3 |
| node_exporter | node_exporter | установка node_exporter |


Example Playbook
----------------


License
-------

MIT

Author Information: Volyanskiy Aleksandr

