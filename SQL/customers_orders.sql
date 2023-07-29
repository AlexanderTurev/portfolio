Необходимо написать запросы, которые будут выводить следующую информацию:
1.	Вывести названия всех компаний, которые не выполнили заказ с 15.11.1996 – 18.02.1997 
2.	Вывести названия компаний поставщиков, которые находятся в México D.F.;
3.	Вывести только те заказы, которые были оформлены с 12.12.1996 по 18.02.1997;
4.	Вывести только тех заказчиков,  название компании которых начинаются с ‘An’;
5.	Вывести названия компаний и заказы, которые они оформили, с суммой заказа более 17000. Использовать соединение таблиц.
6.	Вывести следующие колонки: имя поставщика, сумма заказа. Результаты отсортировать по поставщикам в порядке убывания
7.	Вывести следующие колонки: имя поставщика, дата заказа. Вывести  таким образом, чтобы все заказчики из таблицы 1 были показаны в таблице результатов.

Задание 4.
1.
SELECT
	DISTINCT CompanyName
FROM
Customers
	INNER JOIN Orders
ON Customers.CustomerID = Orders.CustomerID
WHERE
	CAST(OrderDate as date) NOT BETWEEN ‘1996-11-15’ AND ‘1997-02-18’;

2.
SELECT
	CompanyName
FROM
Customers
WHERE
	City = ‘México D.F.’;

3.
SELECT
	*
FROM
	Orders
WHERE
	CAST(OrderDate as date) BETWEEN ‘1996-12-12’ AND ‘1997-02-18’;

4.
SELECT
	CompanyName
FROM
	Customers
WHERE
	CompanyName LIKE ‘An%’;

5.
SELECT
	CompanyName,
	OrderID
FROM
Customers
	INNER JOIN Orders
ON Customers.CustomerID = Orders.CustomerID
WHERE
	OrderSum > 17000;


6.
SELECT
	CompanyName,
	OrederSum
FROM
Customers
	INNER JOIN Orders
ON Customers.CustomerID = Orders.CustomerID
ORDER BY
	Customers DESC;

7.
SELECT
	CompanyName,
	OrderDate
FROM
Customers
	LEFT JOIN Orders
ON Customers.CustomerID = Orders.CustomerID;


Задание 5.
SELECT
	ClientName AS ФИО Клиента,
	(SELECT Saldo FROM Deposits WHERE Currency = ‘RUB’) AS Рубли,
	(SELECT Saldo FROM Deposits WHERE Currency = ‘USD’) AS Доллары,
	(SELECT Saldo FROM Deposits WHERE Currency = ‘EUR’) AS Евро
FROM
	Clients
	INNER JOIN Deposits
ON Clients.ClientID = Deposits.ClientID
WHERE
	Saldo > 0 AND StatusID = (SELECT StatusID FROM Status WHERE StatusName = ‘Работает’)
GROUP BY ClientName;

