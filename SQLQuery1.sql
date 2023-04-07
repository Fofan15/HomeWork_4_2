USE [AdventureWorks2019]

--������� ��� ���������� �� ������� Sales.Customer 
SELECT * FROM Sales.Customer 

--������� ��� ���������� �� ������� Sales.Store ��������������� 
--�� Name � ���������� �������
SELECT * FROM Sales.Store ORDER BY Name 

--������� �� ������� HumanResources.Employee ��� ����������
--� ������ �����������, ������� �������� ����� 1989-09-28
SELECT TOP 10 * FROM HumanResources.Employee WHERE BirthDate > '1989-09-28' 

--������� �� ������� HumanResources.Employee �����������
--� ������� ��������� ������ LoginID �������� 0.
--������� ������ NationalIDNumber, LoginID, JobTitle.
--������ ������ ���� ������������� �� JobTitle �� ��������
SELECT NationalIDNumber, LoginID, JobTitle FROM HumanResources.Employee WHERE LoginID LIKE '%0' ORDER BY JobTitle DESC

--������� �� ������� Person.Person ��� ���������� � �������, ������� ���� 
--��������� � 2008 ���� (ModifiedDate) � MiddleName ��������
--�������� � Title �� �������� ��������
SELECT * FROM Person.Person WHERE YEAR(ModifiedDate) = 2008 AND MiddleName IS NOT NULL  AND MiddleName != '' AND (Title IS NULL OR Title = '')

--������� �������� ������ (HumanResources.Department.Name) ��� ����������
--� ������� ���� ����������
--������������ ������� HumanResources.EmployeeDepartmentHistory � HumanResources.Department
SELECT Name FROM HumanResources.Department, HumanResources.EmployeeDepartmentHistory WHERE EndDate IS NOT NULL

--������������ ������ �� ������� Sales.SalesPerson �� TerritoryID
--� ������� ����� CommissionPct, ���� ��� ������ 0
SELECT TerritoryID, SUM(CommissionPct) AS SumCommission FROM Sales.SalesPerson WHERE CommissionPct > 0 GROUP BY TerritoryID

--������� ��� ���������� � ����������� (HumanResources.Employee) 
--������� ����� ����� ������� ���-�� 
--������� (HumanResources.Employee.VacationHours)
SELECT * FROM HumanResources.Employee WHERE VacationHours = (SELECT MAX(VacationHours) FROM HumanResources.Employee)

--������� ��� ���������� � ����������� (HumanResources.Employee) 
--������� ����� ������� (HumanResources.Employee.JobTitle)
--'Sales Representative' ��� 'Network Administrator' ��� 'Network Manager'
SELECT * FROM HumanResources.Employee AS p WHERE p.JobTitle IN ('Sales Representative', 'Network Administrator', 'Network Manager') 

--������� ��� ���������� � ����������� (HumanResources.Employee) � 
--�� ������� (Purchasing.PurchaseOrderHeader). ���� � ���������� ���
--������� �� ������ ���� ������� ����!!!
SELECT * FROM HumanResources.Employee AS p LEFT JOIN Purchasing.PurchaseOrderHeader AS q ON p.BusinessEntityID = q.EmployeeID
