

use test;

-- i.	Get details of all books in stock.
select *
from book
where quantity_on_hand > 0;

-- ii.	Get details of all back orders. 
select orders.*
from orders
where 
	branch_id in 
				(select branch_id 
				from book_branch
				where inventory = 0);

-- iii.	For a given customer, get details of all his/her back orders.
select order_details.*
from order_details
where 
	order_details.isbn = '9780807281918'; -- took book from answer (ii) as it was in backorder

-- iv.	For a given customer, get details of all his/her purchases made during a specific period of time.
select customer.first_name, customer.last_name, order_details.*
from order_details, customer
where order_details.customer_id = customer.customer_id 
	and order_details.order_date between "2020-01-15" and "2020-09-23"
	and order_details.customer_id = 8;

-- v.	Give a report of sales during a specific period of time.
select book.isbn, orders.quantity_ordered, book.sell_price, book.cost_price, (orders.quantity_ordered * (book.sell_price - book.cost_price)) as profit
from book, orders
where book.isbn = orders.isbn 
	and orders.order_date between "2020-01-15" and "2020-05-19";

-- vi.	Find the title of book(s) that have the highest back-order.
select book.title, (orders.quantity_ordered - inventory.quantity_on_hand) as back_order
from book, orders, order_details, inventory
where book.isbn = orders.isbn 
	and orders.isbn = order_details.isbn 
	and (orders.quantity_ordered - inventory.quantity_on_hand) > 0 
	group by book.title
	order by back_order desc
	limit 1;
 
-- vii.	Give details of books that are supplied by a given publisher.
select book.*
from book, publisher
where book.publisher_id = publisher.publisher_id
	and publisher.publisher_id = 10;

-- viii. For a given publisher, get details of the head office and all the branches for that publisher.
select *
from branch, publisher
where publisher.publisher_id = branch.publisher_id and branch.publisher_id = 10;

-- ix.	Get details of books that are in the inventory but there have never been a purchase for that specific book.
select *
from book
where sold_per_year = 0;

-- x.	Get details of all books that are in the inventory for a given author. 
select book.*
from inventory, author, book
where inventory.isbn = book.isbn 
	and author.author_id = book.author_id
	and author.author_id = 10;
