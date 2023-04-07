USE [AdventureWorks2019]

--Вывести всю информацию из таблицы Sales.Customer 
SELECT * FROM Sales.Customer 

--Вывести всю информацию из таблицы Sales.Store отсортированную 
--по Name в алфавитном порядке
SELECT * FROM Sales.Store ORDER BY Name 

--Вывести из таблицы HumanResources.Employee всю информацию
--о десяти сотрудниках, которые родились позже 1989-09-28
SELECT TOP 10 * FROM HumanResources.Employee WHERE BirthDate > '1989-09-28' 

--Вывести из таблицы HumanResources.Employee сотрудников
--у которых последний символ LoginID является 0.
--Вывести только NationalIDNumber, LoginID, JobTitle.
--Данные должны быть отсортированы по JobTitle по убиванию
SELECT NationalIDNumber, LoginID, JobTitle FROM HumanResources.Employee WHERE LoginID LIKE '%0' ORDER BY JobTitle DESC

--Вывести из таблицы Person.Person всю информацию о записях, которые были 
--обновлены в 2008 году (ModifiedDate) и MiddleName содержит
--значение и Title не содержит значение
SELECT * FROM Person.Person WHERE YEAR(ModifiedDate) = 2008 AND MiddleName IS NOT NULL  AND MiddleName != '' AND (Title IS NULL OR Title = '')

--Вывести название отдела (HumanResources.Department.Name) БЕЗ повторений
--в которых есть сотрудники
--Использовать таблицы HumanResources.EmployeeDepartmentHistory и HumanResources.Department
SELECT Name FROM HumanResources.Department, HumanResources.EmployeeDepartmentHistory WHERE EndDate IS NOT NULL

--Сгрупировать данные из таблицы Sales.SalesPerson по TerritoryID
--и вывести сумму CommissionPct, если она больше 0
SELECT TerritoryID, SUM(CommissionPct) AS SumCommission FROM Sales.SalesPerson WHERE CommissionPct > 0 GROUP BY TerritoryID

--Вывести всю информацию о сотрудниках (HumanResources.Employee) 
--которые имеют самое большое кол-во 
--отпуска (HumanResources.Employee.VacationHours)
SELECT * FROM HumanResources.Employee WHERE VacationHours = (SELECT MAX(VacationHours) FROM HumanResources.Employee)

--Вывести всю информацию о сотрудниках (HumanResources.Employee) 
--которые имеют позицию (HumanResources.Employee.JobTitle)
--'Sales Representative' или 'Network Administrator' или 'Network Manager'
SELECT * FROM HumanResources.Employee AS p WHERE p.JobTitle IN ('Sales Representative', 'Network Administrator', 'Network Manager') 

--Вывести всю информацию о сотрудниках (HumanResources.Employee) и 
--их заказах (Purchasing.PurchaseOrderHeader). ЕСЛИ У СОТРУДНИКА НЕТ
--ЗАКАЗОВ ОН ДОЛЖЕН БЫТЬ ВЫВЕДЕН ТОЖЕ!!!
SELECT * FROM HumanResources.Employee AS p LEFT JOIN Purchasing.PurchaseOrderHeader AS q ON p.BusinessEntityID = q.EmployeeID
