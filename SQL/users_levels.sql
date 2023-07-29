
Задания на написание запросов к БД:								
1. Отобрать из таблицы user всех пользователей, у которых level_id=1, skill > 799000 и в имени встречается буква а								
2. Удалить всех пользователей, у которых skill меньше 100000								
3. Вывести все данные из таблицы user в порядке убывания по полю skill 								
4. Добавить в таблицу user нового пользователя по имени Oleg, с уровнем 4 и skill =10								
5. Обновить данные в таблице user -  для пользователей с level_id меньше 2 проставить skill 2000000								
6. Выбрать user_name всех пользователей уровня admin используя подзапрос								
7. Выбрать user_name всех пользователей уровня admin используя join								

1.
SELECT
	*
FROM
	user
WHERE
	level_id = 1 AND skill > 799000 AND user_name LIKE ‘%a%’;
2.
DELETE FROM user
WHERE
	skill < 100000;

3.
SELECT
	*
FROM
 	users
ORDER BY
	skill DESC;

4.
INSERT INTO users (user_name, level_id, skill)
VALUES (‘Oleg’, 4, 10);

5.
UPDATE users
SET skill = 2000000
WHERE level_id < 2;

6.
SELECT
	user_name
FROM
	user
WHERE
	level_id IN (SELECT id FROM level WHERE level_name = ‘admin’);

7.
SELECT
	user_name
FROM
	user
INNER JOIN level
ON user.level_id = level.id
WHERE
	level_name = ‘admin’;

