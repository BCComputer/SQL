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