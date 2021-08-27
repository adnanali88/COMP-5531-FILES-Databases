use bookstore;

SET FOREIGN_KEY_CHECKS=0; -- Please keep drop table in order
drop table if exists customer;
drop table if exists bookstore;
drop table if exists author;
drop table if exists reader_interest;
drop table if exists publisher;
drop table if exists branch;
drop table if exists book;
drop table if exists inventory;
drop table if exists book_branch;
drop table if exists orders;
drop table if exists order_details;
SET FOREIGN_KEY_CHECKS=1; 

create table customer 
(
	customer_id int not null,
	first_name varchar(20) not null,
	last_name varchar(20) not null,
	email varchar(20) not null,
	phone_number varchar(11) not null,
	address varchar(50) not null,
	city varchar(20) not null,
	postal_code varchar(6) not null,
	province varchar(2) not null,
	total_purchases smallint,
	primary key (customer_id)
);

create table bookstore  
(
	bookstore_id int not null,
	name varchar(20) not null,
	primary key (bookstore_id)
);

create table author
(
	author_id int not null,
	first_name varchar(50),
	last_name varchar(50),
	primary key (author_id)
);

create table reader_interest
(
	customer_id int not null,
	email varchar(20) not null,
	genre varchar(20) not null,
	primary key (email),
	foreign key (customer_id) references customer(customer_id)
);

create table publisher 
(
	publisher_id int not null,
	name varchar(50) not null,
	phone_number varchar(11) not null,
	email varchar (50) not null,
	website varchar(50) not null,
	address varchar (50) not null,
	city varchar (20) not null,
	province varchar (2) not null,
	postal_code varchar(6) not null,
	primary key (publisher_id)
);

create table branch
(
	branch_id int not null,
	publisher_id int not null,
	name varchar(50) not null,
	branch_manager varchar(50) not null,
	branch_manager_email varchar(50) not null,
	head_office_id smallint not null,
	phone_number varchar(11) not null,
	address varchar(50) not null,
	province varchar(2) not null,
	postal_code varchar(6) not null,
	primary key (branch_id),
	foreign key (publisher_id) references publisher(publisher_id)	
);

create table book
(
	isbn varchar(13) not null,
	title varchar (100) not null,
	author varchar (50) not null,
	author_id int not null,
	subject varchar (50) not null,
	publisher_id int not null,
	cost_price decimal (6,2) not null,
	sell_price decimal (6,2) not null,
	quantity_on_hand smallint,
	sold_per_year smallint,
	primary key (isbn),
	foreign key (author_id) references author(author_id),
	foreign key (publisher_id) references publisher(publisher_id)
);

create table inventory
(
	bookstore_id int not null,
	isbn varchar(13) not null,
	quantity_on_hand smallint,
	primary key (bookstore_id, isbn),
	foreign key (bookstore_id) references bookstore(bookstore_id),
	foreign key (isbn) references book(isbn)
);


create table book_branch -- books available in a branch
(	
	isbn varchar(13) not null,
	branch_id int not null,
	inventory int not null,
	primary key (branch_id, isbn),
	foreign key (isbn) references book (isbn),
	foreign key (branch_id) references branch (branch_id)
);

create table orders -- books ordered by publishers
(
	order_id int not null,
	order_date date, -- YYYY-MM-DD
	isbn varchar (13) not null,
	quantity_ordered int not null,
	publisher_id int not null,
	branch_id int not null,
	primary key (order_id),
	foreign key(isbn) references book(isbn),
	foreign key(publisher_id) references publisher(publisher_id),
	foreign key(branch_id) references branch(branch_id)
);

create table order_details  -- books ordered by customers (includes bookstores)
(	
	details_id int not null,
	isbn varchar (13) not null,
	quantity smallint not null,
	price decimal (6,2) not null,
	customer_id int not null,
	bookstore_id int not null,
	order_date date, -- YYYY-MM-DD
	primary key (details_id),
	foreign key (isbn) references book(isbn),
	foreign key (customer_id) references customer(customer_id),
	foreign key (bookstore_id) references bookstore(bookstore_id)
);

