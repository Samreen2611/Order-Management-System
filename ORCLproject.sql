----------------table 1---------------------------------------------------------------------------------------
------------------create tables-----------------------------------------
CREATE TABLE parcelservice_system (
     consignee_id int  ,
     consignee_name VARCHAR(20),
     consignee_address VARCHAR(30),
     consignee_contact int ,
     retailer_name VARCHAR(20),
     retailer_address VARCHAR(30),
     retailer_contact NUMBER(38),
     price int,
    order_date DATE ,
    primary key(consignee_id,order_date)
);
---------------------------------insering values---------------------------------
insert into parcelservice_system values(1,'sawera','karachi',03456533,1,'samreen','attock',56556,210,to_date('2020-jun-20','yyyy-mon-dd'))
insert into parcelservice_system values(2,'sana','lahore',5678887,1,'samreen','attock',56556,290,to_date('2022-jul-22','yyyy-mon-dd'))
insert into parcelservice_system values(3,'suhana','attock',6789990,1,'samreen','attock',56556,280.0,to_date('2020-jun-20','yyyy-mon-dd'))
insert into parcelservice_system values(4,'saba','islamabad',45362728,1,'samreen','attock',56559,230.0,to_date('2024-may-28','yyyy-mon-dd'))
insert into parcelservice_system values(5,'maira','faizabad',454556,1,'samreen','attock',56556,240.0,to_date('2023-sep-10','yyyy-mon-dd'))
insert into parcelservice_system values(6,'rubab','rawalpindi',8977987,1,'samreen','attock',56556,250.0,to_date('2021-oct-25','yyyy-mon-dd'))
insert into parcelservice_system values(7,'humaira','abbotabad',8908987,1,'samreen','attock',56556,260.0,to_date('2023-jan-17','yyyy-mon-dd'))
insert into parcelservice_system values(8,'naila','karachi',67587656,1,'samreen','attock',56556,210.0,to_date('2022-feb-13','yyyy-mon-dd'))
insert into parcelservice_system values(9,'mayam','kohat',7868799,1,'samreen','attock',56556,220.0,to_date('2021-aug-24','yyyy-mon-dd'))
insert into parcelservice_system values(10,'kinza','peshawar',098776,1,'samreen','attock',56556,230,to_date('2022-dec-20','yyyy-mon-dd'))
insert into parcelservice_system values(11,'hania','lahore',098896,1,'samreen','attock',56556,230,to_date('2023-july-20','yyyy-mon-dd'))
===============================================================================================================================================
-------------------table2-------------------------------------------------------------------------------
CREATE TABLE shipment (
    shipment_id int PRIMARY KEY,
    consignee_id int,
    order_date DATE,
    shipment_date DATE,
    status VARCHAR(50),
    FOREIGN KEY (consignee_id, order_date) REFERENCES parcelservice_system(consignee_id, order_date)
);
-- Insert sample data into the shipment table
INSERT INTO shipment values (1, 1, TO_DATE('2020-06-20', 'YYYY-MM-DD'), TO_DATE('2020-07-03', 'YYYY-MM-DD'), 'Delivered');
INSERT INTO shipment VALUES (2, 2, TO_DATE('2022-07-22', 'YYYY-MM-DD'), TO_DATE('2022-09-04', 'YYYY-MM-DD'), 'In Transit');
INSERT INTO shipment VALUES (3, 3, TO_DATE('2020-06-20', 'YYYY-MM-DD'), TO_DATE('2020-06-30', 'YYYY-MM-DD'), 'Delivered');
INSERT INTO shipment VALUES (4, 4, TO_DATE('2024-05-28', 'YYYY-MM-DD'), TO_DATE('2024-05-30', 'YYYY-MM-DD'), 'Pending');
INSERT INTO shipment VALUES (5, 5, TO_DATE('2023-09-10', 'YYYY-MM-DD'), TO_DATE('2023-10-07', 'YYYY-MM-DD'), 'Delivered');
INSERT INTO shipment values (6, 6, TO_DATE('2020-10-21', 'YYYY-MM-DD'), TO_DATE('2020-07-03', 'YYYY-MM-DD'), 'Delivered');
=========================================================================================================================================================
------------------------table3----------------------------------------------------------------------------------------
create table delivery_person (
    person_id INT PRIMARY KEY,
    shipment_id int,
    name VARCHAR(50),
    contact_number int,
    region VARCHAR(50),
    foreign key (shipment_id) references shipment(shipment_id)
);
-- Insert sample data into the delivery_person table
INSERT INTO delivery_person VALUES (1,1, 'hassan', '1234567890', 'Attock');
INSERT INTO delivery_person VALUES (2,2, 'ali', '0987654321', 'Islamabad');
INSERT INTO delivery_person VALUES (3,3, 'sahir', '5678901234', 'Lahore');
INSERT INTO delivery_person VALUES (4,4, 'shani', '6789012345', 'Karachi');
INSERT INTO delivery_person VALUES (5,5, 'ahad', '7890123456', 'Rawalpindi');
==========================================================================================================================================================
-----------------------Table 4----------------------------------
-- Create customer_feedback table
CREATE TABLE customer_feedback (
    feedback_id INT PRIMARY KEY,
    shipment_id INT,
    rating INT ,
    comments VARCHAR(255),
    feedback_date DATE,
    FOREIGN KEY (shipment_id) REFERENCES shipment(shipment_id)
);

-- Insert sample data into the customer_feedback table
INSERT INTO customer_feedback values(1, 1, 5, 'Great service!', TO_DATE('2020-07-03', 'YYYY-MM-DD'));
INSERT INTO customer_feedback values(2, 2, 4, 'Delivered on time.', TO_DATE('2022-09-04', 'YYYY-MM-DD'));
INSERT INTO customer_feedback values(3, 3, 3, 'Average experience.', TO_DATE('2020-06-30', 'YYYY-MM-DD'));
INSERT INTO customer_feedback values(4, 4, 2, 'Delayed delivery.', TO_DATE('2024-05-30', 'YYYY-MM-DD'));
INSERT INTO customer_feedback values(5, 5, 1, 'Poor service.', TO_DATE('2023-10-07', 'YYYY-MM-DD'));
============================================================================================================
----------------------------------table 5-----------------------
----------------create payment table-----
create table payment(
payment_id int primary key,
shipment_id int,
payment_method varchar(20),
payment_status varchar(20),
foreign key (shipment_id) references shipment(shipment_id)
);
INSERT INTO payment values(1, 1,'cash','pending');
INSERT INTO payment values(2, 2,'jazzcash','failed');
INSERT INTO payment values(3, 3,'bank','successfull');
INSERT INTO payment values(4, 4,'cash','successfull');
INSERT INTO payment values(5, 5,'easypesa','pending');

--------------------select query-----------------------
select *from parcelservice_system;
select *from shipment;
select * from delivery_person;
select *from customer_feedback;
select *from payment;








select c.consignee_name,s.shipment_id,f.comments from parcelservice_system c join shipment s 
on (c.consignee_id=s.consignee_id) join customer_feedback f on(s.shipment_id=f.shipment_id)















=============================================================================================================
----------------------selecting different colomns-----------
select consignee_name,retailer_address from parcelservice_system;
select consignee_id,status from shipment;
select name,region from delivery_person;
select rating,comments from customer_feedback;
------------Algorithmic operations---------------------------------------------------
select consignee_name,price,price+50 from parcelservice_system;
----------------concatinataion query------------------------------------------------------ 
select consignee_id||consignee_name AS "consignee details" from parcelservice_system;
select consignee_id||status AS "shipment details" from shipment;
select name||region AS "delivery person details" from delivery_person;
select rating||comments AS "feedback" from cusstomer_feedback;
------------Distinct query------------------------------------------------------
select DISTINCT retailer_id, consignee_id from parcelservice_system
select DISTINCT shipment_id, consignee_id from shipment
-------------Describe---------------
DESCRIBE parcelservice_system
DESCRIBE shipment
DESCRIBE delivery_person
DESCRIBE customer_feedback
----------------Alter table,update table---------------
Alter table shipment add tracking_no int
update shipment set tracking_no=231 where shipment_id=1
ALTER TABLE shipment
DROP COLUMN Tracking_no;
--------------Drop table---------------
Drop Table parcelservice_system;
Drop Table shipment;
Drop Table delivery_person;
Drop Table customer_feedback;
----------Where clause,asc,des,order by,between,like,In----------
select  consignee_id,consignee_name,price from parcelservice_system WHERE  price=230 order by consignee_id Desc
select  consignee_id,order_date from shipment WHERE  consignee_id BETWEEN 2 and 5
select  consignee_id,consignee_name,price from parcelservice_system WHERE  consignee_name BETWEEN 'maira' and 'sawera'/*activity  4*/
select  name,region from delivery_person WHERE region  BETWEEN 'Attock' and 'Rawalpindi'
select  comments,rating from customer_feedback WHERE  rating BETWEEN 2 and 5
select  consignee_id,consignee_name,price from parcelservice_system WHERE  consignee_name IN('kinza' , 'saba')
select  consignee_id,shipment_id from shipment WHERE  consignee_id IN(3, 5) 
select  name,region from delivery_person WHERE  name IN('shani' , 'ahad') 
select  consignee_id,consignee_name,price from parcelservice_system WHERE  consignee_name LIKE's%'
select  name,region from delivery_person WHERE  region LIKE'%i'
select  comments from customer_feedback WHERE  comments LIKE'%o%'
SELECT consignee_id ,consignee_name,price  FROM parcelservice_system  WHERE  consignee_id= 6  and price NOT IN (279 ,290)
=========================================================================================================================
--------------------Functions,sorting,allign-----------------------------------------------
select 'consignee_id  for '||upper(consignee_name)||' is '|| lower (consignee_id) AS
Consignee_details from parcelservice_system
select 'shipment_id  for '||upper(name)||' is '|| lower (person_id) AS
person_details from delivery_person
select consignee_id,consignee_address,consignee_id||consignee_name AS Name,length(consignee_name),
INSTR(consignee_name,'a')"contains 'a'?" from parcelservice_system where SUBSTR(consignee_address,7)='bad'
select consignee_id,shipment_id,consignee_id||shipment_id AS details,length(status),
INSTR(status,'a')"contains 'a'?" from shipment 
select consignee_name,MOD(price,9) from parcelservice_system where consignee_name='saba'
select trunc(45.456,2),trunc(23.45),round(98.709) from DUAL
select consignee_name ,(SYSDATE-order_date)/7 AS weeks from parcelservice_system where consignee_id= 10
select consignee_id ,order_date,MONTHS_BETWEEN(SYSDATE,order_date)TENURE,add_months(order_date,6)REVIEW,NEXT_DAY(order_date,'friday'),
LAST_DAY(order_date) from parcelservice_system where MONTHS_BETWEEN (SYSDATE,order_date)<150
select consignee_id, order_date, ROUND(order_date,'MONTH'), TRUNC(order_date, 'MONTH') FROM parcelservice_system where order_date LIKE '%23'
select consignee_id, TO_CHAR(order_date, 'MM/YY') Month_orderd from parcelservice_system where consignee_name = 'sana';
select TO_CHAR(NEXT_DAY(ADD_MONTHS(order_date, 6), 'FRIDAY'), 'fmDay, Month ddth, YYYY') As "Next 6 Month Review"
from parcelservice_system ORDER BY order_date;
select TO_CHAR(ROUND((price/7), 2),'99g999d99', 'NLS_NUMERIC_CHARACTERS = '',.'' ') "Formatted price" from parcelservice_system;
select consignee_name,price,NVL(price,0) from parcelservice_system;
select consignee_name,NVL2(price,'actual price','null value')annual_price from parcelservice_system where consignee_id In(5,10)
select retailer_address, LENGTH(retailer_address) as "rlength", consignee_address, LENGTH(consignee_address) as "clength",
NULLIF(LENGTH(retailer_address),LENGTH(consignee_address))  as result  from parcelservice_system;
============================================================================================================
-------------------------Arithmetics Functions-------------------------------------
select max(price), min(price), sum(price), avg(price) from parcelservice_system;
select count(shipment_id) from shipment;
select count( distinct(person_id)) from delivery_person
select avg(NVL(price,0))  from parcelservice_system;
---------------Group by , having --------------------------
select consignee_id , avg(price) from parcelservice_system group by consignee_id; 
select shipment_id , region from delivery_person group by shipment_id,region 
select consignee_address , avg(price)from parcelservice_system group by consignee_address 
having avg(price)> 250 order by consignee_address;
==============================================================================================================================================================
------------------------------Joins------------------------------------
select * from  parcelservice_system  cross join shipment
select * from  customer_feedback cross join delivery_person
select * from  parcelservice_system  cross join customer_feedback
select * from  shipment  cross join delivery_person
select consignee_name,retailer_name,price from parcelservice_system  join shipment using (consignee_id)
select p.person_id,p.region from delivery_person p join shipment using (shipment_id)
select * from parcelservice_system inner join shipment
on parcelservice_system.consignee_id=shipment.consignee_id
select * from parcelservice_system natural join shipment
select * from customer_feedback natural join delivery_person
select * from parcelservice_system natural join shipment where 
consignee_id between 2 and 4
---------left outer join selects from left table---
select s.consignee_name,s.consignee_id from parcelservice_system s  left outer join shipment p on(s.consignee_id=p.consignee_id)
select s.name,s.region from delivery_person s  left outer join shipment p on(s.shipment_id=p.shipment_id)
select s.shipment_id,s.comments from customer_feedback s  left outer join shipment p on(s.shipment_id=p.shipment_id)
----select from right table----
select s.consignee_name,s.consignee_id from parcelservice_system s  right outer join shipment p on(s.consignee_id=p.consignee_id)
select s.name,s.region from delivery_person s  right outer join shipment p on(s.shipment_id=p.shipment_id)
select s.shipment_id,s.comments from customer_feedback s  right outer join shipment p on(s.shipment_id=p.shipment_id)
------select the rows of both table----
select s.consignee_name,s.consignee_id from parcelservice_system s  full outer join shipment p on(s.consignee_id=p.consignee_id)
select s.shipment_id,s.consignee_id from shipment s  full outer join delivery_person  p on(s.shipment_id=p.shipment_id)
select c.comments,c.rating from customer_feedback c full outer join shipment p on(c.shipment_id=p.shipment_id)
==================================================================================================================================================================
----lab no 7-----
------single row subquery---
select  consignee_id,consignee_name from parcelservice_system where consignee_address =
(select consignee_address  from parcelservice_system where consignee_address = 'kohat')
-----single row query with multivalued-----
select  consignee_name,consignee_contact,order_date,price from parcelservice_system 
where consignee_name= (select consignee_name from parcelservice_system where consignee_name='sawera')
and consignee_id= (select consignee_id from parcelservice_system where consignee_id=1)
--------------returning no value bacause of not matching
select consignee_name,consignee_address from parcelservice_system where price=(select min(price) from parcelservice_system where price=200)
select consignee_id,consignee_name from parcelservice_system where price >ANY(select price from parcelservice_system  where consignee_name='sawera')
select consignee_id,consignee_name from parcelservice_system where price <ALL(select price from parcelservice_system  where consignee_name='saba')
select consignee_id ,consignee_name from parcelservice_system where exists 
(select consignee_id from parcelservice_system where (consignee_id=retailer_id) and price=210)
select consignee_name,consignee_address from parcelservice_system where retailer_id not in (select retailer_id from parcelservice_system group by retailer_id)
-----------------Union ,intersection,minus------------------------------------------------------------------------------------------
SELECT consignee_id,order_date FROM parcelservice_system UNION 
SELECT shipment_id, order_date  FROM shipment 
SELECT consignee_id, retailer_id, order_date from parcelservice_system Union All 
select shipment_id, consignee_id, order_date from shipment 
SELECT consignee_id,order_date FROM parcelservice_system intersect
SELECT shipment_id, order_date  FROM shipment 
select consignee_id from parcelservice_system minus select consignee_id from shipment
select consignee_id,to_char(null),retailer_id from parcelservice_system union
select 0,status ,shipment_id from shipment
SELECT consignee_id, retailer_id, order_date from parcelservice_system Union All 
select shipment_id, consignee_id, order_date from shipment order by consignee_id
-----------------------------creating views--------------
create view  view1 as select name,person_id,region from delivery_person 
create view  view2 as select consignee_id,shipment_id,status from shipment
select * from view1 
select * from view2
select * from shipment s join parcelservice_system p on(s.consignee_id=p.consignee_id)
-----------------------Constraits using------------------
CREATE TABLE delivery_person (
    person_id NUMBER PRIMARY KEY,
    name VARCHAR2(50),
    contact_number VARCHAR2(15),
    address VARCHAR2(100),
    hire_date DATE DEFAULT SYSDATE
);
CREATE TABLE customer_feedback (
    feedback_id NUMBER PRIMARY KEY,
    customer_id NUMBER,
    feedback_text VARCHAR2(255),
    feedback_date DATE DEFAULT SYSDATE
);
CREATE TABLE delivery_person (
    person_id NUMBER PRIMARY KEY,
    name VARCHAR2(50),
    contact_number VARCHAR2(15),
    address VARCHAR2(100),
    salary NUMBER(8,2) CONSTRAINT del_salary_min CHECK (salary > 0),
    hire_date DATE DEFAULT SYSDATE
);
ALTER TABLE delivery_person2
ADD (job_id VARCHAR2(9));
ALTER TABLE delivery_person2 
MODIFY (name VARCHAR2(100));


ALTER TABLE delivery_person 2
DROP COLUMN job_id;

DROP TABLE delivery_person2; 

select consignee_id,min(price)  from parcelservice_system group by consignee_id
create view view3 as select consignee_id from shipment
select consignee_name,price from parcelservice_system union select  to_char(null),person_id from delivery_person

