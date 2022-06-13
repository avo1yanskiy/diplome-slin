Playbook Prometheus-node_exporter & grafana
=========

Роль для установки prometheus на хостах с ОС:CentOS, RHEL.

Путь запуска, сначала запускаем Playbook site.yaml, после node_exporter.yaml за ним grafana.yaml (нужно чутка доработать в роль)

Requirements
------------

Поддерживаются только ОС семейств RHEL.

Playbook Variables
--------------

| Variable name | Default | Description |
|-----------------------|----------|-------------------------|
| prometheus-2.30.3 | prometheus-2.30.3 | установка prometheus-2.30.3 |
| node_exporter | node_exporter | установка node_exporter |
| grafana | grafana | установка grafana |
| alertnamager | alertnamager | установка alertnamager |

* после установки alertnamager может не запуститься ( systemctl daemon-reload)



Example Playbook
----------------


License
-------

MIT

Author Information: Volyanskiy Aleksandr

