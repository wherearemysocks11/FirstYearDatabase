/* Query 1 
rational: I want to find out what role different members of staff members
have so a potential transfer can be fouund between yards */

SELECT STAFF.STAFF_FNAME, STAFF.STAFF_LNAME, STAFF_ROLES.ROLE_S
FROM STAFF_ROLES JOIN STAFF ON STAFF.STAFF_ID = STAFF_ROLES.STAFF;

/* Output: 

 staff_fname | staff_lname |         role_s
-------------+-------------+------------------------
 Arthur      | Strong      | MANAGER
 Arthur      | Strong      | MANAGER
 Arthur      | Strong      | PILOT
 Ella        | Shannon     | GLASS FIBRE SPECIALIST
 Eliana      | Weaver      | ENGINE TECHNICIAN
 Ulysses     | Golden      | ELECTRICIAN
 Micah       | Mccoy       | TECHNICIAN
 Micah       | Mccoy       | GENERAL
 Micah       | Mccoy       | CLEANER
 Micah       | Mccoy       | GENERAL
 Guinevere   | Clemons     | MANAGER
 Guinevere   | Clemons     | GENERAL
 Sage        | Love        | PILOT
 Sage        | Love        | CLEANER
 Jayme       | Briggs      | ENGINE TECHNICIAN
 Jayme       | Briggs      | TECHNICIAN
 Vanna       | Phelps      | GLASS FIBRE SPECIALIST
 Lucian      | Bush        | MANAGER
 Lucian      | Bush        | GENERAL
 Howard      | Hines       | ENGINE TECHNICIAN
 Howard      | Hines       | TECHNICIAN
 Alice       | Lambert     | CLEANER
 Katelyn     | Valencia    | PILOT
 Oprah       | Vargas      | GLASS FIBRE SPECIALIST
(23 rows)

*/
-------------------------------------------------------------------------------------------------------------------
/* Query 2 
rational: I want to find out how which staff are work at site portsmouth */

SELECT STAFF.STAFF_FNAME, STAFF.STAFF_LNAME 
FROM SITES JOIN STAFF ON STAFF.SITE = SITES.SITE_ID AND SITE_NAME = 'Portsmouth';

/* Output:

staff_fname | staff_lname
-------------+-------------
 Arthur      | Strong
 Ulysses     | Golden
 Sage        | Love
 Lucian      | Bush
 Alice       | Lambert
(5 rows)

*/
-------------------------------------------------------------------------------------------------------------------
/* Query 3
rational: i want to find out who owns the boat: "Melodie" */

SELECT BOATS.BOAT_NAME, CUSTOMERS.CUST_ID, CUSTOMERS.CUST_FNAME, CUSTOMERS.CUST_LNAME
FROM BOATS JOIN CUSTOMERS ON BOATS.OWNER_ID = CUSTOMERS.CUST_ID AND BOATS.BOAT_NAME = 'Melodie';

/* Output: 

boat_name | cust_id | cust_fname | cust_lname 
-----------+---------+------------+------------
 Melodie   |      11 | Bradley    | Gabriel

*/
-------------------------------------------------------------------------------------------------------------------
/* Query 4
rational: a customer has contacted the manager to ask what the status of their service is, they have provided the boat name but not hull ID */

SELECT BOATS.BOAT_NAME, SERVICES.STATUS, SERVICES.NOTES
FROM BOATS JOIN SERVICES ON BOATS.HULL_ID = SERVICES.BOAT AND BOAT_NAME = 'Keiko';

/* Output:

 boat_name |   status   |                notes
-----------+------------+--------------------------------------
 Keiko     | Handed-off | enim non nisi. Aenean eget metus. In
 Keiko     | On-site    | et libero.

*/
-------------------------------------------------------------------------------------------------------------------
/* Query 5
rational: lets assume that solent boats lets their customers manage their accounts on a website, a customer uses the website to see which of their boat(s) are registerd
with their solent boats account they may also want to check the status of their services */

SELECT CUSTOMERS.CUST_ID, BOATS.BOAT_NAME, BOATS.HULL_ID, SERVICES.STATUS
FROM BOATS INNER JOIN CUSTOMERS ON BOATS.OWNER_ID = CUSTOMERS.CUST_ID AND CUSTOMERS.CUST_ID = '3'
           INNER JOIN SERVICES ON SERVICES.BOAT = BOATS.HULL_ID;


/* Output:  

# cust_id | boat_name |    hull_id    |  status   
---------+-----------+---------------+-----------
       3 | Gail      | 1210227194712 | Completed
       3 | Gail      | 1210227194712 | On-site
(2 rows)

*/
