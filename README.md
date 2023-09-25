## ДЗ №9 Продолжение знакомства с Ansible: templates, handlers, dynamic inventory, vault, tags
Что сделано:
```
1. Использовал плейбуки, хендлеры и шаблоны для конфигурации окружения и деплоя тестового приложения. Подход один плейбук, один сценарий (play)
2. Использовал один плейбук, но много сценариев
3. Использовал много плейбуков.
4. Изменил провижн образов Packer на Ansible-плейбуки
5. Протестировал на stage окружении.
```
Command list:
```
  422  packer build ./app.json variables.json
  423  packer build -var-file=variables.json app.json
  424  packer build -var-file=variables.json db.json
  499  terraform init
  500  terraform apply
  501  terraform destroy
  502  terraform fmt
  573  ansible-playbook reddit_app.yml --check --limit db
  582  ansible-playbook reddit_app.yml --check --limit db
  583  ansible-playbook reddit_app.yml --limit db
  584  ansible-playbook reddit_app.yml --check --limit app --tags app-tag
  585  ansible-playbook reddit_app.yml --limit app --tags app-tag
  586  ansible-playbook reddit_app.yml --check --limit app --tags deploy-tag
  587  ansible-playbook reddit_app.yml --limit app --tags deploy-tag
  588  ansible-playbook reddit_app.yml --check --limit app --tags deploy-tag
  589  ssh -i ~/.ssh/ubuntu ubuntu@158.160.119.26
  590  ansible-playbook reddit_app.yml --check --limit app --tags deploy-tag
  591  ssh -i ~/.ssh/ubuntu ubuntu@158.160.119.26
  592  ansible-playbook reddit_app.yml --limit app --tags deploy-tag
  593  ssh -i ~/.ssh/ubuntu ubuntu@158.160.119.26
  594  ssh -i ~/.ssh/ubuntu ubuntu@158.160.123.125
  602  packer build -var-file=variables.json app.json
  603  packer build -var-file=variables.json db.json
  611  ansible-playbook reddit_app.yml --check --limit app --tags deploy-tag
  612  ansible-playbook reddit_app.yml --limit app --tags deploy-tag
  614  ansible-playbook reddit_app.yml --limit app --tags deploy-tag
  621  ansible-playbook reddit_app.yml --limit app --tags deploy-tag
  622  ssh -i ~/.ssh/ubuntu ubuntu@51.250.86.135
  623  ansible-playbook reddit_app.yml --limit app --tags deploy-tag
  624  ssh -i ~/.ssh/ubuntu ubuntu@
  625  ansible-playbook reddit_app.yml --limit app --tags app-tag
  626  ansible-playbook reddit_app.yml --limit app --tags deploy-tag
  627  ansible-playbook reddit_app.yml --limit db
  628  ansible-playbook reddit_app.yml --limit db-tag
  629  ansible-playbook reddit_app.yml --limit app --tags db-tag
  630  ansible-playbook reddit_app.yml --limit app --tags app-tag
  631  ansible-playbook reddit_app.yml --limit app --tags deploy-tag
  642  packer build -var-file=variables.json app.json
  643  packer build -var-file=variables.json db.json
  665  ansible-playbook reddit_app.yml --limit app --tags db-tag
  666  ansible-playbook reddit_app.yml --limit db --tags db-tag
  667  ansible-playbook reddit_app.yml --limit app --tags app-tag
  668  ansible-playbook reddit_app.yml --limit app --tags deploy-tag
  676  ansible-playbook reddit_app.yml --limit db --tags db-tag
  677  ansible-playbook reddit_app.yml --limit app --tags app-tag
  678  ansible-playbook reddit_app.yml --limit app --tags deploy-tag
  686  ansible-playbook reddit_app.yml --limit db --tags db-tag
  687  ansible-playbook reddit_app.yml --limit app --tags app-tag
  688  ansible-playbook reddit_app.yml --limit app --tags deploy-tag
  697  ansible-playbook reddit_app2.yml --tags db-tag --check
  698  ansible-playbook reddit_app2.yml --tags db-tag
  699  ansible-playbook reddit_app2.yml --tags app-tag --check
  700  ansible-playbook reddit_app2.yml --tags app-tag
  701  ansible-playbook reddit_app2.yml --tags deploy-tag --check
  702  ansible-playbook reddit_app2.yml --tags deploy-tag
  705  terraform destroy
  706  terraform apply
  707  ansible-playbook reddit_app2.yml --tags db-tag
  710  ansible-playbook reddit_app2.yml --tags db-tag
  711  ansible-playbook reddit_app2.yml --tags app-tag
  712  ansible-playbook reddit_app2.yml --tags deploy-tag
  715  terraform destroy
  716  terraform apply
  717  ansible-playbook site.yml --check
  720  ansible-playbook site.yml --check
  721  ansible-playbook site.yml
  723  packer build -var-file=packer/variables.json packer/db.json
  724  packer build -var-file=packer/variables.json packer/app.json
  726  git add .
  727  git commit -m 'add ansible-2'
  729  git push --set-upstream origin ansible-2
  736  packer build -var-file=packer/variables.json packer/app.json
  738  packer build -var-file=packer/variables.json packer/app.json
  739  packer build -var-file=packer/variables.json packer/db.json
  740  packer build -var-file=packer/variables.json packer/app.json
  741  packer build -var-file=packer/variables.json packer/db.json
  751  ansible-playbook site.yml
  753  ssh -i ~/.ssh/ubuntu ubuntu@158.160.122.9
```
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
## ДЗ №7 Принципы организации инфраструктурного кода и работа над инфраструктурой в команде на примере Terraform
Что сделано:
```
1.Задал IP для инстанса с приложением в виде внешнего ресурса.
2.Использовал созданный IP адрес в ресурсе VM сославшись на атрибуты ресурса, который этот IP создает.
3.Структурировал ресурсы, создал 2 VM app и db.
4.Создал 2 модуля app module и db module.
5.Проверил работу модулей.
6.Переиспользовал модули при создании prod и stage окружений
7.Проверил конфигурации.
```
Command list:
```
  418  packer build -var-file=variables.json app.json
  419  packer build -var-file=variables.json db.json
  420  cd ..
  421  cd terraform/
  422  terraform plan
  423  terraform apply
  470  ssh -i ~/.ssh/ubuntu ubuntu@84.201.133.5
  471  ssh -i ~/.ssh/ubuntu ubuntu@51.250.87.240
  478  cd terraform/
  490  terraform init
  491  terraform apply
  492  cd ..
  493  cd stage/
  494  terraform destroy
  495  cd ..
  496  cd prod/
  497  terraform init
  498  terraform apply
  499  terraform destroy
  500  terraform fmt
  501  cd ..
  502  cd stage/
  503  terraform fmt
  504  cd ..
  505  terraform fmt

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
