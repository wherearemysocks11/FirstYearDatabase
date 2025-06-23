--- DATABASE CREATION ---

CREATE DATABASE up2114856;
\c up2114856;

--- TABLE CREATION ---

CREATE TABLE SITES(
SITE_ID SERIAL PRIMARY KEY,
SITE_NAME VARCHAR(50),
SITE_ADDRESS VARCHAR(250) NOT NULL
);

CREATE TABLE STAFF(
STAFF_ID SERIAL PRIMARY KEY,
STAFF_FNAME VARCHAR(100) NOT NULL,
STAFF_LNAME VARCHAR(100) NOT NULL,
STAFF_DOB DATE NOT NULL,
STAFF_EMAIL VARCHAR(320),
STAFF_ADDRESS VARCHAR(300),
SITE INT REFERENCES SITES(SITE_ID)
);

CREATE TABLE ROLES (
ROLE VARCHAR(30) PRIMARY KEY
);

CREATE TABLE STAFF_ROLES (
STAFF INT REFERENCES STAFF(STAFF_ID) NOT NULL,
ROLE_S VARCHAR(30) REFERENCES ROLES(ROLE) NOT NULL
);

CREATE TABLE CUSTOMERS(
CUST_ID SERIAL PRIMARY KEY,
CUST_FNAME VARCHAR(100),
CUST_LNAME VARCHAR(100),
CUST_EMAIL VARCHAR(320),
CUST_DOB DATE,
CUST_ADDRESS VARCHAR(300)
);

CREATE TABLE BOATS(
HULL_ID BIGINT PRIMARY KEY,
BOAT_NAME VARCHAR(50),
ENGINE_TYPE VARCHAR(12),
OWNER_ID INT
);

CREATE TABLE SERVICES(
SERVICE_ID SERIAL PRIMARY KEY,
BOAT BIGINT REFERENCES BOATS(HULL_ID),
SITE INT REFERENCES SITES(SITE_ID),
STATUS VARCHAR(15),
PRICE INT,
NOTES VARCHAR(300),
STAFF BIGINT REFERENCES STAFF(STAFF_ID)
);

--- data population ---

INSERT INTO ROLES(ROLE)
VALUES ('MANAGER'),
('GLASS FIBRE SPECIALIST'),
('ENGINE TECHNICIAN'),
('GENERAL'),
('ELECTRICIAN'),
('TECHNICIAN'),
('CLEANER'),
('PILOT');

INSERT INTO SITES (SITE_NAME, SITE_ADDRESS)
VALUES ('Portsmouth', 'P.O. Box 681, 6593 Sed Road'),
('liverpool', '5399 Sem Road'),
('hull', '592-6406 Aliquet Rd'),
('Dover', '1 Harbour House Road');

INSERT INTO STAFF (STAFF_FNAME, STAFF_LNAME, STAFF_DOB, STAFF_EMAIL, STAFF_ADDRESS, SITE)
VALUES ('Arthur','Strong','1964-01-17','s.arthur4348@icloud.org','744-6465 Quam St.',1),
  ('Ella','Shannon','1991-05-22','s.ella@aol.com','2052 Vestibulum Rd.',2),
  ('Eliana','Weaver','1968-10-14','weavereliana1018@aol.edu','4272 Integer St.',3),
  ('Ulysses','Golden','1981-05-14','u_golden@google.couk','P.O. Box 927, 2473 Sagittis Street',4),
  ('Micah','Mccoy','1996-06-19','mmccoy@icloud.net','Ap 163-4715 Phasellus Rd.',1),
  ('Guinevere','Clemons','1926-07-27','c-guinevere@protonmail.ca','Ap 337-3540 Cursus Ave',2),
  ('Sage','Love','1955-12-13','sage.love@icloud.com','261-9109 Amet, Ave',3),
  ('Jayme','Briggs','1955-05-13','j_briggs@protonmail.couk','955-9915 Adipiscing St.',4),
  ('Vanna','Phelps','1925-07-10','phelps-vanna@hotmail.com','667-9776 Quisque St.',1),
  ('Lucian','Bush','1958-04-10','bush_lucian@hotmail.ca','Ap 826-2818 Ultrices Rd.',2),
  ('Tyrone','Price','1927-03-27','p-tyrone1899@outlook.net','Ap 731-1222 Purus Ave',3),
  ('Howard','Hines','1978-04-06','howard-hines4448@protonmail.ca','Ap 811-1419 Aliquam St.',4),
  ('Alice','Lambert','1924-08-05','alice-lambert5845@protonmail.ca','Ap 626-8295 Id St.',1),
  ('Katelyn','Valencia','1996-09-19','valenciakatelyn@aol.ca','P.O. Box 774, 4307 Curabitur Av.',2),
  ('Oprah','Vargas','1986-04-06','v_oprah1046@protonmail.couk','Ap 798-2844 Mollis St.',3);

INSERT INTO STAFF_ROLES(STAFF, ROLE_S)
VALUES (1,'MANAGER'),
(1,'PILOT'),
(2,'GLASS FIBRE SPECIALIST'),
(3,'ENGINE TECHNICIAN'),
(4,'ELECTRICIAN'),
(5,'TECHNICIAN'),
(5,'GENERAL'),
(5,'CLEANER'),
(5,'GENERAL'),

(6,'MANAGER'),
(6,'GENERAL'),
(7,'PILOT'),
(7,'CLEANER'),
(8,'ENGINE TECHNICIAN'),
(8,'TECHNICIAN'),
(9,'GLASS FIBRE SPECIALIST'),

(10,'MANAGER'),
(10,'GENERAL'),
(12,'ENGINE TECHNICIAN'),
(12,'TECHNICIAN'),
(13,'CLEANER'),
(14,'PILOT'),
(15,'GLASS FIBRE SPECIALIST');

INSERT INTO CUSTOMERS (CUST_FNAME, CUST_LNAME, CUST_EMAIL, CUST_DOB, CUST_ADDRESS)
VALUES ('Salvador','Martin','martin_salvador9253@hotmail.ca','2023-09-23','289-2307 Mauris, Rd.'),
  ('Daphne','Blackburn','dblackburn8989@aol.net','2023-02-23','835 Bibendum Rd.'),
  ('Travis','Church','travis_church@hotmail.org','2023-09-23','Ap 140-423 Ac Rd.'),
  ('Reece','Ruiz','reece.ruiz2333@protonmail.edu','2024-01-24','5058 Dolor St.'),
  ('Hector','Ward','h-ward@aol.org','2022-11-22','Ap 409-6675 Ante. Rd.'),
  ('Jesse','Gabriel','martin_salvador9253@hotmail.ca','2023-09-23','289-2307 Mauris, Rd.'),
  ('Lucy','Kenyon','dblackburn8989@aol.net','2023-02-23','835 Bibendum Rd.'),
  ('Orlando','Orla','travis_church@hotmail.org','2023-09-23','Ap 140-423 Ac Rd.'),
  ('Sharon','Darius','reece.ruiz2333@protonmail.edu','2024-01-24','5058 Dolor St.'),
  ('Quinn','Ramona','h-ward@aol.org','2022-11-22','Ap 409-6675 Ante. Rd.'),
  ('Bradley','Gabriel','martin_salvador9253@hotmail.ca','2023-09-23','289-2307 Mauris, Rd.'),
  ('Velma','Kenyon','dblackburn8989@aol.net','2023-02-23','835 Bibendum Rd.'),
  ('Ross','Orla','travis_church@hotmail.org','2023-09-23','Ap 140-423 Ac Rd.'),
  ('Orli','Darius','reece.ruiz2333@protonmail.edu','2024-01-24','5058 Dolor St.'),
  ('Rafael','Ramona','h-ward@aol.org','2022-11-22','Ap 409-6675 Ante. Rd.'),
  ('Deirdre','Gabriel','martin_salvador9253@hotmail.ca','2023-09-23','289-2307 Mauris, Rd.'),
  ('Gregory','Kenyon','dblackburn8989@aol.net','2023-02-23','835 Bibendum Rd.'),
  ('Julian','Orla','travis_church@hotmail.org','2023-09-23','Ap 140-423 Ac Rd.'),
  ('Miranda','Darius','reece.ruiz2333@protonmail.edu','2024-01-24','5058 Dolor St.'),
  ('Eve','Ramona','h-ward@aol.org','2022-11-22','Ap 409-6675 Ante. Rd.'),
  ('Jack','Gabriel','martin_salvador9253@hotmail.ca','2023-09-23','289-2307 Mauris, Rd.'),
  ('Emily','Kenyon','dblackburn8989@aol.net','2023-02-23','835 Bibendum Rd.'),
  ('Laith','Orla','travis_church@hotmail.org','2023-09-23','Ap 140-423 Ac Rd.'),
  ('Echo','Darius','reece.ruiz2333@protonmail.edu','2024-01-24','5058 Dolor St.'),
  ('Jeanette','Ramona','h-ward@aol.org','2022-11-22','Ap 409-6675 Ante. Rd.');

INSERT INTO BOATS (HULL_ID, BOAT_NAME, ENGINE_TYPE, OWNER_ID)
VALUES (90171192777408,'Simone','Petrol',1),
  (82353989460847,'Ariana','Petrol-Sail',2),
  (1210227194712,'Gail','Petrol',3),
  (12518262199820,'Cameran','Petrol-Sail',4),
  (73456068296024,'Keiko','Diesel-Sail',5),
  (65969438710382,'Barbara','Diesel-Sail',6),
  (89944729131071,'Ginger','Petrol',7),
  (41577543543090,'Brooke','Sail',8),
  (70656194948804,'Darryl','Diesel-Sail',9),
  (18991898655001,'Diana','Sail',10),
  (49972280482,'Melodie','Petrol',11),
  (30719762626588,'Gloria','Sail',12),
  (30666911603071,'Nayda','Diesel',13),
  (1900255911464,'Ignacia','Diesel',14),
  (98495110425824,'Ava','Petrol',15),
  (96726924335488,'Sasha','Diesel-Sail',16),
  (92661732175511,'Geraldine','Sail',17),
  (33385650062641,'Serena','Diesel',18),
  (50767448252006,'Desiree','Sail',19),
  (27994043527575,'Anjolie','Petrol',20),
  (38448798324650,'Sydnee','Petrol-Sail',21),
  (25984169977897,'Adrienne','Sail',22),
  (44754961993702,'Margaret','Petrol',23),
  (49093488498250,'Wanda','Diesel',24),
  (24924161329045,'Karen','Diesel-Sail',25),
  (39843616154208,'Britanney','Petrol',25),
  (48559214875681,'Halla','Petrol',23),
  (45237403106678,'Aiko','Diesel',7),
  (24426665205335,'Rina','Petrol',1),
  (81308214543051,'Venus','Diesel',13);

INSERT INTO SERVICES (BOAT, SITE, STATUS, PRICE, NOTES, STAFF)
VALUES (90171192777408,1,'In-progress',1892,'egestas nunc sed libero. Proin sed turpis nec',1),
  (1210227194712,2,'Completed',3641,'tincidunt, nunc ac mattis ornare, lectus',2),
  (12518262199820,3,'Handed-off',3627,'ornare tortor at risus. Nunc ac sem',3),
  (73456068296024,4,'Handed-off',7250,'enim non nisi. Aenean eget metus. In',4),
  (65969438710382,1,'On-site',5865,'elementum, lorem ut aliquam iaculis, lacus',5),
  (89944729131071,2,'Completed',4248,'Duis a mi fringilla mi lacinia mattis. Integer',6),
  (41577543543090,3,'Pre-Booked',8624,'',7),
  (70656194948804,4,'In-progress',7359,'mauris',8),
  (18991898655001,1,'Pre-Booked',336,'lacus. Aliquam rutrum lorem ac risus. Morbi metus.',9),
  (49972280482,2,'In-progress',7091,'Mauris molestie pharetra',10),
  (30719762626588,3,'Pre-Booked',9400,'dictum eu, eleifend nec, malesuada',11),
  (30666911603071,4,'In-progress',5191,'vestibulum. Mauris magna. Duis dignissim tempor arcu. Vestibulum ut eros',12),
  (1900255911464,1,'Handed-off',8379,'ut dolor dapibus gravida. Aliquam tincidunt, nunc ac mattis',13),
  (98495110425824,2,'Handed-off',9583,'felis. Donec tempor, est ac mattis semper, dui',14),
  (96726924335488,3,'Completed',8731,'justo nec ante. Maecenas mi',15),
  (33385650062641,4,'Pre-Booked',9400,'dictum eu, eleifend nec, malesuada',1),
  (50767448252006,1,'In-progress',5191,'vestibulum. Mauris magna. Duis dignissim tempor arcu. Vestibulum ut eros',2),
  (27994043527575,2,'Handed-off',8379,'ut dolor dapibus gravida. Aliquam tincidunt, nunc ac mattis',3),
  (38448798324650,3,'Handed-off',9583,'felis. Donec tempor, est ac mattis semper, dui',4),
  (25984169977897,4,'Completed',8731,'justo nec ante. Maecenas mi',5),
  (44754961993702,1,'In-progress',8495,'tellus id nunc interdum feugiat. Sed nec metus facilisis',6),
  (49093488498250,2,'Handed-off',2455,'porttitor eros nec tellus. Nunc lectus pede, ultrices',7),
  (24924161329045,3,'Pre-Booked',9858,'tempus mauris erat eget ipsum. Suspendisse sagittis. Nullam vitae',8),
  (39843616154208,4,'On-site',6682,'Phasellus fermentum convallis ligula.',9),
  (48559214875681,1,'Completed',4300,'ullamcorper, velit in aliquet lobortis, nisi nibh lacinia orci, consectetuer',10),
  (45237403106678,2,'In-progress',295,'libero',11),
  (24426665205335,3,'Completed',365,'volutpat. Nulla dignissim. Maecenas ornare egestas ligula. Nullam',12),
  (81308214543051,4,'In-progress',8974,'fringilla, porttitor vulputate, posuere vulputate, lacus.',13),
  (39843616154208,1,'Handed-off',810,'tempor arcu. Vestibulum ut eros non enim commodo hendrerit.',14),
  (33385650062641,2,'In-progress',8401,'quis, pede. Praesent eu dui. Cum sociis natoque penatibus',15),
  (41577543543090,3,'On-site',9345,'tincidunt, nunc ac mattis ornare, lectus ante dictum',1),
  (50767448252006,4,'On-site',2038,'augue,',1),
  (27994043527575,1,'Handed-off',641,'Nam consequat',3),
  (65969438710382,2,'On-site',7563,'felis, adipiscing fringilla, porttitor',4),
  (50767448252006,3,'On-site',8825,'et libero.',5),
  (1210227194712,4,'On-site',9345,'tincidunt, nunc ac mattis ornare, lectus ante dictum',6),
  (90171192777408,1,'On-site',2038,'augue,',7),
  (25984169977897,2,'Handed-off',641,'Nam consequat',8),
  (96726924335488,3,'On-site',7563,'felis, adipiscing fringilla, porttitor',9),
  (73456068296024,4,'On-site',8825,'et libero.',10);
