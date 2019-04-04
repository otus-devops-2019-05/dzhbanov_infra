bastion_IP = 35.195.162.201
someinternalhost_IP = 10.132.0.6

### ДЗ №3

# способ подключения к someinternalhost в одну команду из вашего рабочего устройства
 ssh -i ~/.ssh/appuser -A appuser@35.195.162.201 ssh appuser@10.132.0.6

# вариант решения для подключения из консоли при  помощи команды вида ssh someinternalhost из локальной консоли рабочего устройства, чтобы подключение выполнялось по алиасу someinternalhost

# 1. добавляем алиас на бастионе
 10.132.0.6 someinternalhost >> /etc/hosts 

# теперь можно коннектится по алиасу
ssh -i ~/.ssh/appuser -A appuser@35.195.162.201 ssh appuser@someinternalhost

# 2. На рабочем устройстве делаем алиас на команду
alias "ssh_someinternalhost"="ssh -i ~/.ssh/appuser -A appuser@35.195.162.201 ssh appuser@someinternalhost"

# 3. Запускаем на рабочем устройстве 
 ssh_someinternalhost
