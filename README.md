bastion_IP = 35.195.162.201
someinternalhost_IP = 10.132.0.6

testapp_IP = 35.204.139.84
testapp_port = 9292

 ДЗ №5
  - установил terraform
  - подготовил скрипты
  - создал инфру
  - добавил переменные
  
 чтобы убрать ненужные символы из .sh скриптов в винде выполняем команду
 cat deploy_test.sh | tr -d '\r' > deploy.sh

 ДЗ №5
 - установил packer
 - подготовил образ reddit-base
 - добавил переменные в файл variables.json
 - убрал в gitignore variables.json


 ДЗ №4
 - Установил gcloud
 - Запустил машину reddit-app
 - установил ruby и bundler
 - установил mongoDB
 - задеплоил приложение
 - подготовил bash скрипты
 - подготовил startup_script и разместил его в bucket
 - скрипт для запуска из gcloud

 gcloud compute instances create reddit-app --metadata startup-script-url=gs://dzhbanov11_storage/startup_script.sh --boot-disk-size=10GB --image-family ubuntu-1604-lts --image-project=ubuntu-os-cloud --machine-type=g1-small --tags puma-server --restart-on-failure 
 
 - скрипт создания firewall

 gcloud compute firewall-rules create default-puma-server --action allow --target-tags puma-server --source-ranges 0.0.0.0/0 --rules tcp:9292


 ДЗ №3
 - Зарегистрировался в GCP
 - Создал машины bastion и someinternalhost
 - установил и сконфигурировал OpenVPNсервер Pritunl

способ подключения к someinternalhost в одну команду из вашего рабочего устройства
 ssh -i ~/.ssh/appuser -A appuser@35.195.162.201 ssh appuser@10.132.0.6

вариант решения для подключения из консоли при  помощи команды вида ssh someinternalhost из локальной консоли рабочего устройства, чтобы подключение выполнялось по алиасу someinternalhost

 1. добавляем алиас на бастионе
 10.132.0.6 someinternalhost >> /etc/hosts 

 теперь можно коннектится по алиасу
ssh -i ~/.ssh/appuser -A appuser@35.195.162.201 ssh appuser@someinternalhost

 2. На рабочем устройстве делаем алиас на команду
alias "ssh_someinternalhost"="ssh -i ~/.ssh/appuser -A appuser@35.195.162.201 ssh appuser@someinternalhost"

 3. Запускаем на рабочем устройстве 
 ssh_someinternalhost





