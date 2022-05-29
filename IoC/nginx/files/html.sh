#!/usr/bin/env bash

echo '<html>' > /tmp/index.html
echo '<title>Netology homework 7.1</title>' >> /tmp/index.html

echo '<h3>Memory-total</h3>' >> /tmp/index.html;

cat /proc/meminfo | grep MemTotal >> /tmp/index.html

echo '<h3>CPU</h3>' >> /tmp/index.html

lscpu | egrep 'Architecture|CPU\(s\)' >> /tmp/index.html

echo '<h3>IP Address computer</h3>' >> /tmp/index.html
ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1' >> /tmp/index.html

echo '<h3>HDD</h3>' >> /tmp/index.html
lsblk | grep disk >> /tmp/index.html

echo '</html>' >> /tmp/index.html
