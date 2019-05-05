drop table if exists Student;
drop table if exists Advisor;
drop table if exists Lease;
drop table if exists Flat;
drop table if exists Hall;
drop table if exists Invoice;
drop table if exists Staff;
drop table if exists Inspection;
drop table if exists NOK;
drop table if exists Room;

CREATE TABLE Student(
	bannerNo int(9) NOT NULL,
	fName varchar(30),
	lName varchar(30) ,
	street varchar(30),
	city varchar(30),
	postcode int(5),
	sphoneNo varchar(15),
	email varchar(20),
	dateofBirth date,
	gender varchar(6) CHECK (VALUE IN ('Female', 'Male')),
	category varchar(30),
	nationality varchar(30),
	specialNeeds varchar(100),
	additionalComment varchar(100),
	status varchar(8) CHECK (VALUE IN ('placed', 'waiting')),
	major varchar(30),
	minor varchar(30),
    advisorNo int(4) NOT NULL
);

CREATE TABLE Advisor(
	advisorNo int(4) NOT NULL,
	aName varchar(30),
	aposition varchar(30),
	department varchar(30),
	aphoneNo varchar(15),
	email varchar(20),
	aroomNo int(4)
);

CREATE TABLE Hall(
	hallNo int(9) NOT NULL,
	hName varchar(30),
	hAddress varchar(100),
	hphoneNo varchar(15),
	staffNo int(9) NOT NULL,
    residenceNo int(9) NOT NULL
);

CREATE TABLE Flat(
	flatNo int(9) NOT NULL,
	fAddress varchar(100),
	numRoom int(3),
	residenceNo int(9) NOT NULL
);

CREATE TABLE Room(
	placeNo int(4) NOT NULL,
	roomNo int(4) NOT NULL,
	rentRate int(5),
	residenceNo int(9) NOT NULL
);

CREATE TABLE Lease(
	leaseNo int(9) NOT NULL,
	duration int(1) CHECK (VALUE BETWEEN 1 AND 3),
	bannerNo int(9) NOT NULL,
	placeNo int(4) NOT NULL,
	dateFrom date,
	dateTo date
);

CREATE TABLE Invoice(
	invoiceNo int(9) NOT NULL,
	semester varchar(10) CHECK (VALUE IN ('Fall', 'Spring','Summer')),
	paymentDue date,
	bannerNo int(9) NOT NULL,
	placeNo int(4) NOT NULL,
	payDate Date,
	payMethod varchar(10),
	firstReminderDate date,
	secondReminderDate date,
	leaseNo int(9) NOT NULL
);

CREATE TABLE Staff(
	staffNo int(9) NOT NULL,
	fName varchar(30),
	lName varchar(30),
	email varchar(30),
	street varchar(30),
	city varchar(30),
	postcode int(5),
	dateofBirth date,
	gender  varchar(6) CHECK (VALUE IN ('Female', 'Male')),
	sposition varchar(30),
	location varchar(30)
);

CREATE TABLE Inspection(
	staffNo int(4) NOT NULL,
	dateofInspection date,
	condi  varchar(6) CHECK (VALUE IN ('yes', 'no')),
	additionalComment varchar(100),
	flatNo int(9) NOT NULL
);

CREATE TABLE NOK(
	kinNo int(9) NOT NULL,
	kName varchar(30),
	relationship varchar(30),
	street varchar(30),
	city varchar(30),
	postcode int(5),
	kphoneNo varchar(15),
	bannerNo int(9) NOT NULL
);





