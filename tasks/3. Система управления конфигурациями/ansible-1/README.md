# Введение в Ansible

Основная часть:

1. Запуск playbook из окружения на окружении из `test.yml`

Команда: `ansible-playbook site.yml -i inventory/test.yml`

![Задание 1](images/1.png)

Значение факта для хоста: 12

2. Поменял в examp.yml Значение переменной `some_fact` с 12 на all default fact 

![Задание 2](images/2.png)

3. Подготовленное окружение:

![Задание 3](images/3.png)

4. Запуск playbook из окружения на окружении из `prod.yml`

![Задание 4](images/4.png)

5. Изменение значение переменной:

![Задание 5](images/5.png)

6. Повтор запуска playbook:

![Задание 6](images/6.png)

7. Шифрование переменных с помощью `ansible-vault`

![Задание 7](images/7.png)

8. Повтор запуска playbook:

![Задание 8](images/8.png)

9. `ansible-doc -t connection -l`
Подойдет Local

![Задание 9](images/9.png)

10. Обновленный prod.yml

![Задание 10](images/10.png)

11. Повтор запуска playbook:

![Задание 11](images/11.png)

# Задание со *

1. Decrypt зашифрованных playbook

![Задание 1](images/12.png)

2. Шифрование отдельного значения переменной: `ansible-vault encrypt_string 'PaSSw0rd'`. Добавил в переменную для ubuntu, поскольку домашняя машина ubuntu

Вывод фактов: 

![Задание 2](images/13.png)

3. Добавил новую группу хостов:


![Задание 3](images/15.png)

4. Автоматизация запуска docker-контейнеров:
```docker
version: "3"
services:
  ubuntu:
    container_name: ubuntu
    image: pycontribs/ubuntu:latest
    restart: on-failure
    command: ["sleep", "infinity"]
  centos:
    container_name: centos7
    image: pycontribs/centos:7
    restart: on-failure
    command: ["sleep", "infinity"]
  fedora:
    container_name: fedora
    image: pycontribs/fedora:latest
    restart: on-failure
    command: ["sleep", "infinity"]
```