# 1. Управление пользователями

# создадим пользователя с домашней папкой и оболочкой Bash
sudo useradd -s /bin/bash -d /home/user11 -m user11

# проверим успешное создание пользователя
tail /etc/passwd
tail /etc/group
tail /etc/shadow

# зададим ему пароль отдельной командой
sudo passwd asdf1234

# удалим юзера вместе с его домашней папкой (ключ -r)
sudo userdel asdf1234 -r

# 2. Управление группами

# создадим новых менеджеров
sudo useradd -s /bin/bash -d /home/manager1 -m manager1
sudo useradd -s /bin/bash -d /home/manager2 -m manager2	

# создадим новых тестировщиков
sudo useradd -s /bin/bash -d /home/tester1 -m tester1
sudo useradd -s /bin/bash -d /home/tester2 -m tester2	

# создадим группы для каждого отдела
sudo groupadd managers
sudo groupadd testers
# проверим группы
tail /etc/group

# добавим сотрудников в группы своих отделов
sudo usermod -a -G testers tester1
sudo usermod -a -G testers tester2
sudo usermod -a -G managers manager1
sudo usermod -a -G managers manager2

# проверим группы
tail /etc/group

# переместим пользователя tester1 в группу managers:
# удалить пользователя из всех групп, кроме основной
usermod -G "" tester1
# или командой deluser (при наличии пакета adduser)
sudo deluser tester1 testers
# добавим его в целевую группу
sudo usermod -a -G managers tester1

# добавим пользователя manager1 в группу testers
sudo usermod -a -G testers manager1

# удалим пользователя manager1 из группы testers
sudo deluser manager1 testers

# 3. Создать пользователя с правами суперпользователя. Проверить результат.

# создадим нового админа
sudo useradd -s /bin/bash -d /home/admin -m admin

# добавим его в целевую группу
sudo usermod -a -G sudo admin

# проверим группы админа
groups admin
