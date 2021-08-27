
use careerportal;

-- i.	Create/Delete/Edit/Display an Employer.

-- Create Employer
insert into users
(userID, planID, email, passwords, dateCreated, isActive, balance, isAutomatic)
values
("Albert", 4, "Albert@create-user.net", "password", "2021-08-13", FALSE, 0, TRUE);
-- Note: planID (from subscription plans table) determines the user_type = "employer", where planID = 4 or 5 are employers

-- Edit Employer
update users
set email = "albert@edit-query.com"
where userID = "Albert";

-- Delete Employer
delete from users
where userID = "Albert";



-- ii.	Create/Delete/Edit/Display a category by an Employer. 

-- Create a category
insert into Employer_Categories
(userID, categoryName)
values
("Albert", "Physicist");
-- Note: "Employer Albert" has be to created from query 1

-- Edit a category
update Employer_Categories
set categoryName = "Math User"
where userID = "Albert";

-- Delete a category
delete from Employer_Categories
where userID = "Albert" and categoryName = "Math User";




-- iii.	Post a new job by an employer.

insert into Jobs
(userID, locationID, title, salary, description, positionsAvailable, status)
values
("User_10", 3, "Main Project Creator", 10000, "Must be able to get 100% on our Project", 1, "Active");
-- Note: "User_10" is an employer already created in the User-Table



-- iv.	Provide a job offer for an employee by an employer.

update Applications
set isAcceptedByEmployer = 1
where jobID = 5 and userID = "User_2";
-- Note: User_2 is an employer that has previously created a jobID "5"



-- v.	Report of a posted job by an employer (Job title and description, date posted, 
-- list of employees applied to the job and status of each application).

select jobs.title, jobs.description, jobs.datePosted as `date posted`, 
		Applications.userID as "Applicant name", jobs.status, 
		applications.isAcceptedByEmployee, applications.isAcceptedByEmployer
from Jobs, Applications
where jobs.jobID = Applications.jobID and jobs.jobID = 2;
-- Note: 1 (True) means application is accepted by either employee or employer



-- vi.	Report of posted jobs by an employer during a specific period of time 
-- (Job title, date posted, short description of the job up to 50 characters, number of needed employees to the post, 
-- number of applied jobs to the post, number of accepted offers).

select jobs.title, jobs.datePosted as `date posted`, substring(jobs.description, 1, 10) as "10-char description", jobs.positionsAvailable,
count(applications.userID) as "Total Applications", applications.isAcceptedByEmployer
from Jobs
left join applications on jobs.jobID = applications.jobID 
where jobs.userID = "User_12" and jobs.datePosted between "2020-08-07" and "2022-08-07"
group by jobs.jobID; 	
-- Note: Since none of our data is over 50 characters, we decided to shorten the example by replacing 50 with 10.


-- vii.	Create/Delete/Edit/Display an Employee.

-- Create Employee	
insert into users
(userID, planID, email, passwords, dateCreated, isActive, balance, isAutomatic)
values
("Einstein", 3, "Einstein@create-employee.net", "password", "2021-08-13", FALSE, 0, TRUE);
-- Note: planID (from subscription plans table) determines the user_type = "employee", where planID = 1, 2 or 3 are employees	

-- Edit Employee
update users
set email = "Einstein@edit-employee.com"
where userID = "Einstein";

-- Display Employee
select *
from users
where userID = "Einstein";

-- Delete Employee
delete from users 
where userID = "Einstein";


-- viii.	Search for a job by an employee.

select jobs.title, jobs.salary, jobs.description, jobs.positionsAvailable, jobs.datePosted, jobs.status, 
		location.city, profiles.userID as "Employer", profiles.companyName as "Hiring Company"
from jobs, location, profiles, Users
where jobs.locationID = location.locationID 
		and jobs.userID = profiles.userID 
		and jobs.userID = users.userID
		and jobs.status = 'active' 
		and lower(jobs.title) like lower('%Developer%');
-- Note: Developer can be replaced by whatever the employee is looking for like profiles.companyName for specific company


-- ix.	Apply for a job by an employee.

insert into applications 
(jobID, userID)
values
(5, "Albert");
-- Note: Job description/details will be read by the employee prior to being inserted into the applications table.


-- x.	Accept/Deny a job offer by an employee.

update applications  
set isAcceptedByEmployee = true -- Accept Job Offer
where jobID = 5 and userID = "Albert";
-- Line 2 will be False for Deny job offer


-- xi.	Withdraw from an applied job by an employee.

delete from applications 
where userID = "Albert" and jobID = 5;
-- Removing the same application as previous query


-- xii.	Delete a profile by an employee.

delete from profiles 
where userID = "User_5"
-- Note: User_5 is created from previous query.

-- xiii.	Report of applied jobs by an employee during a specific period of time 
-- (Job title, date applied, short description of the job up to 50 characters, status of the application).

select jobs.title, applications.dateApplied, substring(jobs.description, 1, 10) as "10-char description", 
		applications.dateApplied,  applications.isAcceptedByEmployer, applications.isAcceptedByEmployee 
from applications left join Jobs on jobs.jobID = applications.jobID 
where jobs.userID = "User_10" and jobs.datePosted between "2020-08-07" and "2022-08-07"
group by jobs.jobID; 	
-- Note: Since none of our data is over 50 characters, we decided to shorten the example 
-- by replacing 50 with 10.

-- xiv.	Add/Delete/Edit a method of payment by a user.

-- Add payment
insert into payment_methods 
(userID, cardNumber, paymentType, isPreSelected)
values
("Albert", 123456789, "debit", false);
-- Note: Albert is used from previous queries

-- Edit Payment
update payment_methods 
set paymentType = "credit"
where userID = "Albert";

-- EdDelete Payment
delete from payment_methods 
where userID = "Albert";


-- xv.	Add/Delete/Edit an automatic payment by a user.

-- Add automatic payment
insert into payment_methods 
(userID, isPreSelected, cardNumber, paymentType)
values
("Albert", 1, 1234, "credit");
-- isPreSelected means a monthly charge

-- Edit automatic payment
update payment_methods 
set isPreSelected = false 
where userID = "Albert" and cardNumber = 1234;

-- Delete automatic payment
delete from payment_methods 
where userID = "Albert";

-- xvi.	Make a manual payment by a user.
insert into payments 
(paymentMethodID, amount)
values
(2, 30);
-- Note: The paymentMethodID is used to track down the user
-- making the payment along with the mode of payment

-- xvii.Report of all users by the administrator for employers or employees (Name, email, category, status, balance.
select profiles.firstName, profiles.lastName, users.email, plans.name as "category", users.isActive as "Status", users.balance 
from profiles, users, plans
where users.planID = plans.planID and users.userID = profiles.userID 
		and plans.userType != "admin";
-- Note: 0 status means inactive
	
-- xviii.Report of all outstanding balance accounts 
-- (User name, email, balance, since when the account is suffering).
select userID, email, balance, startSufferingDate
from users
where balance < 0;

