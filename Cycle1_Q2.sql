create table DEPARTMENT(
 DNO int primary key NOT NULL,
 DNAME varchar(50),
 D_HOD varchar(50)
);
create table EMPLOYEE(
 ENO int primary key NOT NULL AUTO_INCREMENT,
 ENAME varchar(55) NOT NULL,
 SALARY int NOT NULL,
 DNO int,
 FOREIGN KEY (DNO) REFERENCES DEPARTMENT(DNO),
 MNGRNO int,
 DOJ DATE NOT NULL,
 JOB varchar(55),
 ADDRESS varchar(255),
 CITY ENUM('KOCHI','MUMBAI','CHENNAI'),
 PINCODE int
);
ALTER TABLE EMPLOYEE AUTO_INCREMENT=100;
insert into DEPARTMENT( DNO, DNAME, D_HOD)
values (10, 'HR', 'Toby'),(20, 'Sales', 'Dwight'),(30,'Account','Angela'),(40,'Tax','Kevin');

insert into EMPLOYEE (ENAME, SALARY, DNO, MNGRNO, DOJ, JOB, ADDRESS, CITY, PINCODE) values
("Janvi Gupta",11000,10,NULL,"2002-11-2","Clerk","Ambala","Mumbai",400022),
("Juke Guy",10000,30,NULL,"2000-11-2","Worker","South Kalamessary","KOCHI",600022),
("Sritabh Priyadarshi",10000,30,NULL,"1999-10-2","Worker","South Kalamessary","KOCHI",600022),
("Utkrisht Pathak",9000,20,NULL,"2000-11-4","Clerk","Dadar Nagar","MUMBAI",400012),
("Timothy Alex",15000,40,NULL,"1997-11-4","Worker","Anna Nagar","CHENNAI",600012),
("Anusha Maiti",7000,30,122,"2000-1-12","Manager","Navi Mumbai","MUMBAI",400112),
("Revanth",6000,10,NULL,"1997-11-4","Clerk","Nijam Nagar","MUMBAI",400102),
("Johnson",8000,40,NULL,"2000-11-14","Worker","Anna Nagar","CHENNAI",600012),
("Sruthi Nair",9000,20,121,"2001-1-2","Manager","Mahali Nagar","MUMBAI",400112),
("Nisha Pathak",11000,20,NULL,"1997-10-4","Clerk","Maveli","MUMBAI",400232),
("Abhishek Randhawa",5000,40,123,"2000-11-4","Manager","Panchal Nagar","CHENNAI",601012),
("Riya",10000,10,120,"2002-11-12","Manager","Navi Nagar","MUMBAI",400136);

SELECT * FROM EMPLOYEE WHERE DOJ>'1998-1-1' AND DNO=10;
select * from EMPLOYEE where DNO!=30;
select ENAME from EMPLOYEE as E, DEPARTMENT as D where E.DNO=D.DNO and D.DNAME = "Sales";
select ENAME from EMPLOYEE where MNGRNO is not NULL;
select * from EMPLOYEE where ENAME like "J_n%";
select * from EMPLOYEE where DOJ>='2000-1-1' and DOJ<='2000-12-31';
SELECT "EVERY YEAR", ENAME,"EARNS", SALARY*12 FROM EMPLOYEE;
SELECT COUNT(ENO) as Total_Employee FROM EMPLOYEE;
SELECT JOB,MIN(SALARY) FROM EMPLOYEE GROUP BY JOB;
SELECT DNO,MIN(SALARY) FROM EMPLOYEE WHERE SALARY>7000 GROUP BY DNO;
SELECT E.DNO,DNAME,MIN(SALARY) FROM EMPLOYEE as E,DEPARTMENT as D WHERE MNGRNO IS NOT NULL and E.DNO=D.DNO GROUP BY E.DNO;
SELECT ENAME, DNAME FROM EMPLOYEE AS E, DEPARTMENT D WHERE E.DNO=D.DNO;
SELECT ENAME, DATE_FORMAT(DOJ, "%d/%m/%Y") AS DATE FROM EMPLOYEE;
UPDATE EMPLOYEE SET SALARY=SALARY+10000 WHERE SALARY<7000;
UPDATE EMPLOYEE SET JOB = CONCAT("Senior_",JOB) WHERE SALARY=10000;
DELETE FROM EMPLOYEE WHERE DOJ<'1998-1-1';
DELETE FROM EMPLOYEE WHERE DNO=10 AND JOB="Worker";