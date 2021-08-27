

use careerportal;

SET FOREIGN_KEY_CHECKS=0; -- to disable them
DROP TABLE IF EXISTS Location;
DROP TABLE IF EXISTS Plans;
DROP TABLE IF EXISTS Users;
DROP TABLE IF EXISTS Profiles;
DROP TABLE IF EXISTS Jobs;
DROP TABLE IF EXISTS Payment_Methods;
DROP TABLE IF EXISTS Payments;
DROP TABLE IF EXISTS Applications;
DROP TABLE IF EXISTS Job_Categories_List;
DROP TABLE IF EXISTS Job_Categories;
DROP TABLE IF EXISTS Emails;
DROP TABLE IF EXISTS Employer_Categories;
SET FOREIGN_KEY_CHECKS=1; -- to re-enable them


CREATE TABLE Location
(
    locationID int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    address varchar(255),
    city varchar(255),
    postalCode varchar(255),
    province varchar(255)
);

CREATE TABLE Plans
(
    planID int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name varchar(255) NOT NULL,
    price int NOT NULL,
    applyLimit int,
    postLimit int,
    userType enum ("admin","employer", "employee") NOT NULL DEFAULT 'employee'
);

CREATE TABLE Users
(
    userNumber int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    userID varchar(255) NOT NULL UNIQUE,
    planID int,
    email varchar(255) NOT NULL UNIQUE,
    passwords varchar(255) NOT NULL,
    dateCreated DATE NOT NULL DEFAULT CURRENT_DATE,
    isActive boolean NOT NULL DEFAULT TRUE,
    startSufferingDate DATE,
    balance int NOT NULL DEFAULT 0,
    isAutomatic boolean NOT NULL DEFAULT TRUE,
    FOREIGN KEY (planID) REFERENCES Plans (planID)
);

CREATE TABLE Profiles
(
    userID varchar(255) NOT NULL PRIMARY KEY,
    locationID int,
    companyName varchar(255),
    firstName varchar(255),
    lastName varchar(255),
    profession varchar(255),
    gender varchar(255),
    phoneNumber varchar(255),
    FOREIGN KEY (userID) REFERENCES Users (userID) ON DELETE CASCADE,
    FOREIGN KEY (locationID) REFERENCES Location (locationID)
);

CREATE TABLE Jobs
(
    jobID int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    userID varchar(255) NOT NULL,
    locationID int NOT NULL,
    title varchar(255) NOT NULL,
    salary int NOT NULL,
    description varchar(255),
    positionsAvailable smallint NOT NULL,
    datePosted DATE NOT NULL DEFAULT CURRENT_DATE,
    status enum ("active", "expired") DEFAULT "active",
    FOREIGN KEY (userID) REFERENCES Users (userID) ON DELETE CASCADE,
    FOREIGN KEY (locationID) REFERENCES Location (locationID)
);

CREATE TABLE Payment_Methods
(
    paymentMethodID int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    userID varchar(255) NOT NULL,
    isPreSelected boolean NOT NULL,
    paymentType enum ("credit", "debit") NOT NULL,
    cardNumber int NOT NULL,
    FOREIGN KEY (userID) REFERENCES Users (userID) ON DELETE CASCADE
);

CREATE TABLE Payments
(
    transactionID int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    paymentMethodID int NOT NULL,
    amount int NOT NULL,
    paymentDate DATE NOT NULL DEFAULT CURRENT_DATE,
    FOREIGN KEY (paymentMethodID) REFERENCES Payment_Methods (paymentMethodID) ON DELETE CASCADE
);

CREATE TABLE Applications
(
    jobID int NOT NULL,
    userID varchar(255) NOT NULL,
    dateApplied DATE NOT NULL DEFAULT CURRENT_DATE,
    isAcceptedByEmployer boolean DEFAULT NULL,
    isAcceptedByEmployee boolean DEFAULT NULL,
    FOREIGN KEY (userID) REFERENCES Users (userID) ON DELETE CASCADE,
    FOREIGN KEY (jobID) REFERENCES Jobs (jobID) ON DELETE CASCADE
);

CREATE TABLE Job_Categories_List
(
    jobCategoriesID int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    categoryName varchar(255) NOT NULL UNIQUE
);

CREATE TABLE Job_Categories
(
    jobID int NOT NULL,
    jobCategoryID int NOT NULL,
    FOREIGN KEY (jobcategoryID) REFERENCES Job_Categories_List (jobCategoriesID),
    FOREIGN KEY (jobID) REFERENCES Jobs (jobID) ON DELETE CASCADE
);

CREATE TABLE Emails
(
    emailID int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    userID varchar(255) NOT NULL,
    emailBody varchar(255) NOT NULL,
    dateSent DATE NOT NULL DEFAULT CURRENT_DATE,
    FOREIGN KEY (userID) REFERENCES Users (userID) ON DELETE CASCADE
);

CREATE TABLE Employer_Categories
(
    employerCategoryID int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    userID varchar(255) UNIQUE NOT NULL,
    categoryName varchar(255) NOT NULL,
    FOREIGN KEY (userID) REFERENCES Users (userID) ON DELETE CASCADE
);