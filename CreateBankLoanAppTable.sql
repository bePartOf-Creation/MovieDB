CREATE DATABASE BANKLOANAPP;

USE BANKLOANAPP;
create TABLE CUSTOMER(
   CustomerId CHAR(6)  NOT NULL,
   Firstname  CHAR(45) NOT NULL,
   Lastname   CHAR(30) NOT NULL,
   Middlename CHAR(30) NOT NULL,
   City       CHAR(15) NOT NULL,
   Mobile_No  CHAR(15) NOT NULL,
   Occupation CHAR(23) NOT NULL,
   DateOfBirth DATE NOT NULL,
   CONSTRAINT CUSTOMER_pk PRIMARY KEY(CustomerId)
);
create TABLE ACCOUNT(
	 AccountNumber 		 CHAR(12)    NOT NULL,
     Opening_Balance     INTEGER     NOT NULL,
     AccountOpeningDate  DATE       NOT NULL,
     Account_Type        CHAR(10)   NOT NULL,
     Account_Status      CHAR(10)   NOT NULL,
     CustomerId          CHAR(6)    NOT NULL,
     BranchId     		 CHAR(6)    NOT NULL,
     CONSTRAINT ACCOUNT_pk  PRIMARY KEY(AccountNumber),
     CONSTRAINT fk_CUSTOMER_ACCOUNT FOREIGN KEY(CustomerId)
							REFERENCES CUSTOMER(CustomerId),
     CONSTRAINT BRANCH_fk   FOREIGN KEY(BranchId)
                            REFERENCES BRANCH(BranchId)
);

create TABLE BRANCH(
	BranchId     CHAR(6)    NOT NULL,
    Branchname   CHAR(45)   NOT NULL,
    BranchCity   CHAR(15)   NOT NULL,
    CONSTRAINT BRANCH_pk  PRIMARY KEY(BranchId)
);

CREATE TABLE BRANCH_HAS_CUSTOMER(
	 BranchId   CHAR(6)  NOT NULL,
	 CustomerId CHAR(6)  NOT NULL,
	 CONSTRAINT  PRIMARY KEY(BranchId,CustomerId),
     CONSTRAINT FK_BRANCH_CUSTOMER   FOREIGN KEY(BranchId)
                            REFERENCES BRANCH(BranchId),
     CONSTRAINT CUSTOMER_fk FOREIGN KEY(CustomerId)
							REFERENCES CUSTOMER(CustomerId)
);

create TABLE LOAN(
LoanId       CHAR(15)    NOT NULL,
Loan_type    CHAR(45)    NOT NULL,
Loan_status  CHAR(45)    NOT NULL,
Loan_amount	 INTEGER	 NOT NULL,
BranchId     CHAR(6)     NOT NULL, 
CustomerId   CHAR(6)     NOT NULL,
AccountNumber CHAR(12)   NOT NULL,
CONSTRAINT    PRIMARY KEY(LoanId,CustomerId,BranchId),
-- CONSTRAINT CUSTOMER_pk PRIMARY KEY(CustomerId),--
-- CONSTRAINT BRANCH_pk   PRIMARY KEY(BranchId),--
CONSTRAINT  FOREIGN KEY(AccountNumber)
			REFERENCES ACCOUNT(AccountNumber)
);

create TABLE TRANSANCTION_DETAILS(
	TransanctionId INTEGER NOT NULL auto_increment,
	Transanction_no      CHAR(6)     NOT NULL,
	AccountNumber 		 CHAR(12)    NOT NULL,
    TransanctionDate	 DATE		 NOT NULL,
    Transanction_amount  INTEGER     NOT NULL,
    Transanction_type    CHAR(23)    NOT NULL,
    MediumOfTransanction CHAR(20)    NOT NULL,
    CONSTRAINT TRANSANCTION_DETAILS_pk   PRIMARY KEY(TransanctionId),
	CONSTRAINT ACCOUNT_fk 				 FOREIGN KEY(AccountNumber)
										 REFERENCES ACCOUNT(AccountNumber)
);
-- inserting into BRANCH TABLE --
INSERT INTO BRANCH VALUES
('BCH401', 'SABO_BRANCH', 'YABA');
INSERT INTO BRANCH VALUES
('BCH402', 'ALLEN_BRANCH', 'IKEJA');
INSERT INTO BRANCH VALUES
('BCH403', 'JIBOWU_BRANCH', 'YABA');
INSERT INTO BRANCH VALUES
('BCH404', 'LEKKI_BRANCH', 'LEKKI');

-- insert value into customer table--
INSERT INTO CUSTOMER VALUES
('CST302', 'Adedotun', 'Olasunkanmi', 'Akanke', 'Sagamu','8098006784', 'FrontEnd','2000-10-30');
INSERT INTO CUSTOMER VALUES
('CST305', 'Deellyods', 'Adeola', 'Abosede', 'Allen','8098186784', 'MakeUp Artist','1997-12-20');
INSERT INTO CUSTOMER VALUES
('CST304', 'Seyi', 'Edun', 'Alabi', 'Fadeyi','7098176782', 'CTO','1897-08-10');
INSERT INTO CUSTOMER VALUES
('CST303', 'Olasunkanmi', 'Ola', 'Akanni', 'Silicon Valley','4465873321', 'FullStack DeVeloper','1999-1-20');

-- insert values into ACOUNT TABLES --
INSERT INTO ACCOUNT VALUES
('0140105673','5000','2020-01-23','Savings','Dormant','CST305','BCH401');
INSERT INTO ACCOUNT VALUES
('3140105673','5000','2021-01-23','Savings','Active','CST303','BCH404');
INSERT INTO ACCOUNT VALUES
('0146105672','5000','2000-01-13','Current','Active','CST304','BCH403');
INSERT INTO ACCOUNT VALUES
('0140111173','5000','2004-01-23','Current','Acive','CST302','BCH402');

-- insert values into LOAN VALUES --
INSERT INTO LOAN VALUES
('LID290', 'AGRIC LOAN','PENDING','12000','BCH401','CST302','0140105673');
INSERT INTO LOAN VALUES
('LID292', 'STUDENT LOAN','ACTIVE','20000','BCH403','CST303','3140105673');
INSERT INTO LOAN VALUES
('LID293', 'BUSINESS LOAN','ACTIVE','15000','BCH404','CST305','0146105672');
INSERT INTO LOAN VALUES
('LID2901', 'DAILY LOAN','DEFAULTED','10000','BCH402','CST304','0140111173');

-- insert values into TRANSANCTION-DETAILS table--
INSERT INTO TRANSANCTION_DETAILS (Transanction_no,AccountNumber,TransanctionDate,Transanction_amount,Transanction_type,MediumOfTransanction)VALUES
('TSR001', '0140105673','2021-01-3','20000','Fund_Transfer','Web');
INSERT INTO TRANSANCTION_DETAILS (Transanction_no,AccountNumber,TransanctionDate,Transanction_amount,Transanction_type,MediumOfTransanction)VALUES
('TSR002', '0140111173','2021-11-30','45000','POS','Mobile');
INSERT INTO TRANSANCTION_DETAILS (Transanction_no,AccountNumber,TransanctionDate,Transanction_amount,Transanction_type,MediumOfTransanction)VALUES
('TSR003', '3140105673','2021-10-3','50000','AtM_Deposit','ATM');
INSERT INTO TRANSANCTION_DETAILS (Transanction_no,AccountNumber,TransanctionDate,Transanction_amount,Transanction_type,MediumOfTransanction)VALUES
('TSR004', '0146105672','2021-09-13','10000','Fund_Transfer','Mobile_USSD');

select * from loan;


ALTER TABLE TRANSANCTION_DETAILS;
DROP TABLE TRANSANCTION_DETAILS
