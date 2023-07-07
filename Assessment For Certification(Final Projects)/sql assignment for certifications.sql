-- creating new database --
CREATE DATABASE office_management;

-- creating Table Employers
CREATE TABLE  Employers(
    id int,
    name varchar(255),
    Role varchar(255),
    Salary int
);

-- insertng record in the Employee table
insert into Employers (id, name, Role, Salary)
values (5588, "Mr Rahim", "Area Coordinator", 50000),
(6677, "Mr Karim", "Regional coordinator", 50000);


CREATE TABLE  Users(
    id int,
    name varchar(255),
    phone varchar(255),
    role varchar(255),
    Salary int,
    Employers_id int
);

-- insertng record in Users table

insert into Users (id, name, phone, role, Salary, Employers_id)
values (7856, "Mr Abul", "02255666777", "BR", 25000, 5588),
(7654, "Mr Babul", "01177555666", "SuperVisor", 27500, 6677),
(8768, "Miss Jorina", "02299000111", "BR", 40000, 5588),
(5748, "Mrs Morjina", "01155886644", "BR", 38000, 5588),
(5748, "Mrs Morjina", "01155886644", "BR", 38000, 5588);


-- 1. Optimized this query?
select count(1) from users;


-- 2. View all users and employers who get maximum salary from each group?
SELECT u.id, u.name AS user_name, u.phone AS user_phone, u.role AS user_role, u.Salary AS user_salary, e.id AS employer_id, e.name AS employer_name,  e.Role AS employer_Role, e.Salary AS employer_salary
FROM Users u
JOIN Employers e ON u.Employers_id = e.id
JOIN (
  SELECT Employers_id, MAX(Salary) AS max_salary
  FROM Users
  GROUP BY Employers_id
) t ON u.Employers_id = t.Employers_id AND u.Salary = t.max_salary;


-- 3. You want to delete everything of Users, write a query 
DELETE FROM Users;


-- 4. Get the second highest salary from the Users table and which users get them
SELECT DISTINCT u.id, u.name, u.Salary
FROM Users u
WHERE u.Salary = (
  SELECT MAX(Salary)
  FROM Users
  WHERE Salary < (
    SELECT MAX(Salary)
    FROM Users
  )
);

-- 5. How to get distinct records from the Names from users table without using distinct keyword.
SELECT name
FROM Users
GROUP BY name;


-- 6. How to find the count of duplicate rows from a table?
-- You can find duplicates by grouping rows, using the COUNT aggregate function, and specifying a HAVING clause with which to filter rows
select name, role from users 
group by name, role
having count(id) > 1;


-- 7. Remove duplicates from users but keep one.
SELECT * FROM Users GROUP BY id,name HAVING count(*) = 1
union 
SELECT * FROM Users GROUP BY id,name HAVING count(*) > 1



























