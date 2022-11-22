mysql> create table SalesPeople (
    ->     Snum int Primary key,
    ->     Sname varchar(24) Unique,
    ->     City varchar(255),
    ->     Comm int
    ->     );
Query OK, 0 rows affected (0.12 sec)

mysql> insert into SalesPeople
    -> values (1001, 'Peel', 'London',12),
    -> (1002, 'Serres', 'Sanjose',13),
    -> (1004, 'Motika', 'London',11),
    -> (1007, 'Rifkin', 'Barcelona',15),
    -> (1003, 'Axelrod', 'Newyork',10);
Query OK, 5 rows affected (0.16 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> Create table Customers (
    ->     Cnum int Primary Key,
    ->     Cname varchar(255) not null,
    ->     City varchar(255),
    ->     Snum int
    -> );
Query OK, 0 rows affected (4.18 sec)

mysql> insert into Customers
    -> values (2001,'Hoffman','London',1001),
    -> (2002,'Giovanni','Rome', 1003),
    -> (2003, 'Liu', 'Sanjose', 1002),
    -> (2004,'Grass','Berlin',1002),
    -> (2006,'Clemens','London',1001),
    -> (2008, 'Cisneros', 'Sanjose', 1007),
    -> (2007, 'Pereira', 'Rome', 1004);
Query OK, 7 rows affected (0.72 sec)
Records: 7  Duplicates: 0  Warnings: 0

mysql> create table Orders (
    ->     Onum int Primary key,
    ->     Amt int,
    ->     Odate date,
    ->     Cnum int,
    ->     Snum int
    -> );
Query OK, 0 rows affected (0.42 sec)

mysql> insert into Orders
    -> values (3001, 18.69, '1990-10-3', 2008, 1007),
    -> (3003, 767.19, '1990-10-3', 2001, 1001),
    -> (3002, 767.19, '1990-10-3', 2001, 1001),
    -> (3005, 1900.10, '1990-10-3', 2007, 1004),
    -> (3006, 5160.45, '1990-10-3', 2003, 1002),
    -> (3009, 1098.16, '1990-10-3', 2008, 1007),
    -> (3007, 1713.23, '1990-10-4', 2002, 1003),
    -> (3008, 75.75, '1990-10-4', 2004, 1002),
    -> (3010, 4273.00, '1990-10-5', 2006, 1001),
    -> (3011, 1309.95, '1990-10-6', 2004, 1002
    -> );
Query OK, 10 rows affected (0.10 sec)
Records: 10  Duplicates: 0  Warnings: 0

mysql> select * from salespeople;
+------+---------+-----------+------+
| Snum | Sname   | City      | Comm |
+------+---------+-----------+------+
| 1001 | Peel    | London    |   12 |
| 1002 | Serres  | Sanjose   |   13 |
| 1003 | Axelrod | Newyork   |   10 |
| 1004 | Motika  | London    |   11 |
| 1007 | Rifkin  | Barcelona |   15 |
+------+---------+-----------+------+
5 rows in set (0.00 sec)

mysql> select * from customers;
+------+----------+---------+------+
| Cnum | Cname    | City    | Snum |
+------+----------+---------+------+
| 2001 | Hoffman  | London  | 1001 |
| 2002 | Giovanni | Rome    | 1003 |
| 2003 | Liu      | Sanjose | 1002 |
| 2004 | Grass    | Berlin  | 1002 |
| 2006 | Clemens  | London  | 1001 |
| 2007 | Pereira  | Rome    | 1004 |
| 2008 | Cisneros | Sanjose | 1007 |
+------+----------+---------+------+
7 rows in set (0.00 sec)

mysql> select* from orders;
+------+------+------------+------+------+
| Onum | Amt  | Odate      | Cnum | Snum |
+------+------+------------+------+------+
| 3001 |   19 | 1990-10-03 | 2008 | 1007 |
| 3002 |  767 | 1990-10-03 | 2001 | 1001 |
| 3003 |  767 | 1990-10-03 | 2001 | 1001 |
| 3005 | 1900 | 1990-10-03 | 2007 | 1004 |
| 3006 | 5160 | 1990-10-03 | 2003 | 1002 |
| 3007 | 1713 | 1990-10-04 | 2002 | 1003 |
| 3008 |   76 | 1990-10-04 | 2004 | 1002 |
| 3009 | 1098 | 1990-10-03 | 2008 | 1007 |
| 3010 | 4273 | 1990-10-05 | 2006 | 1001 |
| 3011 | 1310 | 1990-10-06 | 2004 | 1002 |
+------+------+------------+------+------+
10 rows in set (0.00 sec)

# Display all the Salesperson whose all orders worth is more than Rs. 2000.
mysql> select * from orders
    -> where amt >2000;
+------+------+------------+------+------+
| Onum | Amt  | Odate      | Cnum | Snum |
+------+------+------------+------+------+
| 3006 | 5160 | 1990-10-03 | 2003 | 1002 |
| 3010 | 4273 | 1990-10-05 | 2006 | 1001 |
+------+------+------------+------+------+
2 rows in set (0.06 sec)

# Count the number of Salesperson whose name begin with ‘a’/’A’.
mysql> select count(snum) from salespeople
    -> where sname Like 'a%';
+-------------+
| count(snum) |
+-------------+
|           1 |
+-------------+
1 row in set (0.12 sec)

mysql> select * from salespeople
    -> where sname like'a%';
+------+---------+---------+------+
| Snum | Sname   | City    | Comm |
+------+---------+---------+------+
| 1003 | Axelrod | Newyork |   10 |
+------+---------+---------+------+
1 row in set (0.06 sec)

#Display the number of orders taken by each Salesperson and their date of orders.
ysql> select count(onum), odate, snum
    -> from orders
    -> group by Snum;
+-------------+------------+------+
| count(onum) | odate      | snum |
+-------------+------------+------+
|           2 | 1990-10-03 | 1007 |
|           3 | 1990-10-03 | 1001 |
|           1 | 1990-10-03 | 1004 |
|           3 | 1990-10-03 | 1002 |
|           1 | 1990-10-04 | 1003 |
+-------------+------------+------+
5 rows in set (0.03 sec)

# Count the number of Salesperson belonging to Newyork.
mysql> select count(Snum), city
    -> from salespeople
    -> where city = 'London';
+-------------+--------+
| count(Snum) | city   |
+-------------+--------+
|           2 | London |
+-------------+--------+
1 row in set (0.01 sec)



#Display the number of Salespeople belonging to London and belonging to Paris.
mysql> select * from salespeople
    -> where city = 'London' or city = 'Paris';
+------+--------+--------+------+
| Snum | Sname  | City   | Comm |
+------+--------+--------+------+
| 1001 | Peel   | London |   12 |
| 1004 | Motika | London |   11 |
+------+--------+--------+------+
2 rows in set (0.00 sec)

