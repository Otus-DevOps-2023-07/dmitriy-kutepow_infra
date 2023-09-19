## ДЗ №8 Управление конфигурацией. Знакомство с Ansible
Что сделано:
```
1.Установлен Ansible
2.Запущены VMs appserver и dbserver с помощью terraform
3.Создан инвентори файл ansible/inventory
4.Выполнена команда ping для хостов appserver и dbserver
5.Установлены значения по умолчанию в конфигурационном файле ансибла ansible/ansible.cfg
6.Проверена работу команд 'ruby -v' и 'bundler -v' на соответствующих хостах
7.Написан и проверен простой плейбук ansible/clone.yml
```
Command list:
```
  316  cd terraform/
  317  terraform show
  318  terraform apply
  319  cd ..
  320  cd ansible/
  321  ansible db -i ./inventory.yml -m ping
  322  ansible db-app -i ./inventory.yml -m ping
  323  ansible db -i ./inventory.yml -m ping
  324  ansible app -i ./inventory.yml -m ping
  325  ansible all -i ./inventory.yml -m ping
  326  ansible app -m command -a 'ruby -v'
  327  ansible app -m command -a 'ruby -v' -i inventory.yml
  328  ansible app -m command -a 'bundler -v'  -i inventory.yml
  329  ansible db -m command -a 'systemctl status mongod' -i inventory.yml
  330  ansible db -m shell -a 'systemctl status mongod' -i inventory.yml
  331  ansible db -m shell -a 'systemctl status mongod'
  332  ansible db -m shell -a 'sudo systemctl status mongod'
  333  ansible app -m command -a 'systemctl status mongod'  -i inventory.yml
  334  ansible db -m systemd -a name=mongod -i inventory.yml
  335  ansible db -m service -a name=mongod -i inventory.yml
  336  ansible app -m apt -a name=git
  337  ansible app -m git -a 'repo=https://github.com/express42/reddit.git dest=/home/appuser/reddit'
  338  ansible-playbook clone.yml
  339  ansible app -m command -a 'rm -rf ~/reddit'
  340  ansible-playbook clone.yml
```
## ДЗ Подготовка базового образа VM при помощи Packer
Полезные ссылки для потомков:
```
https://ru.hexlet.io/courses/intro_to_git/lessons/gitignore/theory_unit
```
## ДЗ Основные сервисы Yandex Cloud
```
testapp_IP = 84.201.132.119
testapp_port = 9292
```
Полезные ссылки для потомков:
```
https://blog.tataranovich.com/2018/08/git-chmod.html
```
## ДЗ Знакомство с облачной инфраструктурой и облачными сервисами
```
bastion_IP = 158.160.117.238
someinternalhost_IP = 10.128.0.23
```
Подключение к someinternalhost одной коммандой
```
ssh -J appuser@158.160.117.238 appuser@10.128.0.23
```
Для подключения через алиас необходим конфигурационный файл в папке ~/.ssh/config
```
Host bastion
  HostName 158.160.117.238
  User appuser

Host someinternalhost
  HostName 10.128.0.23
  User appuser
  ProxyJump bastion
```
Полезные ссылки для потомков:
```
https://habr.com/ru/companies/cloud4y/articles/530516/
https://wiki.gentoo.org/wiki/SSH_jump_host
https://itsecforu.ru/2019/05/06/%F0%9F%90%A7-%D0%BA%D0%B0%D0%BA-%D1%81%D0%BE%D0%B7%D0%B4%D0%B0%D1%82%D1%8C-%D0%B0%D0%BB%D0%B8%D0%B0%D1%81-ssh-%D0%B2-linux/
https://serverfault.com/questions/843243/ssh-jumping-with-aliases-and-f
https://www.digitalocean.com/community/tutorials/how-to-set-up-and-configure-an-openvpn-server-on-ubuntu-20-04#step-12-generating-client-configurations
https://docs.pritunl.com/docs/connecting
```
