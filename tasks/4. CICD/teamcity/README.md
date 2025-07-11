# Домашнее задание к занятию 11 «Teamcity»

ВМ в соответствии с заданием:

![alt text](./img/1.png)

Авторизовал агент:

![alt text](./img/2.png)

Запустил [playbook](./infrastructure).

![alt text](./img/4.png)

1. Создал новый проект в teamcity на основе fork.
2. Сделал autodetect конфигурации.
3. Сохранил необходимые шаги, запустил первую сборку master. Сборка прошла успешно:

![alt text](./img/5.png)

4. Поменял условия сборки: если сборка по ветке `master`, то должен происходит `mvn clean deploy`, иначе `mvn clean test`:

![alt text](./img/6.png)

5. Для deploy загрузил [settings.xml](./teamcity/settings.xml) в набор конфигураций maven у teamcity, предварительно записав туда креды для подключения к nexus:

![alt text](./img/7.png)

6. В pom.xml поменял ссылки на репозиторий и nexus:

![alt text](./img/8.png)

7. Запустил сборку по master, убедился, что всё прошло успешно и артефакт появился в nexus:

![alt text](./img/9.png)

8. Мигрировал `build configuration` в репозиторий:

![alt text](./img/15.png)

![alt text](./img/16.png)

9. Создал отдельную ветку `feature/add_reply` в репозитории.
10. Написал новый метод для класса Welcomer: метод возвращает произвольную реплику, содержащую слово `hunter`:

![alt text](./img/10.png)

11. Дополнил тест для нового метода на поиск слова `hunter` в новой реплике:

![alt text](./img/11.png)

12. Сделал push всех изменений в новую ветку репозитория.
13. Убедился, что сборка самостоятельно запустилась, тесты прошли успешно:

![alt text](./img/12.png)

14. Сделал `Merge` ветки `feature/add_reply` в `master`.

![alt text](./img/13.png)


![alt text](./img/14.png)


https://github.com/zhivs/example-teamcity
