

use test;


insert into bookstore (bookstore_id, name)
values (1, '5531 Bookstore');

insert into customer (customer_id, first_name, last_name, email, phone_number, address, city, postal_code, province, total_purchases)
values
	(1, 'Albert', 'Ainstein', 'albert@gmail.com', 12345678910, 'Albert Street', 'Toronto', 'M4C1A1', 'ON', 40),
	(2, 'Blbert', 'Binstein', 'blbert@gmail.com', 12345678911, 'Albert Street', 'Toronto', 'M4C1A1', 'ON', 39),
	(3, 'Clbert', 'Cinstein', 'clbert@gmail.com', 12345678912, 'Albert Street', 'Toronto', 'M4C1A1', 'ON', 38),
	(4, 'Dlbert', 'Dinstein', 'dlbert@gmail.com', 12345678913, 'Albert Street', 'Toronto', 'M4C1A1', 'ON', 37),
	(5, 'Elbert', 'Einstein', 'elbert@gmail.com', 12345678914, 'Albert Street', 'Toronto', 'M4C1A1', 'ON', 36),
	(6, 'Flbert', 'Finstein', 'flbert@gmail.com', 12345678915, 'Albert Street', 'Toronto', 'M4C1A1', 'ON', 35),
	(7, 'Glbert', 'Ginstein', 'glbert@gmail.com', 12345678916, 'Albert Street', 'Toronto', 'M4C1A1', 'ON', 34),
	(8, 'Hlbert', 'Hinstein', 'hlbert@gmail.com', 12345678917, 'Albert Street', 'Toronto', 'M4C1A1', 'ON', 33),
	(9, 'Ilbert', 'Iinstein', 'ilbert@gmail.com', 12345678918, 'Albert Street', 'Toronto', 'M4C1A1', 'ON', 32),
	(10, 'John', 'Smith', 'john.smith@gmail.com', 19987654321, 'Hohn Street', 'Toronto', 'A5D2B2', 'BC', 25);
	

insert into author (author_id, first_name, last_name) 
values
    (1, 'Jk',      'Rowling'),
    (2, 'Leo' ,    'Tolstoy'),
    (3, 'Wiliam',  'Shakespeare'),
    (4, 'Jane',    'Austen'),
    (5, 'Charles', 'Dickens'),
    (6, 'Abraham', 'Silberschatz'),
    (7, 'RogerS',  'Pressman'),
    (8, 'Mark' ,   'Twiain'),
    (9, 'James' ,  'Patterson'),
    (10, 'Agatha', 'Christie'),
    (11, 'James' , 'Guyer'),
    (12, 'William', 'Ditty'),
    (13, 'Lucia', 'Yushachkov');
   
  
insert into reader_interest (customer_id, email, genre)
values 
 	(1, 'albert@gmail.com', 'Horror'),
  	(2, 'blbert@gmail.com', 'Horror'),
  	(3, 'clbert@gmail.com', 'Horror'),
  	(4, 'dlbert@gmail.com', 'Horror'),
  	(5, 'elbert@gmail.com', 'Horror'),
  	(6, 'flbert@gmail.com', 'Horror'),
  	(7, 'glbert@gmail.com', 'Horror'),
  	(8, 'hlbert@gmail.com', 'Horror'),
  	(9, 'ilbert@gmail.com', 'Horror'),
  	(10, 'john.smith@gmail.com', 'Suspense');
  
  
insert into publisher (publisher_id, name, phone_number, email, website, address, city, province, postal_code) 
values 
	(1, 'publisher1', 12345678911, 'publisher1@gmail.com', 'publisher1.com', 'Publisher1 Street', 'Toronto', 'ON', 'M4C1A1'),
	(2, 'publisher2', 12345678912, 'publisher1@gmail.com', 'publisher2.com', 'Publisher2 Street', 'Toronto', 'ON', 'M4C1A1'),
	(3, 'publisher3', 12345678913, 'publisher1@gmail.com', 'publisher3.com', 'Publisher3 Street', 'Toronto', 'ON', 'M4C1A1'),
	(4, 'publisher4', 12345678914, 'publisher1@gmail.com', 'publisher4.com', 'Publisher4 Street', 'Toronto', 'ON', 'M4C1A1'),
	(5, 'publisher5', 12345678915, 'publisher1@gmail.com', 'publisher5.com', 'Publisher5 Street', 'Toronto', 'ON', 'M4C1A1'),
	(6, 'publisher6', 12345678916, 'publisher1@gmail.com', 'publisher6.com', 'Publisher6 Street', 'Toronto', 'ON', 'M4C1A1'),
	(7, 'publisher7', 12345678917, 'publisher1@gmail.com', 'publisher7.com', 'Publisher7 Street', 'Toronto', 'ON', 'M4C1A1'),
	(8, 'publisher8', 12345678918, 'publisher1@gmail.com', 'publisher8.com', 'Publisher8 Street', 'Toronto', 'ON', 'M4C1A1'),
	(9, 'publisher9', 12345678919, 'publisher1@gmail.com', 'publisher9.com', 'Publisher9 Street', 'Toronto', 'ON', 'M4C1A1'),
	(10, 'Bloomsburry Publishing', 20191817161, 'blooms@gmail.com', 'Bloomsburry.com', 'Publisher1 Street', 'Toronto', 'ON', 'NAC24R');
	

insert into branch (branch_id, publisher_id, name, branch_manager, branch_manager_email, head_office_id, phone_number, address, province, postal_code)
values
	(1, 10, 'First Branch', 'Donald Trump', 'donald.trump@gmail.com', 0, 12345678910, 'First Branch Street', 'ON', 'A5D2B2'),
	(2, 10, 'Second Branch', 'Melania Trump', 'melania.trump@gmail.com', 0, 12345678910, 'Second Branch Street', 'ON', 'A5D2B2'),
	(3, 10, 'Third Branch', 'Trump Jr', 'junior.trump@gmail.com', 0, 12345678910, 'Third Branch Street', 'ON', 'A5D2B2'),
	(4, 10, 'Fourth Branch', 'Ivanka Trump', 'ivanka.trump@gmail.com', 1, 12345678910, 'Foruth Branch Street', 'ON', 'A5D2B2'),
	(5, 1, 'Branch1', 'Manager1', 'manager1@gmail.com', 0, 12345678910, 'Branch1 Street', 'ON', 'M4C1A1'),
	(6, 4, 'Branch2', 'Manager2', 'manager2@gmail.com', 0, 12345678910, 'Branch2 Street', 'ON', 'M4C1A1'),
	(7, 6, 'Branch3', 'Manager3', 'manager3@gmail.com', 0, 12345678910, 'Branch3 Street', 'ON', 'M4C1A1'),
	(8, 5, 'Branch4', 'Manager4', 'manager4@gmail.com', 0, 12345678910, 'Branch4 Street', 'ON', 'M4C1A1'),
	(9, 2, 'Branch5', 'Manager5', 'manager5@gmail.com', 0, 12345678910, 'Branch5 Street', 'ON', 'M4C1A1'),
	(10, 3, 'Branch6', 'Manager6', 'manager6@gmail.com', 0, 12345678910, 'Branch6 Street', 'ON', 'M4C1A1');


insert into book (isbn, title, author, author_id, subject, publisher_id, cost_price, sell_price, quantity_on_hand, sold_per_year)
values
	('9780807281918', 'Harry Potter and the Chamber of Secrets','Rowling', 1, 'Novel', 1, 19.8, 22.5, 20 , 500),
    ('9780140447934', 'War and Peace','Tolstoy', 2, 'Novel', 2, 17, 20.99,  15  , 400),
    ('9780140707342', 'Hamlet','Shakespeare', 3, 'Tragic Novel', 3, 18, 20,  20 , 800),
    ('9781400156337', 'Pride and Prejudice','Austen', 4, 'Romantic Novel', 4, 51, 58.46,  30 , 184),
    ('9781551117584', 'Oliver Twist', 'Dickens', 5, 'Novel', 5, 10, 12, 0  , 870),
    ('9781119320913', 'Operating Systems Concepts','Silberschatz', 6, 'Computer Education', 6, 100, 120,  0 , 100),
    ('9781260548006', 'Software Engineering a practitioners Approach', 'Pressman', 7, 'Computer Science', 7, 84.24, 90.24, 125 , 1250),
    ('9781400136315', 'The Adventures Of Huckleberry Finn', 'Twiain', 8, 'American Literature', 8, 113.5, 120, 5  , 899),
    ('9781600242304', 'The Quickie','Patterson', 9, 'Novel', 9, 15.5, 18,  160  , 1500),
    ('9781405032735', 'Murder on the Orient Express','Christie', 10, 'Novel', 10, 85, 90,  2  , 401),
    ('9781478902089', 'Along Came A Spider', 'Christie', 10, 'Novel', 10, 60.23, 65.23, 200  , 0),
    ('5110737231234', 'Real Genius', 'Christie', 10, 'mystery', 10,  12.00, 26.00 , 7, 98);
	
	
insert into inventory (bookstore_id, isbn, quantity_on_hand)
values
	(1, '9780807281918', 40),
	(1, '9780140447934', 21),
	(1, '9780140707342', 0),
	(1, '9781400156337', 27),
	(1, '9781551117584', 20),
	(1, '9781119320913', 32),
	(1, '9781260548006', 15),
	(1, '9781400136315', 21),
	(1, '9781600242304', 22),
	(1, '9781405032735', 19),
	(1, '9781478902089', 20),
	(1, '5110737231234', 30);


insert into book_branch (isbn, branch_id, inventory)
values
	('9780807281918', 1, 0),
	('9780140447934', 2, 15),
	('9780140707342', 3, 20),
	('9781400156337', 4, 25),
	('9781551117584', 5, 30),
	('9781119320913', 6, 35),
	('9781260548006', 7, 40),
	('9781400136315', 8, 45),
	('9781600242304', 9, 50),
	('9781405032735', 10, 55),
	('9781478902089', 10, 60),
	('5110737231234', 10, 65);


insert into orders (order_id, order_date, isbn, quantity_ordered, publisher_id, branch_id)
values
	(1, "2020-01-15", '9780807281918', 1, 1, 1),
	(2, "2020-02-16", '9780140447934', 2, 2, 2),
	(3, "2020-03-17", '9780140707342', 3, 3, 3),
	(4, "2020-04-18", '9781400156337', 4, 4, 4),
	(5, "2020-05-19", '9781551117584', 5, 5, 5),
	(6, "2020-06-20", '9781119320913', 6, 6, 6),
	(7, "2020-07-21", '9781260548006', 7, 7, 7),
	(8, "2020-08-22", '9781400136315', 8, 8, 8),
	(9, "2020-09-23", '9781405032735', 9, 9, 9),
	(10, "2020-10-24", '9781405032735', 10, 10, 10);


insert into order_details (details_id, isbn, quantity, price, customer_id, bookstore_id, order_date)
values
	(1, '9780807281918', 1, 19.8, 1, 1, "2020-01-15"),
	(2, '9780140447934', 2, 17, 2, 1, "2020-02-16"),
	(3, '9780140707342', 3, 18, 8, 1, "2020-03-17"),
	(4, '9781400156337', 4, 51, 4, 1,"2020-04-18"),
	(5, '9781551117584', 5, 10, 5, 1, "2020-05-19"),
	(6, '9781119320913', 6, 100, 6, 1, "2020-06-20"),
	(7, '9781260548006', 7, 84.2, 7, 1, "2020-07-21"),
	(8, '9781260548006', 7, 84.2, 8, 1, "2020-08-22"),
	(9, '9781405032735', 9, 15.5, 9, 1, "2020-09-23"),
	(10, '9781405032735', 10, 60.23, 10, 1, "2020-10-24");
	
	


	