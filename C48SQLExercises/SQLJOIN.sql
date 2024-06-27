/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
 SELECT Products.Name, Categories.Name
 FROM Products
 INNER JOIN Categories ON Products.CategoryID = Categories.CategoryID
 WHERE Categories.CategoryID = 1;
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
 SELECT Products.Name, Products.Price, Reviews.Rating
 FROM Products
 INNER JOIN Reviews ON Products.ProductID = Reviews.ProductID
 WHERE Reviews.Rating = 5;
 
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
SELECT Employees.FirstName, SUM(Sales.Quantity) AS TQS
FROM Employees
INNER JOIN Sales ON Employees.EmployeeID = Sales.EmployeeID
GROUP BY Employees.EmployeeID
ORDER BY TQS DESC
LIMIT 2;

/* joins: find the name of the department, and the name of the category for Appliances and Games */
SELECT Departments.Name AS DeptName, Categories.Name AS CatName
FROM Departments
INNER JOIN Categories ON Departments.DepartmentID = Categories.DepartmentID
WHERE Categories.Name IN ('appliences', 'games');

/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
SELECT products.Name AS ProductName, SUM(Sales.Quantity) AS TQS, SUM(Sales.Quantity * Products.Price) AS TPS
FROM Products
INNER JOIN Sales ON Products.ProductID = Sales.ProductID
WHERE Products.Name = 'Eagles: Hotel California'
GROUP BY Products.Name;
/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
SELECT products.Name, reviews.Reviewer, reviews.Rating, reviews.Comment
FROM products
INNER JOIN reviews ON products.ProductID = reviews.ProductID
WHERE products.Name = 'Visio TV'
AND reviews.Rating = 1;

-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */
SELECT
employees.EmployeeID,
employees.FirstName,
employees.LastName,
products.Name AS ProductName,
SUM(sales.Quantity) AS TQS
FROM employees
INNER JOIN sales ON employees.EmployeeID = sales.EmployeeID
INNER JOIN products ON sales.ProductID = products.ProductID
GROUP BY 
employees.EmployeeID,
employees.FirstName,
employees.LastName,
products.Name
ORDER BY
employees.EmployeeID,
products.Name;