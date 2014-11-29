
CREATE DATABASE studentreg ;
use studentreg;

CREATE TABLE Professor (Id VARCHAR(20), Pswd VARCHAR(20), Name VARCHAR(20), Status VARCHAR(20));
alter table Professor add PRIMARY KEY(Id);

INSERT INTO Professor VALUES ('alice', 'alice', 'Alice', 'CSE');
INSERT INTO Professor VALUES ('bob', 'bob', 'Bob', 'CSE');
INSERT INTO Professor VALUES ('cindy', 'cindy', 'Cindy', 'CSE');
INSERT INTO Professor VALUES ('david', 'david', 'David', 'CSE');
INSERT INTO Professor VALUES ('eric', 'eric', 'Eric', 'CSE');

CREATE TABLE Course (CrsCode VARCHAR(20), DeptID VARCHAR(20), CrsName VARCHAR(20), InsNo VARCHAR(20));

alter table Course add PRIMARY KEY(CrsCode);
alter table Course add constraint FOREIGN KEY(InsNo) REFERENCES PROFESSOR(Id);

INSERT INTO Course VALUES ('101', 'CSE', 'Algorithms', 'alice');
INSERT INTO Course VALUES ('102', 'CSE', 'Basics', 'bob');
INSERT INTO Course VALUES ('103', 'CSE', 'Cryptography', 'cindy');
INSERT INTO Course VALUES ('104', 'CSE', 'Databases', 'david');
INSERT INTO Course VALUES ('105', 'CSE', 'Engineering', 'eric');


CREATE TABLE Student (Id VARCHAR(20), Pswd VARCHAR(20), Name VARCHAR(20), Status VARCHAR(20));
alter table Student add PRIMARY KEY(Id);
INSERT INTO Student VALUES ('stud1', 'stud1', 'Stud1', 'FRESHMAN');
INSERT INTO Student VALUES ('stud2', 'stud2', 'Stud2', 'FRESHMAN');
INSERT INTO Student VALUES ('stud3', 'stud3', 'Stud3', 'FRESHMAN');
INSERT INTO Student VALUES ('stud4', 'stud4', 'Stud4', 'FRESHMAN');
INSERT INTO Student VALUES ('stud5', 'stud5', 'Stud5', 'FRESHMAN');

CREATE TABLE Transcript (StudId VARCHAR(20), CrsCode VARCHAR(20), Semester VARCHAR(20), Grade VARCHAR(2));
alter TABLE TRANSCRIPT 
ADD constraint FOREIGN KEY(StudId) REFERENCES STUDENT(Id),
 ADD CONSTRAINT FOREIGN KEY(CrsCode) REFERENCES COURSE(CrsCode); 
INSERT INTO TRANSCRIPT VALUES ('stud1','101','1st','B-');
INSERT INTO TRANSCRIPT VALUES ('stud2','102','2nd','B+');
INSERT INTO TRANSCRIPT VALUES ('stud3','103','3rd','A-');
INSERT INTO TRANSCRIPT VALUES ('stud4','104','4th','A+');
INSERT INTO TRANSCRIPT VALUES ('stud5','105','5th','A-');




------------------------------------------------------------------------------------------------------------------

CREATE DATABASE dating;
use dating;

CREATE TABLE Person (SSN CHAR(11), Password CHAR(20), FirstName VARCHAR(50), LastName VARCHAR(50), Street VARCHAR(50), City VARCHAR(50), USState VARCHAR(50), Zipcode INT, Email VARCHAR(100), Telephone VARCHAR(15), PRIMARY KEY (SSN));
CREATE TABLE Employee (SSN CHAR(11), Role VARChAR(50), StartDate DATE, HourlyRate INT, PRIMARY KEY (SSN), FOREIGN KEY (SSN) REFERENCES Person(SSN) ON DELETE CASCADE);
CREATE TABLE User (SSN CHAR(11), PPP VARCHAR(50), Rating INT, DateOfLastAct DATETIME, PRIMARY KEY (SSN), FOREIGN KEY (SSN) REFERENCES Person(SSN) ON DELETE CASCADE);
CREATE TABLE Profile (ProfileID CHAR(20), OwnerSSN CHAR(11), DatingAgeRangeStart INT, DatingAgeRangeEnd INT, DatingGeoRange INT, M_F VARCHAR(10), Hobbies VARCHAR(1000), Height INT, Weight INT, HairColor VARCHAR(20), CreationDate DATETIME NOT NULL, LastModDate DATETIME NOT NULL, PRIMARY KEY (ProfileID), FOREIGN KEY (OwnerSSN) REFERENCES User(SSN) ON DELETE CASCADE);
CREATE TABLE DATE (Profile1 CHAR(20), Profile2 CHAR(20), CustRep CHAR(11), Date_Time DATETIME, Location VARCHAR(100), BookingFee INT, Comments TEXT, User1Rating INT, User2Rating INT, PRIMARY KEY (Profile1, Profile2, Date_Time), FOREIGN KEY (Profile1) REFERENCES Profile(ProfileID) ON DELETE CASCADE, FOREIGN KEY (Profile2) REFERENCES Profile(ProfileID) ON DELETE CASCADE, FOREIGN KEY (CustRep) REFERENCES Employee(SSN) ON DELETE SET NULL);
CREATE TABLE Likes (Liker CHAR(20), Likee Char(20), Date_Time DATETIME, PRIMARY KEY (Liker, Likee, Date_Time), FOREIGN KEY (Liker) REFERENCES Profile(ProfileID) ON DELETE CASCADE, FOREIGN KEY (Likee) REFERENCES Profile(ProfileID) ON DELETE CASCADE);
CREATE TABLE BlindDate (ProfileA CHAR(20), ProfileB CHAR(20), ProfileC CHAR(20), Date_Time DATETIME, PRIMARY KEY (ProfileA, ProfileB, ProfileC, Date_Time), FOREIGN KEY (ProfileA) REFERENCES Profile(ProfileID) ON DELETE CASCADE, FOREIGN KEY (ProfileB) REFERENCES Profile(ProfileID) ON DELETE CASCADE, FOREIGN KEY (ProfileC) REFERENCES Profile(ProfileID) ON DELETE CASCADE);
CREATE TABLE SuggestedBy (CustRep CHAR(11), Profile1 CHAR(20), Profile2 CHAR(20), Date_Time DATETIME, PRIMARY KEY (CustRep, Profile1, Profile2, Date_Time), FOREIGN KEY (Profile1) REFERENCES Profile(ProfileID) ON DELETE CASCADE, FOREIGN KEY Profile2) REFERENCES Profile(ProfileID) ON DELETE CASCADE, FOREIGN KEY (CustRep) REFERENCES Employee(SSN) ON DELETE CASCADE);
CREATE TABLE Account (OwnerSSN CHAR(11), CardNumber INT(16), AcctNum CHAR(40), PRIMARY KEY(OwnerSSN, CardNumber, AcctNum), FOREIGN KEY (OwnerSSN) REFERENCES USER(SSN) ON DELETE CASCADE);
