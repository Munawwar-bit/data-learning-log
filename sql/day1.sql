SELECT, WHERE, ORDER BY

use sql_store;

select * from customers
where customer_id = 1
order by first_name;

## Practice Exercise #1:
Based on the employees table below, select all fields from the employees table whose salary is less than or equal to $52,500 (no sorting is required):

CREATE TABLE employees
( employee_number int NOT NULL,
  last_name char(50) NOT NULL,
  first_name char(50) NOT NULL,
  salary int,
  dept_id int,
  CONSTRAINT employees_pk PRIMARY KEY (employee_number)
);

INSERT INTO employees
(employee_number, last_name, first_name, salary, dept_id)
VALUES
(1001, 'Smith', 'John', 62000, 500);

INSERT INTO employees
(employee_number, last_name, first_name, salary, dept_id)
VALUES
(1002, 'Anderson', 'Jane', 57500, 500);

INSERT INTO employees
(employee_number, last_name, first_name, salary, dept_id)
VALUES
(1003, 'Everest', 'Brad', 71000, 501);

INSERT INTO employees
(employee_number, last_name, first_name, salary, dept_id)
VALUES
(1004, 'Horvath', 'Jack', 42000, 501);

### Answer:
select * from employees
where salary <= 52500;

## Practice Exercise #2:
Based on the suppliers table below, select the unique city values that reside in the state of California and order the results in descending order by city:

CREATE TABLE suppliers
( supplier_id int NOT NULL,
  supplier_name char(50) NOT NULL,
  city char(50),
  state char(25),
  CONSTRAINT suppliers_pk PRIMARY KEY (supplier_id)
);

INSERT INTO suppliers
(supplier_id, supplier_name, city, state)
VALUES
(100, 'Microsoft', 'Redmond', 'Washington');

INSERT INTO suppliers
(supplier_id, supplier_name, city, state)
VALUES
(200, 'Google', 'Mountain View', 'California');

INSERT INTO suppliers
(supplier_id, supplier_name, city, state)
VALUES
(300, 'Oracle', 'Redwood City', 'California');

INSERT INTO suppliers
(supplier_id, supplier_name, city, state)
VALUES
(400, 'Kimberly-Clark', 'Irving', 'Texas');

INSERT INTO suppliers
(supplier_id, supplier_name, city, state)
VALUES
(500, 'Tyson Foods', 'Springdale', 'Arkansas');

INSERT INTO suppliers
(supplier_id, supplier_name, city, state)
VALUES
(600, 'SC Johnson', 'Racine', 'Wisconsin');

INSERT INTO suppliers
(supplier_id, supplier_name, city, state)
VALUES
(700, 'Dole Food Company', 'Westlake Village', 'California');

INSERT INTO suppliers
(supplier_id, supplier_name, city, state)
VALUES
(800, 'Flowers Foods', 'Thomasville', 'Georgia');

INSERT INTO suppliers
(supplier_id, supplier_name, city, state)
VALUES
(900, 'Electronic Arts', 'Redwood City', 'California');

### Answer:
select distinct city from suppliers
where state = "California"
order by city desc;

## 3. Show the name for the countries that have a population of at least 200 million. 200 million is 200000000, there are eight zeros.

Answer: select name from world
where population >= 200000000;

##4.
Give the name and the per capita GDP for those countries with a population of at least 200 million.

HELP:How to calculate per capita GDP
per capita GDP is the GDP divided by the population GDP/population

Answer: select name, GDP/population AS 'per capita GDP' from world
where population > 200000000;

##5 AS

select name, GDP/population AS 'per capita GDP' from world
where population > 200000000; 

##6 in millions

select name, population/1000000 AS 'population in millions' from world
where continent = 'South America';

##6 IN

select name, population from world
where name IN ('France','Germany', 'Italy');

##7 LIKE

select name from world
where name like '%United%';

##8 OR

select name, population, area from world
where area > 3000000 OR population > 250000000;

##9 XOR

select name, population, area from world
where area > 3000000 XOR population > 250000000;

##10 Rounding

select name, round(population/1000000, 2), round(gdp/1000000000, 2) from world
where continent = 'South America';
