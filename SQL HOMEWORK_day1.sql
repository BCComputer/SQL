create database store;
use store;

-- Here customer (one) ->> order (many) relationship so foreign key goes to the many side. 
-- Customer Table
CREATE TABLE Customer(
    customerId INT PRIMARY KEY,
    customerName VARCHAR(20),
    phone VARCHAR(10) NOT NULL,
    address VARCHAR(40),
    city VARCHAR(20),
    state VARCHAR(2),
    postalCode INT(5),
    orderId INT);

INSERT INTO Customer (customerId, customerName, phone, address, city, state, postalCode) VALUES
(1, 'John Doe', '1234567890', '123 Main St', 'New York', 'NY', 10001),
(2, 'Jane Smith', '0987654321', '456 Elm St', 'Los Angeles', 'CA', 90001),
(3, 'Bill Brown', '1112223333', '789 Pine St', 'Chicago', 'IL', 60007),
(4, 'Alice White', '4445556666', '321 Oak St', 'Houston', 'TX', 77001),
(5, 'Bob Johnson', '7778889999', '654 Cedar St', 'Phoenix', 'AZ', 85001),
(6, 'Charlie Black', '0001112222', '987 Willow St', 'Philadelphia', 'PA', 19101),
(7, 'Daisy Green', '3334445555', '159 Maple St', 'San Antonio', 'TX', 78201),
(8, 'Eve Blue', '6667778888', '753 Birch St', 'San Diego', 'CA', 92101),
(9, 'Frank Gray', '9990001111', '951 Redwood St', 'Dallas', 'TX', 75201),
(10, 'Grace Yellow', '2223334444', '357 Spruce St', 'San Jose', 'CA', 95101);

-- Orders Table
CREATE TABLE Orders(
    orderId INT PRIMARY KEY,
    orderDate DATE,
    orderDetials VARCHAR(30),
    shippedDate DATE,
    price DOUBLE,
    orderStatus VARCHAR(40),
    OrderComment VARCHAR(40),
    customerId int,
	FOREIGN KEY (customerId) REFERENCES Customer(customerId));

INSERT INTO Orders (orderId, orderDate, orderDetials, shippedDate, price, orderStatus, OrderComment, customerId) 
VALUES
(101, '2024-04-01', 'Phone', '2024-04-05', 800, 'Shipped', 'Expedited shipping', 1),
(102, '2024-04-02', 'Mic', '2024-04-06', 25, 'Shipped', 'Regular shipping',2),
(103, '2024-04-03', 'Laptop', '2024-04-07', 1200, 'Shipped', 'Urgent order',5),
(104, '2024-04-04', 'Ipad', '2024-04-08', 1100, 'Processing', 'Awaiting shipment',1),
(105, '2024-04-05', 'Charger', NULL, 15, 'Pending', 'Order received',2),
(106, '2024-04-06', 'Phone', NULL, 900, 'Pending', 'Processing',6),
(107, '2024-04-07', 'USB', '2024-04-11', 30, 'Shipped', 'Completed successfully',5),
(108, '2024-04-08', 'Ipad', '2024-04-12', 1150, 'Shipped', 'Delivery scheduled',7),
(109, '2024-04-09', 'mobile', NULL, 500,  'Pending', 'Awaiting payment',3),
(110, '2024-04-10', 'mouse', NULL,  25,'Pending', 'Delayed',1);

select*from customer;
select*from orders;

-- Employee Table
CREATE TABLE Employee(
    empid INT PRIMARY KEY,
    lastName VARCHAR(20),
    firstName VARCHAR(20),
    email VARCHAR(20) NOT NULL,
    officeCode VARCHAR(20),
    reportsTo VARCHAR(30),
    jobTitle VARCHAR(20)
);


INSERT INTO Employee (empid, lastName, firstName, email, officeCode, reportsTo, jobTitle) 
VALUES
(1, 'Doe', 'John', 'john.doe@example.com', 'NY', 'Manager', 'Sales'),
(2, 'Smith', 'Jane', 'jane.smith@example.com', 'LA', 'Supervisor', 'Marketing'),
(3, 'Brown', 'Bill', 'bill.brown@example.com', 'CHI', 'Director', 'Operations'),
(4, 'White', 'Alice', 'alice.white@example.com', 'HOU', 'CEO', 'Executive'),
(5, 'Johnson', 'Bob', 'bob.johnson@example.com', 'PHX', 'CTO', 'Technology'),
(6, 'Black', 'Charlie', 'chaie.black@example.com', 'PHI', 'COO', 'Operations'),
(7, 'Green', 'Daisy', 'daisy.green@example.com', 'SA', 'VP', 'Sales'),
(8, 'Blue', 'Eve', 'eve.blue@example.com', 'SD', 'Manager', 'Finance'),
(9, 'Gray', 'Frank', 'frank.gray@example.com', 'DAL', 'Manager', 'Engineering'),
(10, 'Yellow', 'Grace', 'grace.yellow@example.com', 'SJ', 'VP', 'HR');


drop table Product;
drop table employee;

-- Product Table
CREATE TABLE Product(
    productId INT PRIMARY KEY,
    productCode VARCHAR(10) UNIQUE,
    productName VARCHAR(20),
    productLine VARCHAR(20),
    qtyInStock INT,
    buyPrice DOUBLE,
    msrp DOUBLE
);


INSERT INTO Product (productId, productCode, productName, productLine, qtyInStock, buyPrice, msrp) 
VALUES
(1, 'P001', 'Laptop', 'Electronics', 50, 700.0, 1000.0),
(2, 'P002', 'Smartphone', 'Electronics', 150, 300.0, 500.0),
(3, 'P003', 'Headphones', 'Accessories', 200, 50.0, 100.0),
(4, 'P004', 'Tablet', 'Electronics', 80, 250.0, 400.0),
(5, 'P005', 'Monitor', 'Electronics', 30, 150.0, 250.0),
(6, 'P006', 'Printer', 'Office Equipment', 40, 100.0, 200.0),
(7, 'P007', 'Keyboard', 'Accessories', 300, 20.0, 50.0),
(8, 'P008', 'Mouse', 'Accessories', 250, 10.0, 30.0),
(9, 'P009', 'Speakers', 'Audio', 100, 75.0, 150.0),
(10, 'P010', 'External Hard Drive', 'Storage', 120, 60.0, 100.0);

select*from product;
alter table employee modify column email varchar(40);

select*from employee;

select*from employee where empid <=6;
select*from employee where empid <=6 && firstName = 'John';

select*from employee where firstName like 'a%';
select*from employee order by jobTitle asc;
select*from employee order by jobTitle desc;

SELECT*from orders order by orderId desc limit 3;

select*from orders where OrderComment = 'awaiting payment';

select sum(buyPrice) as BuyPrice from product;
select avg(buyPrice) as AveragePrice from product;
select avg(buyPrice) as AverageRate from product;

select min(buyPrice) as MinPrice from product;
select max(buyPrice) as MinPrice from product;

select*from orders;
select*from customer;
select*from employee;

select * from employee inner join employee where employee.empid = customer.custId;

-- Many to Many relationship between Book and Writer
-- Writer Table
CREATE TABLE Writer (
    writerId INT PRIMARY KEY,
    firstName VARCHAR(20),
    lastName VARCHAR(20),
    nationality VARCHAR(20),
    birthDate DATE
);

-- Book Table
CREATE TABLE Book (
    bookId INT PRIMARY KEY,
    title VARCHAR(50),
    genre VARCHAR(20),
    publishDate DATE,
    isbn VARCHAR(20) UNIQUE
);

-- WriterBook Junction Table
CREATE TABLE WriterBook (
    writerId INT,
    bookId INT,
    FOREIGN KEY (writerId) REFERENCES Writer(writerId),
    FOREIGN KEY (bookId) REFERENCES Book(bookId),
    PRIMARY KEY (writerId, bookId)  -- Composite primary key for many-to-many
);

INSERT INTO Writer (writerId, firstName, lastName, nationality, birthDate) VALUES
(1, 'George', 'Orwell', 'British', '1903-06-25'),
(2, 'J.K.', 'Rowling', 'British', '1965-07-31'),
(3, 'Ernest', 'Hemingway', 'American', '1899-07-21'),
(4, 'Jane', 'Austen', 'British', '1775-12-16'),
(5, 'Mark', 'Twain', 'American', '1835-11-30'),
(6, 'Harper', 'Lee', 'American', '1926-04-28'),
(7, 'Charles', 'Dickens', 'British', '1812-02-07'),
(8, 'Virginia', 'Woolf', 'British', '1882-01-25'),
(9, 'Leo', 'Tolstoy', 'Russian', '1828-09-09'),
(10, 'F. Scott', 'Fitzgerald', 'American', '1896-09-24');

INSERT INTO Book (bookId, title, genre, publishDate, isbn) VALUES
(1, '1984', 'Dystopian', '1949-06-08', '9780451524935'),
(2, 'Animal Farm', 'Allegory', '1945-08-17', '9780451526342'),
(3, 'Harry Potter and the Sorcerer''s Stone', 'Fantasy', '1997-06-26', '9780439708180'),
(4, 'The Old Man and the Sea', 'Literary Fiction', '1952-09-01', '9780684801223'),
(5, 'Pride and Prejudice', 'Romance', '1813-01-28', '9781503290563'),
(6, 'The Adventures of Tom Sawyer', 'Adventure', '1876-06-09', '9780486280615'),
(7, 'To Kill a Mockingbird', 'Literary Fiction', '1960-07-11', '9780446310789'),
(8, 'A Tale of Two Cities', 'Historical Fiction', '1859-04-30', '9780486406510'),
(9, 'War and Peace', 'Historical Fiction', '1869-01-01', '9781400079988'),
(10, 'The Great Gatsby', 'Literary Fiction', '1925-04-10', '9780743273565');

INSERT INTO WriterBook (writerId, bookId) VALUES
(1, 1), -- George Orwell - 1984
(1, 2), -- George Orwell - Animal Farm
(2, 3), -- J.K. Rowling - Harry Potter and the Sorcerer's Stone
(3, 4), -- Ernest Hemingway - The Old Man and the Sea
(4, 5), -- Jane Austen - Pride and Prejudice
(5, 6), -- Mark Twain - The Adventures of Tom Sawyer
(6, 7), -- Harper Lee - To Kill a Mockingbird
(7, 8), -- Charles Dickens - A Tale of Two Cities
(9, 9), -- Leo Tolstoy - War and Peace
(10, 10); -- F. Scott Fitzgerald - The Great Gatsby

-- One to one relationship

create table EmployeeTable(
emplyId int primary key,
EmpName varchar (30),
empPhone varchar (10),
empAddress varchar(200));

select*from employeeTable;

INSERT INTO EmployeeTable (emplyId, EmpName, empPhone, empAddress) VALUES
(201, 'John Smith', '1234567890', '123 Main St, Springfield, IL'),
(202, 'Jane Doe', '0987654321', '456 Elm St, Austin, TX'),
(203, 'Robert Johnson', '1112223333', '789 Pine St, San Diego, CA');

create table EmployeeAccounts(
emplyId int,
bankId int, 
salary double
);

insert into employeeAccounts(emplyId, bankId, salary)
values(201, 0983343, 2500),
(202, 543333, 4000),
(203, 063333, 6000);

select*from employeeTable;
select*from employeeAccounts;




-- Practice in class
-- Practice in class
-- Practice in class
-- Practice in class
-- Practice in class


select*from products;
select*from vendors;

create database shoppingCart;
create table product (
id int, 
productName varchar(50), 
price int, 
wholesalePrice int, 
finalPrice int,
soldDate datetime, 
soldTime time, 
buyerName varchar(70)
);
use shoppingcart;
use vender;
drop database mydb1;

create database vender;

CREATE TABLE vendors (
    vendor_id INT AUTO_INCREMENT PRIMARY KEY,  
    vendor_name VARCHAR(100) NOT NULL,         
    contact_name VARCHAR(100),                 
    contact_email VARCHAR(100),                
    phone VARCHAR(20),                         
    address VARCHAR(200)                       
);

INSERT INTO vendors (vendor_name, contact_name, contact_email, phone, address) 
VALUES 
('Tech Solutions', 'John Doe', 'johndoe@example.com', '123-456-7890', '123 Tech Street, Tech City, TX'),
('Global Traders', 'Jane Smith', 'janesmith@example.com', '234-567-8901', '456 Global Ave, Commerce Town, CT'),
('Fast Supplies', 'Mike Johnson', 'mikejohnson@example.com', '345-678-9012', '789 Supply Road, Business City, BC'),
('Quality Goods', 'Sarah Brown', 'sarahbrown@example.com', '456-789-0123', '101 Quality Lane, Market City, MC'),
('Top Gear', 'Tom White', 'tomwhite@example.com', '567-890-1234', '202 Gear Drive, Hardware Town, HT'),
('Premier Partners', 'Lucy Green', 'lucygreen@example.com', '678-901-2345', '303 Premier St, Service City, SC'),
('Ultimate Sources', 'Chris Blue', 'chrisblue@example.com', '789-012-3456', '404 Source Blvd, Sourcing Town, ST'),
('Reliable Corp', 'Nina Red', 'ninared@example.com', '890-123-4567', '505 Reliable Rd, Supply City, SP'),
('Dynamic Distribution', 'Oscar Black', 'oscarblack@example.com', '901-234-5678', '606 Distribution Way, Delivery City, DC'),
('Wholesale Masters', 'Linda Gray', 'lindagray@example.com', '012-345-6789', '707 Wholesale Rd, Bulk City, BC');

insert into product(id, productName, price, wholesalePrice, finalPrice, soldDate, soldTime, buyerName)
values(101, 'Milk', 4.20, 3.20, 4.20, '2024-04-21', '12:23:43', 'costo'); 

INSERT INTO product (id, productName, price, wholesalePrice, finalPrice, soldDate, soldTime, buyerName) 
VALUES 
(102, 'Laptop', 1200, 1000, 1150, '2024-04-21 14:30:00', '14:30:00', 'John Doe'),
(103, 'Smartphone', 800, 650, 750, '2024-04-22 10:00:00', '10:00:00', 'Jane Smith'),
(104, 'Tablet', 500, 400, 450, '2024-04-23 16:15:00', '16:15:00', 'Alice Johnson'),
(105, 'Headphones', 150, 120, 130, '2024-04-24 12:45:00', '12:45:00', 'Bob Brown'),
(106, 'Smartwatch', 200, 160, 180, '2024-04-25 11:30:00', '11:30:00', 'Charlie Black'),
(107, 'Gaming Console', 300, 250, 280, '2024-04-26 13:00:00', '13:00:00', 'Eve White'),
(108, 'Camera', 700, 600, 650, '2024-04-27 09:00:00', '09:00:00', 'Frank Green'),
(109, 'Printer', 100, 80, 90, '2024-04-28 15:45:00', '15:45:00', 'Grace Blue'),
(110, 'Monitor', 250, 200, 230, '2024-04-29 17:00:00', '17:00:00', 'Hannah Yellow'),
(1111, 'Keyboard', 50, 40, 45, '2024-04-30 14:00:00', '14:00:00', 'Ivy Red');

select*from product;
 select*from laptop;
create table laptop(
id int,
laptopName varchar(30),
screenSize int (4),
weight int
);

CREATE TABLE laptop (
    id INT AUTO_INCREMENT PRIMARY KEY,   
    model VARCHAR(50),                  
    brand VARCHAR(50),                  
    processor VARCHAR(50),             
    ram INT,                            
    storage INT,                        
    storage_type ENUM('HDD', 'SSD'),
    screen_size FLOAT,                  
    price DECIMAL(10, 2),               
    release_date DATE                   
);

CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,  
    product_name VARCHAR(100) NOT NULL,          
    price DECIMAL(10, 2),                       
    quantity INT,                               
    vendor_id INT,                               
    FOREIGN KEY (vendor_id) REFERENCES vendors(vendor_id)  
);

INSERT INTO products (product_name, price, quantity, vendor_id) 
VALUES 
('Laptop X', 999.99, 50, 1),
('Tablet Y', 399.99, 200, 2),
('Monitor Z', 199.99, 150, 3),
('Keyboard A', 49.99, 300, 4),
('Mouse B', 29.99, 250, 5),
('Headphones C', 79.99, 180, 6),
('Printer D', 149.99, 100, 7),
('Router E', 89.99, 80, 8),
('Smartphone F', 699.99, 90, 9),
('Camera G', 599.99, 60, 10);

INSERT INTO laptop (model, brand, processor, ram, storage, storage_type, screen_size, price, release_date) 
VALUES 
('XPS 13', 'Dell', 'Intel i7', 16, 512, 'SSD', 13.3, 1299.99, '2023-03-15'),
('MacBook Pro', 'Apple', 'Apple M1', 16, 256, 'SSD', 13.3, 1499.00, '2023-06-10'),
('ThinkPad X1 Carbon', 'Lenovo', 'Intel i5', 8, 256, 'SSD', 14.0, 1099.99, '2023-01-20'),
('Spectre x360', 'HP', 'Intel i7', 16, 512, 'SSD', 13.3, 1399.99, '2023-04-01'),
('ZenBook 14', 'ASUS', 'AMD Ryzen 7', 16, 512, 'SSD', 14.0, 1299.00, '2023-07-15'),
('Surface Laptop 4', 'Microsoft', 'AMD Ryzen 5', 8, 256, 'SSD', 13.5, 999.99, '2022-12-10'),
('MateBook X Pro', 'Huawei', 'Intel i7', 16, 512, 'SSD', 13.9, 1499.99, '2023-05-20'),
('Yoga 9i', 'Lenovo', 'Intel i7', 16, 512, 'SSD', 14.0, 1199.00, '2023-03-30'),
('Pixelbook Go', 'Google', 'Intel i5', 8, 128, 'SSD', 13.3, 899.00, '2023-02-25'),
('Razer Blade Stealth', 'Razer', 'Intel i7', 16, 256, 'SSD', 13.3, 1599.99, '2023-01-15');
 select*from laptop;

drop table laptop;
create table empoyee1(
id int,
first varchar(30),
lastName varchar (2),
phoneNumber int (10),
email varchar(30),
address varchar (200),
city varchar(2)
);
use db3;

alter table empoyee drop column city;

select*from empoyee;
drop table empoyee;

show tables;


use mydb1;

create table product(
id int,
itemName varchar(30),
itemCatagory varchar (20),
discription varchar (300)
);

alter table product add column productid int;
alter table product add column productsize int;

alter table product drop column itemCatagory;
alter table product drop column discription;



alter table product rename column productid to prodId;

alter table product modify column prodId varchar(100);


select*from product;


insert into product (id, itemName, prodId, productsize)
values(1, 'water', '101', '3');

insert into product (id, itemName, prodId, productsize)
values
(3, 'milk', '103', '14'), 
(4, 'potato', '104', '20'), 
(5, 'apple', '105', '50'), 
(6, 'orange', '106', '30');

insert into product (id, itemName, prodId, productsize)
values
(7, "milk", "103", "14"); 

create table student(
id int primary key,
firstName varchar(25),
lastName varchar(3),
phonenumber int (1) unique,
email varchar(25) not null unique,
address varchar(200)
);

insert into student(id, firstName, lastName, phonenumber, email, address)
values(2, 'ram', 'kan', '32323231', 'ram@gmail.com', '123 unique rd');

insert into student(id, firstName, lastName,  email, address)
values(4, 'ram', 'kan',  'raaa@gmail.com', '123 unique rd');

select*from student;

create table student1(
id int primary key,
firstName varchar(25),
lastName varchar(3),
phonenumber int (1) unique,
email varchar(25) not null unique,
address varchar(200)
);

alter table student1 modify column email varchar(25) unique;
insert into student1(id, firstName, lastName, phonenumber, address)
values(1, 'ram', 'kan', '32323231', '123 unique rd');

select*from student1;

alter table student1 drop primary key;
alter table stuent1 modify column id int primary key;
insert into student1(id, firstName, lastName, phonenumber, address, email)
values(2, 'ram', 'kan', '323231', '123 unique rd', 'abc@gmail.com');

select*from student1;




create table binary_student(
id int primary key,
firstName varchar(25),
lastName varchar(3),
phonenumber int (1) unique,
email varchar(25) not null unique,
address varchar(200),
friend_ID int, FOREIGN KEY (friend_ID) REFERENCES student(id) 
);

insert into student1(id, firstName, lastName, phonenumber, address, email, friend_ID)
values(3, 'ram', 'kan', '323231', '123 unique rd', 'ac@gmail.com', 1);

insert into binary_student(id, firstName, lastName, phonenumber, address, email, friend_ID)
values(3, 'ram', 'kan', '32323331', '123 unique rd', 'abcd@gmail.com',2);


select*from student;

select*from binary_student;

alter table binary_student rename column  friend_ID to friend_ID_Fk;

create table teacher(
id int primary key,
name varchar(3),
email varchar(25)
);

alter table binary_student add column teacher_id int; 
alter table binary_student add foreign key(teacher_id) references teacher(id);

select*from teacher;


create table primary_school_students(
id int primary key,
firstname varchar (20),
lastname varchar(20),
age int (2) check(age<=10),
city varchar(10) default 'VA'
);

insert into primary_school_students(id, firstname, lastname, age, city)
values(1, 'ram', 'hari', 10, 'MD');
select*from primary_school_students;

alter table primary_school_students modify column course varchar(20) default 'MATH';

insert into primary_school_students(id, firstname, lastname, age)
values(2, 'ram', 'hari', 10);

alter table primary_school_students add column course varchar(10);

select id, firstname from primary_school_students;
select*from primary_school_students where age >=6;

select*from primary_school_students where age <=5 and city = 'md';

select*from primary_school_students where firstname like'r%';

select*from primary_school_students where course is not null;
select*from primary_school_students order by age asc;
select*from primary_school_students order by age desc;

update primary_school_students set course ='ENG' where id = 1;

select*from primary_school_students;

update primary_school_students set course ='ENG';
set SQL_SAFE_UPDATES =1;

insert into primary_school_students(id, firstname, lastname, age, city)
values(6, 'Fiona', 'Garcia', 9, 'NY'),
(7, 'George', 'Martinez', 10, 'MA'),
(8, 'Hannah', 'Rodriguez', 1, 'CA'),
(9, 'Isaac', 'Lee', 9, 'LA'),
(10, 'Jasmine', 'Perez', 10, 'DC'),
(11, 'Kevin', 'Hernandez', 1, 'MD'),
(12, 'Lily', 'Lopez', 9, 'VA'),
(13, 'Mia', 'Gonzalez', 10, 'CO'),
(14, 'Nathan', 'Clark', 9, 'MD'),
(15, 'Olivia', 'Moore', 9, 'LA'),
(16, 'Peter', 'White', 10, 'NC'),
(17, 'Quinn', 'Taylor', 5, 'NC'),
(18, 'Ruby', 'Anderson', 9, 'NC'),
(19, 'Samuel', 'Thomas', 10, 'GA'),
(20, 'Tina', 'Walker', 3, 'DC');

SELECT*from primary_school_students order by id desc limit 3;


SELECT*from primary_school_students order by id desc limit 2, 1;

SELECT*from primary_school_students where age between 3 and 5;
SELECT*from primary_school_students where age in (2, 8);

SELECT*from primary_school_students where city not in ('va', 'nc', 'ny');

SELECT*from primary_school_students order by age asc, id desc;

create table product(
id int primary key,
name varchar(20),
price int,
ratings float(3,2)
);


insert into product(id, name, price, ratings)
values
(1, 'tv', 100, 4.20),
(2, 'remote', 2, 1.20),
(3, 'laptop', 100, 3.20),
(4, 'box', 12, 4.30),
(5, 'phone', 150, 2.20),
(6, 'plate', 10, 4.20),
(7, 'pellow', 50, 2.20),
(8, 'cap', 20, 2.30),
(9, 'toy', 1, 2.8),
(10, 'car', 1000, 1.20),
(11, 'water', 3.4, 3.20);

select * from product;

select sum(price) as Total from product;
select avg(price) as AveragePrice from product;
select avg(ratings) as AverageRate from product;

select min(price) as MinPrice from product;
select max(price) as MinPrice from product;

select count(id) as TotalProduct from product;

insert into product(id, name, price, ratings)
values
(14, 'tv', 100, 4.20),
(15, 'tv', 2, 1.20),
(16, 'tv', 100, 3.20);


select count(name) as countTV from product where name = 'tv';
select count(name) as countTV, sum(price) as total, avg(ratings) from product where name ='tv';

-- Multiplcity
-- 1:1 - one to one 
-- 1:n or n:1 -> ONe to many or many to one
-- n:n --> many to many

-- Join
-- Inner Join
-- Left outer join
-- Right outer join
-- full join
-- self join


create table customers(
id int primary key,
fullname varchar(3) not null,
email varchar(35) not null unique
);

create table orders(
id int primary key,
total double(4,2) not null,
invoiceNo varchar(20) unique,
orderDate date,
customers_id int not null,
foreign key(customers_id) references customers(id)
);

alter table customers modify column fullname varchar(20);

insert into customers(id, fullname, email)
values
(1, 'joy', 'jay@email.com'),
(2, 'Mark', 'mark@email.com'),
(3, 'Salt', 'salt@email.com'),
(4, 'Jack', 'jack@email.com'),
(5, 'Joy', 'joy@email.com'),
(6, 'Koy', 'koy@email.com'),
(7, 'Rita', 'rita@email.com'),
(8, 'Sita', 'sita@email.com'),
(9, 'Gita', 'gita@email.com'),
(10, 'Lalit', 'lalit@email.com'),
(11, 'Saru', 'saru@email.com'),
(12, 'Hemant', 'hemant@email.com');

select*from customers;


create table orders(
id int primary key,
total double(4,2) not null,
invoiceNo varchar(20) unique,
orderDate date,
customers_id int not null,
foreign key(customers_id) references customers(id)
);

insert into orders(id, total, invoiceNo, orderDate, customers_id)
values
(1, 20.00, '123abc', '2024-04-23', 2),
(2, 40.00, '223abc', '2024-04-12', 2),
(3, 50.00, '323abc', '2024-04-01', 4),
(4, 10.00, '423abc', '2024-04-03', 6),
(5, 40.00, '523abc', '2024-04-11', 8),
(6, 45.00, '623abc', '2024-04-15', 7),
(7, 60.00, '723abc', '2024-04-17', 1),
(8, 2.00, '183abc', '2024-04-22', 1),
(9, 6.00, '923abc', '2024-04-16', 3),
(10, 7.00, '1023abc', '2024-04-20', 7),
(11, 12.40, '1123abc', '2024-04-23', 2);

select*from orders;

select*from orders order by customers_id desc;

select * from orders inner join customers where orders.customers_id = customers.id;

-- select orders.*, customers.fullname, customers.email from orders inner join customers one orders.customers_id = customers.id;

-- select orders.*, customers.fullname, customers.email from orders inner join customers where orders.customers_id = customers.id;

select o.id, total, invoiceNo, fullname, email from orders o inner join customers c on o.customers_id = c.id;

select o.id, total, invoiceNo, fullname, email from orders o inner join customers c on o.customers_id = c.id;

select * from customers left outer join orders on orders.customers_id = customers.id;

select * from customers right outer join orders on orders.customers_id = customers.id;

select * from customers full join orders;
select * from customers self join orders;


-- Store DB
-- Employee - tables
-- customer - tables
-- Product - tables
-- Orders - tables
