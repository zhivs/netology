# Задание 0
![Решение 0 задания](./images/task0.png)

# Задание 1

Комана для сборки образов из `compose.yaml`:
 
```
docker compose build
```

Dockerfile.python по заданию:
```Dockerfile
FROM python:3.9-slim

WORKDIR /app

COPY requirements.txt .

RUN pip install -r requirements.txt

COPY . .

CMD ["python", "main.py"]
```

Сборка:
![Решение 1 задания 1 пукта](./images/task1_1.png)

Результат сборки:
![Решение 1 задания 2 пункта](./images/task1_2.png)

Содержимое файла .dockerignore
![Решение 1 задания 3 пункта](./images/task1_3.png)

# Задание 2
Отчет сканирования образа
![Решение 2 задания](./images/task2.png)

# Задание 3
![Решение 3 задания](./images/task3.png)

# Задание 4
Ссылка на репозиторий:
https://github.com/Helliard/shvirtd-example-python

Скрипт `deploy.sh`
```bash
#!/bin/bash

git clone https://github.com/Helliard/shvirtd-example-python.git /opt/shvirtd-example-python

cd /opt/shvirtd-example-python

docker compose up -d
```

Содержимое базы `requests`

![Решение 4 задания](./images/task4.png)

# Задание 5

1. 
Скрипт `backup.sh`

```bash
#!/bin/bash

docker run \
    --rm --entrypoint "" \
    -v /opt/backup:/backup \
    --network shvirtd-example-python_backend \
    --link="shvirtd-example-python-db-1" \
    mydumper:latest \
    mysqldump --opt -h shvirtd-example-python-db-1 -uroot -pYtReWq4321 "--result-file=/backup/dumps.sql" virtd
```

❗С базовым образом schnitzler/mysqldump не завелось 

Ошибка:

![Решение 5 задания 1 пункта](./images/task5_1.png)

Нужный плагин докачал еще одним слоем:
```Dockerfile
FROM schnitzler/mysqldump
RUN apk add --no-cache mariadb-connector-c
```

Дамп базы после ручного запуска:
![Решение 5 задания 2 пункта](./images/task5_2.png)

2.
Скрипт и cron task:

![Решение 5 задания](./images/task5_3.png)

Cron в `compose`:

![Решение 5 задания](./images/task5_4.png)

Резервные копии:

![Решение 5 задания](./images/task5_5.png)

# Задание 6
1. Узнаем digest необходимого слоя с помощью dive

![Решение 6 задания](./images/task6_1.png)

2. Извлекаем необходимый файл

![Решение 6 задания](./images/task6_2.png)

# Задание 6.1

![Решение 6 задания](./images/task6_3.png)
