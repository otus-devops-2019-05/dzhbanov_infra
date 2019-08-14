bastion_IP = 35.195.162.201
someinternalhost_IP = 10.132.0.6

testapp_IP = 35.204.139.84
testapp_port = 9292

ДЗ №11 
ветка ansible-4. Самое ужасное ДЗ. Сделайте пожалуйста что нибудь с ним. Очень сложно и долго.

- Настроил Vagrant
- Доработал плейбуки для использования в Vagrant
- Установил molecule и Testinfra. Протестировал плейбуки
- в плейбуки пакера включил роли.
- в шаблоны пакера указал роли 

 
ДЗ №10 
 - Подготовил роли
 - Добавил открытие порта в терраформ
 - Зашифровал креденшалс
  
ДЗ №9
 - подготовил плейбуки: один плейбук со множеством команд, несколько плейбуков.
 - подготовил образы packer при помощи provisioners ansible
 - пересоздал инфраструктуру stage
 - выполнил деплой приложения через ansible (site.yml)


 sudo packer build -var-file='./packer/variables.json' './packer/db.json'


 ДЗ №8 
 - установил ansible с помощью terraform на отдельную VM
 - Бьюсь с выполнением команд ansible - происходят постоянные зависания. Очень нужна с этим помощь...невозможно работать по непонятным причинам. Написал в группу.
 - После выполнения ansible app -m command -a 'rm -rf ~/reddit' и повторного запуска плейбука 
 PLAY RECAP *************************************************************************************************
appserver                  : ok=2    changed=1    unreachable=0    failed=0
результат вызван тем, что в первом случае репозиторий уже склонирован. а после удаления клонируется. поэтому и есть changed: 1
 

 
 
 ДЗ №7
 - подготовил packer образы db и app.
 - подготовил окружение terraform stage & prod
 - подготовил modules для app & db
 - подготовил module VPC
 - пареметризовал
 - подключил module bucket


 ДЗ №6
  - установил terraform
  - подготовил скрипты
  - создал инфру
  - добавил переменные
  - задача со (*) добавление двух ключей скриптом в main.tf
  - после добавления ключа через интерфейс и выполнения terraform apply - он удаляется. Остаются только те, что прописаны в main.tf
  - скрипт:
  resource "google_compute_project_metadata_item" "ssh-keys" {
  key   = "ssh-keys"
  value = "appuser:${file("${var.public_key_path}")} appuser2:${file("${var.public_key_path}")}" 
}


 чтобы убрать ненужные символы из .sh скриптов в винде выполняем команду
 cat deploy_test.sh | tr -d '\r' > deploy.sh

 ДЗ №5
 - установил packer
 - подготовил образ reddit-base
 - добавил переменные в файл variables.json
 - убрал в gitignore variables.json

не забывать валидировать и билдить корректно с указанием файла переменных
packer validate -var-file=variables.json a
pp.json

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





