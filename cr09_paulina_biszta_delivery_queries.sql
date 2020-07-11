/* How many employees have salaries higher than EUR 3000,00 and who are they? */
 
SELECT COUNT(salary) 
FROM employee
WHERE employee.salary>3000;

SELECT employee.name, employee.gender, employee.salary 
FROM employee
WHERE employee.salary>3000;

/*How many packages on size "M" were sent and by whom?*/
SELECT COUNT(item_id)
FROM package_mail 
WHERE type = 'package' AND size = 'M';

SELECT customer.first_name, customer.last_name, package_mail.type, package_mail.size
FROM customer
JOIN package_mail on package_mail.fk_customer_id  = customer.customer_id
WHERE type = 'package' AND size = 'M';

/*Post office department addresses of each employee*/

SELECT employee.employee_id, employee.name, postoffice_addresse.city, postoffice_addresse.street, postoffice_addresse.number, postoffice_addresse.zip_code
FROM employee
JOIN postoffice on postoffice.postoffice_id = employee.fk_postoffice_id
JOIN postoffice_addresse on postoffice_addresse.postoffice_addresse_id = postoffice.fk_postoffice_addresse_id;

/*How many packages/mail were sent from this specific bezirk?*/

SELECT COUNT(item_id)
FROM package_mail 
JOIN postoffice on postoffice.fk_item_id = package_mail.item_id
JOIN postoffice_addresse on postoffice_addresse.postoffice_addresse_id = postoffice.fk_postoffice_addresse_id
WHERE zip_code = 1030;

/*Who sent packages/mail on 2020-07-01 16:01:00?*/
SELECT customer.customer_id, customer.first_name, customer.last_name, c_addresse.city, c_addresse.street, c_addresse.number, c_addresse.zip_code, package_mail.type, postoffice.deposited_date
FROM customer
JOIN c_addresse on c_addresse.c_addresse_id = customer.fk_c_addresse_id
JOIN package_mail on package_mail.fk_customer_id = customer.customer_id
JOIN postoffice on postoffice.fk_item_id = package_mail.item_id
WHERE postoffice.deposited_date = '2020-07-01 16:01:00';

/*Who sent packages/mail between 2020-05-11 15:30:00 and 2020-07-01 16:01:00?*/
SELECT customer.customer_id, customer.first_name, customer.last_name, c_addresse.city, c_addresse.street, c_addresse.number, c_addresse.zip_code, package_mail.type, postoffice.deposited_date
FROM customer
JOIN c_addresse on c_addresse.c_addresse_id = customer.fk_c_addresse_id
JOIN package_mail on package_mail.fk_customer_id = customer.customer_id
JOIN postoffice on postoffice.fk_item_id = package_mail.item_id
WHERE postoffice.deposited_date BETWEEN '2020-05-11 15:30:00' AND '2020-07-01 16:01:00';

/* Show sender(customer), deposited date, delivery_date and who is a recipient */

SELECT customer.first_name, customer.last_name, postoffice.deposited_date, recipient.delivery_time, recipient.first_name, recipient.last_name
FROM recipient
JOIN warehouse on warehouse.warehouse_id = recipient.fk_warehouse_id
JOIN postoffice on postoffice.postoffice_id = warehouse.fk_postoffice_id
JOIN package_mail on package_mail.item_id = postoffice.fk_item_id
JOIN customer on customer.customer_id = package_mail.fk_customer_id;






