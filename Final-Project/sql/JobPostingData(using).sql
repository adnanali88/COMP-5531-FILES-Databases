

use careerportal;

INSERT INTO Plans
	(name, price, applyLimit, postLimit, userType)
VALUES 
	("Employee Basic", 0, 0, 0, "employee"), -- 1
    ("Employee Prime", 10, 5, 0, "employee"), -- 2 
    ("Employee Gold", 20, NULL, 0, "employee"), -- 3
    ("Employer Prime", 50, 0, 5, "employer"), -- 4
    ("Employer Gold", 100, 0, NULL, "employer"), -- 5
    ("Admin", 0, 0, 0, "admin"); -- 6

INSERT INTO Users 
	(userID, planID, email, passwords, dateCreated, isActive, balance, isAutomatic)
VALUES 
	("User_1", 1, "User1@example.net", "password", "2021-01-15", TRUE, 0, TRUE), 
    ("User_2", 2, "User2@example.net", "password", "2021-02-15", TRUE, 10, FALSE),
    ("User_3", 2, "User3@example.net", "password", "2020-12-15", TRUE, 0, TRUE),
    ("User_4", 3, "User4@example.net", "password", "2021-03-15", TRUE, 10, FALSE),
    ("User_5", 4, "User5@example.net", "password", "2021-04-15", FALSE, 0, TRUE),
    ("User_6", 5, "User6@example.net", "password", "2021-05-15", TRUE, -100, FALSE),
    ("User_7", 6, "User_7@example.net", "password", "2021-06-15", TRUE, 0, TRUE),
    ("User_8", 1, "User_8@example.net", "password", "2020-06-15", TRUE, -50, TRUE),
    ("User_9", 4, "User_9@example.net", "password", "2020-06-15", FALSE, 50, TRUE),
    ("User_10", 5, "User_10@example.net", "password", "2020-06-15", FALSE, 50, TRUE),
    ("User_11", 4, "User_11@example.net", "password", "2020-06-15", FALSE, 10, TRUE),
    ("User_12", 4, "User_12@example.net", "password", "2021-01-14", TRUE, 0, TRUE),
    ("tyson", 2, "tyson@example.net", "password", "2021-03-15", TRUE, -10, TRUE),
    ("chris", 5, "chris@example.net", "password", "2021-08-07", TRUE, 0, TRUE);

INSERT INTO Job_Categories_List 
	(jobCategoriesID, categoryName)
VALUES 
	(8, "Angular"),
    (3, "Business"),
    (5, "Database"),
    (1, "Finance"),
    (4, "Information Technology"),
    (7, "React"),
    (6, "System Engineering"),
    (2, "Technology");

INSERT INTO Payment_Methods 
	(paymentMethodID, userID, isPreSelected, paymentType, cardNumber)
VALUES 
	(1, "User_1", 1, "debit", 1234),
    (2, "User_2", 1, "credit", 1234),
    (3, "User_2", 0, "credit", 1234),
    (4, "User_4", 1, "credit", 1234),
    (5, "User_5", 1, "debit", 1234),
    (6, "User_6", 1, "credit", 1234),
    (7, "tyson", 1, "debit", 1234),
    (8, "User_8", 1, "credit", 1234),
    (9, "User_9", 1, "debit", 1234),
    (10, "User_10", 1, "debit", 1234),
    (11, "User_11", 1, "credit", 1234),
    (12, "User_3", 1, "credit", 1234),
    (13, "User_1", 0, "credit", 1234),
    (14, "tyson", 0, "credit", 1234),
    (15, "User_5", 0, "credit", 1234),
    (16, "User_5", 0, "credit", 1234),
    (17, "User_2", 0, "credit", 1234),
    (18, "User_5", 0, "credit", 1234);

INSERT INTO Location 
	(locationID, address, city, postalCode, province)
VALUES 
	(1, "123 Maple", "Brossard", "J4Y 1G6", "Quebec"),
    (2, "456 Oak", "Laval", "J8X 1J7", "Quebec"),
    (3, "789 Palm", "Toronto", "B7S 8H6", "Ontario"),
    (4, "9193 Rainbow Road", "Burlington", "1001", "Vermont"),
    (5, "52 Bowser Castle", "Los Angeles", "2002", "California"),
    (6, "3269  Brew Creek Rd", "North Pender Island", "V0N 2M1", "British Columbia"),
    (7, "1046  Scotts Lane", "Cobble Hill", "V0R 1L1", "British Columbia"),
    (8, "3719  Toy Avenue", "Pickering", "L1S 6L6", "Ontario"),
    (9, "4470  rue des Églises Est", "Ile Perrot", "J0P 1K0", "Quebec"),
    (10, "Downtown", "Montreal", "H1L 5H3", "Quebec"),
    (11, "Downtown", "Montreal", "H1L 5H3", "Qc"),
    (12, "Downtown", "Montreal", "H1L 5H3", "Qc");

INSERT INTO Jobs 
	(jobID, userID, locationID, title, salary, description, positionsAvailable, datePosted, status)
VALUES 
	(1, "User_5", 1, "Software Developer", 85000, "Must have 15 years of experience in PHP", 3, "2021-07-15", "active"),
    (2, "User_6", 2, "Human Resources", 120000, "Must have 20 years experience at any company", 1, "2021-08-02", "active"),
    (3, "User_9", 3, "IT Help Desk", 60000, "Required Skills: Java, mySQL", 1, "2021-08-13", "expired"),
    (4, "User_10", 4, "Business Analyst", 85000, "Requirements: Bachelors in Business", 5, "2021-07-15", "expired"),
    (5, "User_10", 4, "Software Developer", 90000, "Must know C++", 3, "2021-07-15", "active"),
    (6, "User_11", 5, "Database Administrator", 60000, "Looking for McGill students only", 1, "2021-07-06", "active"),
    (7, "User_12", 6, "Python Developer", 80000, "Must know snakes", 5, "2021-08-01", "active"),
    (8, "User_12", 7, "Java Developer", 60000, "Must like coffee", 2, "2021-08-02", "active"),
    (9, "User_12", 8, "JavaScript Developer", 70000, "Must know all frameworks", 8, "2021-08-03", "active"),
    (10, "User_12", 9, "Rust Developer", 85000, "We will ask about metals", 3, "2021-08-04", "active"),
    (12, "User_12", 11, "Software Developer", 100000, "Work on Angular apps", 4, "2021-08-07", "active");

INSERT INTO Profiles
	(userID, locationID, companyName, firstName, lastName, profession, gender, phoneNumber)
VALUES 
	("User_5", 1, "Concordia Diploma", "User", "5", "Senior Developer", "Male", "123-456-7890"),
    ("User_6", 2, "Grey's Anatomy", "User", "6", "Doctor", "Male", "123-456-7890"),
    ("User_9", 3, "Law & Order", "User", "9.", "Lawyer", "Male", "123-456-7890"),
    ("User_10", 4, "Eminem Industry", "User", "10", "Singer", "Male", "123-456-7890"),
    ("User_12", 9, "Dr.Dre Industry", "User", "12", "Dancer", "Male", "123-456-7890"),
    ("User_11", 5, "BP Oils", "User", "11", "Engineer", "Female", "123-456-7890")
ON DUPLICATE KEY UPDATE 
	locationID = VALUES(locationID),
    companyName = VALUES(companyName),
    firstName = VALUES(firstName),
    lastName = VALUES(lastName),
    profession = VALUES(profession),
    gender = VALUES(gender),
    phoneNumber = VALUES(phoneNumber);

INSERT INTO Job_Categories 
	(jobID, jobCategoryID)
VALUES 
	(1, 2),
    (2, 1),
    (3, 4),
    (4, 3),
    (5, 2),
    (6, 6),
    (7, 2),
    (8, 2),
    (9, 2),
    (10, 2),
    (12, 8);

INSERT INTO Applications 
	(jobID, userID, dateApplied, isAcceptedByEmployer, isAcceptedByEmployee)
VALUES 
	(1,"User_2", "2021-08-06", 1, NULL),
    (2,"User_2", "2021-08-06", NULL, NULL),
    (3,"User_2", "2021-08-06", NULL, NULL),
    (4,"User_2", "2021-08-06", NULL, NULL),
    (5,"User_2", "2021-08-06", NULL, NULL),
    (2,"User_3", "2021-08-07", NULL, NULL),
    (2,"User_4", "2021-08-07", NULL, NULL),
    (2,"tyson", "2021-08-07", 1, 1);

INSERT INTO Employer_Categories 
	(employerCategoryID, userID, categoryName)
VALUES 
	(1,"User_5", "Science"),
    (2,"User_6", "Stocks"),
    (3,"User_9", "Design"),
    (4,"User_10", "Music"),
    (5,"User_11", "Music"),
    (6,"User_12", "Software"),
    (13,"chris", "Entertainment")
ON DUPLICATE KEY UPDATE 
	categoryName = VALUES(categoryName);

