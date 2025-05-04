CREATE DATABASE movie_rental_db;
USE movie_rental_db;

CREATE TABLE customers (
	customer_id INT PRIMARY KEY, 
	customer_name VARCHAR (250),
	customer_type ENUM ('Regular', 'Premium') NOT NULL,
	email VARCHAR (100),
	phone VARCHAR (20)
);

CREATE TABLE movies (
	movie_id INT PRIMARY KEY,
	movie_title VARCHAR (100),
	genre VARCHAR(255),
	director VARCHAR (100),
	rental_date DATE,
    return_date DATE
);

CREATE TABLE sales (
	sale_id INT PRIMARY KEY,
	customer_id INT,
	movie_id INT,
	rental_price DECIMAL (10, 2),
	rental_status ENUM ('Returned', 'Pending') NOT NULL,
	payment_method ENUM ('Credit Card', 'Debit Card', 'Paypal') NOT NULL,
	discount_code VARCHAR (100),
	discount_amount DECIMAL (10, 2),
	late_fee DECIMAL (10, 2),
	FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
	FOREIGN KEY (movie_id) REFERENCES movies(movie_id)
);

INSERT INTO customers (customer_id, customer_name, customer_type, email, phone) VALUES
(1, 'Stefano Colafranceschi', 'Regular','stefano.colafranceschi@gmail.com', '5404169211'),
(2, 'Orlane Houzet', 'Regular', 'orlane.houzet@gmail.com', '555-5678'),
(3, 'Juliette Colafranceschi', 'Regular', 'juliette.colafranceschi@gmail.com', '555-1234'),
(4, 'James Colafranceschi', 'Premium', 'jmv.colafranceschi@gmail.com', '555-4321'),
(5, 'Josh Colafranceschi', 'Regular', 'tetto@cern.ch', '555-1234'),
(6, 'Ettore Maiorana', 'Regular','maiorana@lnf.infn.it', '555-8765'),
(7, 'Albert Einstein', 'Premium', 'eistein@princeton.edu', '555-5555');


INSERT INTO movies (movie_id, movie_title, genre, director, rental_date, return_date) VALUES
(1, 'The Matrix', 'Sci-Fi','Wachowski', '2024-11-01','2024-11-05'),
(2, 'Titanic', 'Drama', 'Cameron', '2024-11-02', '2024-11-06'),
(3, 'Luca', '', 'Casarosa', '2024-11-02', '2024-11-05'),
(4, 'Cars', 'Kid', 'Lasseter', '2024-11-03', '2024-11-07'),
(5, 'Paw Patrol', 'Kid', 'Brunker', '2024-11-04', '2024-11-08'),
(6, 'Particle Fever', 'Sci-Fi','Levinson', '2024-11-04', '2024-11-09'),
(7, 'Interstellar', 'Sci-Fi', 'Christopher Nolan', '2024-11-05', '2024-11-10');

INSERT INTO sales (sale_id, customer_id, movie_id, rental_price, rental_status, payment_method, discount_code, discount_amount, late_fee) VALUES
(1,1,1, 4.99, 'Returned','Credit Card', 'CS_GURU', 1.00, 0.5),
(2,2,2, 4.99, 'Returned', 'Debit Card', 'DISC10', 0.5, 0),
(3,3,3, 3.99, 'Returned', 'Credit Card', 'No Code Used.', 0, 0),
(4,4,4, 3.99, 'Returned', 'Paypal', 'No Code Used.', 0, 1.5),
(5,5,5, 3.99, 'Returned', 'Credit Card', 'DISC20', 1.00, 0),
(6,6,6, 4.99, 'Pending','Debit Card', 'No Code Used.', 0, 0),
(7,7,7, 3.99, 'Pending', 'Paypal', 'GENIUS1', 0.75, 0);





