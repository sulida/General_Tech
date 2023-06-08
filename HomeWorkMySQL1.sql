1. ��������� 10 ������� ������-��������� ��� ����� ���������� ������� (����� ��������-��������), � ����� �� ������������ �� CRUD.

�������� ������-������� ������ ������������ ��� �������:

������� ������� (Create)
��������� ������� ������� (Read)
���������� ������� (Update)
�������� ������-��������� (Create)
����������� ������-��������� � ������� (Read)
�������� ���������� ��������� (Create)
����������� ���������� ��������� (Read)
���������� ������-������� (Update)
����������� ������-������� (Update)
������������� ������ �� ������ (Update)



2. ������� �������� � ��������� ������� �� 20 EUR. 
SELECT ProductName, Price
FROM [Products]
WHERE
Price >= 20

3. ������� ������ �����������.
SELECT Country
FROM [Suppliers]

4. � ������������� �� ��������� ���� ������� �������� � ��������� ������� �� ������� � 9% �� ���� �����������, ����� ���������� 1. 

SELECT ProductName, 
Price * 0.91 AS Price_low,

FROM [Products]
WHERE
SupplierID != 1
ORDER BY PRICE ASC

5. ������� ���������� ����� ��������, ����� ���, ��� �� France � USA.

SELECT CustomerName,

FROM [Customers]
WHERE
Country != 'Germany'
AND
Country != 'France'