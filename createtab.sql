-- Human and Games table --
/** statement structure for creating a table 

create TABLE  -- name-of-the-table --(
	COLUMN_name COLUMN_datatype optional constriant,
    COLUMN_name COLUMN_datatype optional constriant,
    ...........
    COLUMN_name COLUMN_datatype optional constriant,
    CONSTRAINT  name_of_the_table_pk PRIMARY KEY(column name)
	CONSTRAINT  name_of_the_table_fk FOREIGN KEY(column name)
									 REFRENCES table_name(column_name)
);
**/
-- To create a database using the sql statements --
CREATE DATABASE FirstTable;
-- To select a default table --
use FirstTable;
-- To create a table in the firsttable schema
-- Human Table--

CREATE TABLE Human (
   HumanId INTEGER NOT NULL auto_increment,
   Name   CHAR(35)   NOT NULL,
   Color  CHAR(30)   NOT NULL,
   Gender CHAR(30)   NOT NULL,
   BloodGroup char(4) NULL,
   CONSTRAINT  Human_pk  PRIMARY KEY(HumanId)
);

-- Games Table--
CREATE TABLE Games(
	Ordernumber INTEGER NOT NULL,
    Storenumber INTEGER NOT NULL,
    Storezip char(9) NULL,
    OrderMonth char(12) NOT NULL,
    Orderyear INTEGER NOT NULL,
    Ordertotal NUMERIC(4,2)  NULL, -- (4,2) is 4(size of digits) and 2(is number of the decimal from thr right). --
    HumanId INTEGER NOT NULL,
    CONSTRAINT  Games_pk  PRIMARY KEY(Ordernumber),
	CONSTRAINT  Games_fk  FOREIGN KEY(HumanId)
						  REFERENCES Human(HumanId)
);

 -- Inserting values into the humman table ---
 INSERT INTO Human (Name, color, gender, bloodgroup)VALUES -- (HumanID is  not mentioned because, its auto increments,but if it was specifed by me, i dont need to do  -- 
 ('John Doe', 'Brown', 'Male', 'B');
 INSERT INTO Human (Name, color, gender, bloodgroup)VALUES
 ('Jane Doe', 'White', 'Female', 'o');
 INSERT INTO Human (Name, color, gender, bloodgroup)VALUES
 ('Sam Doe', 'Green', 'Male', 'B-');
 INSERT INTO Human (Name, color, gender, bloodgroup)VALUES
 ('Amaka Doe', 'White', 'Female', 'o+');
 
 
 -- Inserting values into the Games tables --
 INSERT INTO Games VALUES
 ('01','201', '10011', 'June', '2006', '21.54', '11'); 
 INSERT INTO Games VALUES
 ('02','202', '10031', 'October', '2009', '51.54', '10'); 
 INSERT INTO Games VALUES
 ('03','203', '10041', 'April', '2012', '81.04', '13'); 
 INSERT INTO Games VALUES
 ('04','204', '10081', 'December','2005', '71.54', '12'); 
 
 
 select * from Human;
 select * from Games;
 UPDATE `firsttable`.`Games` SET `Orderyear` = '2006' WHERE (`Ordernumber` = '1');
UPDATE `firsttable`.`Games` SET `Orderyear` = '2009' WHERE (`Ordernumber` = '2');
UPDATE `firsttable`.`Games` SET `Orderyear` = '2012' WHERE (`Ordernumber` = '3');

select * from Human,Games 
WHERE (HumanId = 10);

 
 
 
 
 
 