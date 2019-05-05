/*Query: List the names of students, their apartment number, and their bedroom number renting an apartment at 1678 Cardiff Rd.*/
select s.fName, s.lName, r.roomNo, l.dateFrom, l.duration
from Student s, Room r, Lease l, Flat f
where r.residenceNo= f.residenceNo and f.fAddress = '1678 Cardiff Rd' and l.bannerNo=s.bannerNo and l.placeNo=r.placeNo and current_date() < date_add(l.dateFrom, interval l.duration*4 month) ;

/*Query B.1.2*/
/*a. Present a report listing the Manager’s name and telephone number for each hall of residence.*/
select  s.fname, s.lname, h.hphoneNo, h.hName
from Staff s, Hall h
where h.staffNo = s.staffNo;

/*b. Present a report listing the names and banner numbers of students with the details of their lease agreements.*/
select s.fName, s.lName, l.*, r.roomNo, a.address
from Student s, Lease l, Room r, ((select residenceNo, hAddress as address from Hall) union (select residenceNo, fAddress as address from Flat)) as a
where s.bannerNo=l.bannerNo and l.placeNo=r.placeNo and a.residenceNo=r.residenceNo
order by s.lName;

/*c. Display the details of lease agreements that include the summer semester*/
select s.fName, s.lName, l.*, r.roomNo, a.address
from Lease l, Student s, Room r, ((select residenceNo, hAddress as address from Hall) union (select residenceNo, fAddress as address from Flat)) as a
where duration=3 and s.bannerNo=l.bannerNo and l.placeNo=r.placeNo and a.residenceNo=r.residenceNo;

/*d. Display the details of the total rent paid by a given student, like zhihua zhang*/
select s.fname, s.lname, sum(4*r.rentRate) as totalRent
from Student s, Invoice i, Room r
where s.bannerNo = i.bannerNo and r.placeNo = i.placeNo and s.fname='zhihua' and s.lname='zhang';

/*e Present a report on students who have not paid their invoices by a given date, like '2017-08-20'*/
select s.fName, s.lName, i.*
from Student s, Invoice i
where s.bannerNo = i.bannerNo and (i.payDate > '2017-08-20' or i.payDate=NULL);

/*f Display the details of apartment inspections where the property was found to be in an unsatisfactory condition*/
select s.fName, s.Lname, i.*
from Inspection i, Staff s
where condi='no' and s.staffNo=i.staffNo;

/*g Present a report of the names and banner numbers of students with their room number and place number in a particular hall of residence. like 'Bates Runner Hall'*/
select s.fName, s.lName, r.placeNo, r.roomNo
from  Room r, Student s, Lease l
where s.bannerNo=l.bannerNo and r.residenceNo=(select residenceNo from Hall where hName='Bates Runner Hall') and l.placeNo=r.placeNo;

/*h Present a report listing the details of all students currently on the waiting list for accommodation; that is; who were not placed */
select * 
from Student 
where status='waiting';

/*i Display the total number of students in each student category  */
select category, count(*) as number
from Student
group by category;


/*j Present a report of the names and banner numbers for all students who have not supplied details of their next-of-kin */
select * 
from Student s
where s.bannerNo not in (select bannerNo from NOK);

/*k Display the name and internal telephone number of the Adviser for a particular student, like zhihua zhang*/
select a.aName, a.aphoneNo
from Student s, Advisor a
where s.fName='zhihua' and s.lName='zhang' and a.advisorNo=s.advisorNo;

/*l  Display the minimum, maximum, and average monthly rent for rooms in residence halls*/
select r.residenceNo, max(rentRate), min(rentRate), avg(rentRate)
from Room r, Hall h
where h.residenceNo=r.residenceNo
group by r.residenceNo;

/*m Display the total number of places in each residence hall */
select r. residenceNo, count(r.placeNo)
from Room r, Hall h
where h.residenceNo=r.residenceNo
group by r.residenceNo;

/*n  Display the staff number, name, age, and current location of all members of the residence staff who are over 60 years old today*/
select staffNo, fName, lName, TIMESTAMPDIFF(YEAR, dateofBirth, CURDATE()) AS age, location
from Staff
where date_add(dateofBirth, interval 60 year) <= current_date();


