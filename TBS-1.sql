--creation of the database
create database TicketBookingSystem
drop database TicketBookingSystem
--Creation of Venue table
CREATE TABLE Venue (
    venue_id INT PRIMARY KEY ,
    venue_name VARCHAR(50),
    address VARCHAR(50)
)
--Insertion of value into venue table
  INSERT INTO Venue  VALUES
(1, 'Eden Gardens', 'Kolkata'),
(2, 'Wankhede Stadium', 'Mumbai'),
(3, 'Rajiv Gandhi International Cricket Stadium', 'Hyderabad'),
(4, 'M. Chinnaswamy Stadium', 'Bengaluru'),
(5, 'Jawaharlal Nehru Stadium', 'Delhi'),
(6, 'Salt Lake Stadium', 'Kolkata'),
(7, 'Sathyam Cinemas', 'Chennai'),
(8, 'Prithvi Theatre', 'Mumbai'),
(9, 'M.A.Chidambaram Stadium', 'Chepauk'),
(10, 'EVP Cinemas', 'Chembarambakkam')

select * from Venue
--creation event table
CREATE TABLE [Event] (
    event_id INT PRIMARY KEY,
    event_name VARCHAR(50),
    event_date DATE,
    event_time TIME,
    venue_id INT,
    total_seats INT,
    available_seats INT,
    ticket_price DECIMAL(10, 2),
    event_type CHAR(10),
    booking_id INT,
	FOREIGN KEY (venue_id) REFERENCES Venue(venue_id)
)
-- altering the foreign column
ALTER TABLE [Event] ADD CONSTRAINT Event_BookingId_FK
FOREIGN KEY (booking_id) REFERENCES Booking(booking_id) 
--insertion of value into event table
INSERT INTO [Event] (event_id, event_name, event_date, event_time, venue_id, total_seats, available_seats, ticket_price, event_type, booking_id)
VALUES
(1, 'India vs Newzeland', '2024-05-01', '14:00:00', 1, 5000, 3400, 750.00, 'Sports', NULL),
(2, 'Pakistan vs Afghanistan', '2024-04-02', '15:00:00', 2, 3600, 3000, 500.00, 'Sports', NULL),
(3, 'VJ Antonys- Rain', '2024-07-03', '19:00:00', 3, 1000, 1000, 530.00, 'Concert', NULL),
(4, 'Deadpool', '2024-08-04', '20:00:00', 10, 400, 380, 150.00, 'Movie', NULL),
(5, 'RMD vs Barcelona', '2024-09-05', '18:00:00', 5, 3000, 2500, 800.00, 'Sport', NULL),
(6, 'Rahman Mania', '2024-01-06', '14:00:00', 6, 1000, 700, 2000.00, 'Concert', NULL),
(7, 'Wrestlemania 23', '2024-05-07', '15:00:00', 9, 6000, 5000, 5250.00, 'Sports', NULL),
(8, 'Avengers Endgame', '2024-05-08', '19:00:00', 8, 300, 300, 130.00, 'Movie', NULL),
(9, 'Srilanka vs Australia', '2024-06-09', '20:00:00', 9, 200, 150, 200.00, 'Sports', NULL),
(10, 'Goshal Nights', '2024-05-10', '18:00:00', 10, 300, 200, 380.00, 'Concert', NULL);
--inserting foreign key values at event table
UPDATE [Event]
SET booking_id = 
    CASE 
        WHEN event_id = 1 THEN 1
        WHEN event_id = 2 THEN 2
        WHEN event_id = 3 THEN 3
        WHEN event_id = 4 THEN 4
        WHEN event_id = 5 THEN 5
        WHEN event_id = 6 THEN 6
        WHEN event_id = 7 THEN 7
        WHEN event_id = 8 THEN 8
        WHEN event_id = 9 THEN 9
        WHEN event_id = 10 THEN 10
    END
WHERE event_id BETWEEN 1 AND 10;

select * from [Event]
--creating customer table
CREATE TABLE Customer (
    customer_id INT PRIMARY KEY ,
    customer_name VARCHAR(50),
    email VARCHAR(50),
    phone_number BIGINT,
    booking_id INT
)
--altering the foreign key at customer table
ALTER TABLE Customer ADD CONSTRAINT Customer_BookingId_FK
FOREIGN KEY (booking_id) REFERENCES Booking(booking_id) 
--inserting value into customer table
INSERT INTO Customer (customer_id, customer_name, email, phone_number, booking_id)
VALUES
(1, 'ron Doe', 'ron.doe@example.com', 1234567890, NULL),
(2, 'Smith', 'smith@example.com', 2345678901, NULL),
(3, 'Johnson', 'johnson@example.com', 3456789012, NULL),
(4, 'Williams', 'williams@example.com', 4567890123, NULL),
(5, 'Brown', 'emily.brown@example.com', 5678901234, NULL),
(6, 'Michael', 'michael@example.com', 6789012345, NULL),
(7, 'Davis', 'davis@example.com', 7890123456, NULL),
(8, 'Garcia', 'garcia@example.com', 8901234567, NULL),
(9, 'Martinez', 'martinez@example.com', 9012345678, NULL),
(10, 'Rodriguez', 'rodriguez@example.com', 1023456789, NULL)
--updating foreign key values in customer table
UPDATE Customer
SET booking_id = 
    CASE 
        WHEN customer_id = 1 THEN 1
        WHEN customer_id = 2 THEN 2
        WHEN customer_id = 3 THEN 3
        WHEN customer_id = 4 THEN 4
        WHEN customer_id = 5 THEN 5
        WHEN customer_id = 6 THEN 6
        WHEN customer_id = 7 THEN 7
        WHEN customer_id = 8 THEN 8
        WHEN customer_id = 9 THEN 9
        WHEN customer_id = 10 THEN 10
    END
WHERE customer_id BETWEEN 1 AND 10

select * from Customer
--creating booking table
CREATE TABLE Booking (
    booking_id INT PRIMARY KEY ,
    customer_id INT,
    event_id INT,
    num_tickets INT,
    total_cost INT,
    booking_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
    FOREIGN KEY (event_id) REFERENCES Event(event_id)
)
--inserting value into booking table
INSERT INTO Booking (booking_id, customer_id, event_id, num_tickets, total_cost, booking_date)
VALUES
(1,1, 1, 2, 1500, '2024-04-25'),
(2,2, 2, 3, 1500, '2024-03-26'),
(3,3, 3, 4, 2120, '2024-04-27'),
(4,4,4, 5, 750, '2024-04-28'),
(5,5, 5, 8, 6400, '2024-04-29'),
(6,6, 6, 4, 8000, '2024-04-30'),
(7,7, 7, 1, 5250, '2024-05-01'),
(8,8, 8, 3, 390, '2024-05-02'),
(9,9, 9, 5, 1000, '2024-05-03'),
(10,10, 10, 2, 760, '2024-05-04');

select * from Booking

--T-1
--2.Write a SQL query to list all Events.
  SELECT * FROM [EVENT]

  --3.Write a SQL query to select events with available tickets.
  SELECT event_name,available_seats FROM [Event] 
  where available_seats>0

  --4.Write a SQL query to select events name partial match with ‘cup’.
  SELECT event_id,event_name FROM [Event] 
  WHERE event_name LIKE '%cup%'

  --5.Write a SQL query to select events with ticket price range is between 1000 to 2500.
  SELECT event_id,event_name,event_type FROM [Event] 
  WHERE ticket_price BETWEEN 1000 AND 2500

  --6.Write a SQL query to retrieve events with dates falling within a specific range.
  SELECT * FROM [Event] 
  WHERE event_date BETWEEN '2024-02-03' AND'2024-03-05'

  --7.Write a SQL query to retrieve events with available tickets that also have "Concert" in their name.
  SELECT * FROM [Event] 
  WHERE available_seats>0 AND event_type='Concert'

  --8.Write a SQL query to retrieve users in batches of 5, starting from the 6th user.
  SELECT * FROM [Event] 
  ORDER BY event_id OFFSET 5 ROWS FETCH NEXT 5 ROWS ONLY
  
  --9.Write a SQL query to retrieve bookings details contains booked no of ticket more than 4.
  SELECT * FROM Booking 
  WHERE num_tickets > 4

  --10.Write a SQL query to retrieve customer information whose phone number end with ‘000’.
  SELECT * FROM Customer 
  WHERE phone_number LIKE ('%000')

  --11.Write a SQL query to retrieve the events in order whose seat capacity more than 15000.
  SELECT * FROM [Event] 
  WHERE total_seats > 15000

  --12.Write a SQL query to select events name not start with ‘x’, ‘y’, ‘z’
  SELECT * FROM [Event] 
  WHERE event_name NOT LIKE 'x%' 
  AND event_name NOT LIKE 'y%' 
  AND event_name NOT LIKE 'z%'

  --T-3
  --1.Write a SQL query to List Events and Their Average Ticket Prices.
  SELECT e.event_type, AVG(ticket_price) AS Average_Price 
  FROM [Event] e
  join Booking b
  on e.event_id = b.event_id
  GROUP BY event_type
  order by Average_Price desc

  --2.Write a SQL query to Calculate the Total Revenue Generated by Events.
SELECT e.event_type, SUM(b.total_cost) AS Total_Revenue
FROM Booking b
JOIN [Event] e 
ON b.event_id = e.event_id
GROUP BY e.event_type
ORDER BY Total_Revenue;

  --3.Write a SQL query to find the event with the highest ticket sales.
  SELECT TOP 1 e.event_id, e.event_name, e.event_type, b.num_tickets
  FROM [EVENT] e 
  JOIN Booking b 
  ON e.event_id = b.event_id 
  ORDER BY b.num_tickets DESC 

  --4.Write a SQL query to Calculate the Total Number of Tickets Sold for Each Event.
  SELECT e.event_type, SUM(b.num_tickets) AS TicketsSold
  FROM Booking b
  JOIN [Event] e
  ON b.event_id = e.event_id 
  GROUP BY e.event_type
  order by TicketsSold desc

  --5.Write a SQL query to Find Events with No Ticket Sales.
  SELECT e.event_type, SUM(b.num_tickets) AS EmptyTicket
  FROM [Event] e 
  JOIN Booking b 
  ON e.event_id = b.event_id 
  WHERE b.num_tickets IS NULL
  group BY e.event_type 

  --6.Write a SQL query to Find the User Who Has Booked the Most Tickets.
  SELECT TOP 1 c.customer_id, c.customer_name, SUM(b.num_tickets) AS Total_ticket
  FROM Customer c 
  JOIN Booking b
  ON c.customer_id = b.customer_id
  GROUP BY c.customer_id, c.customer_name
  ORDER BY Total_ticket DESC

  --7.Write a SQL query to List Events and the total number of tickets sold for each month.
  SELECT e.event_id, e.event_name, e.event_type, SUM(b.num_tickets) AS Total_ticket, MONTH(b.booking_date) AS [Month]
  FROM [Event] e 
  JOIN Booking b 
  ON e.event_id = b.event_id
  GROUP BY e.event_id, e.event_name,e.event_type ,MONTH(b.booking_date) 
  ORDER BY Total_ticket

  --8.Write a SQL query to calculate the average Ticket Price for Events in Each Venue.
 SELECT v.venue_id, v.venue_name, AVG(e.ticket_price) AS avg_ticket_price
FROM Venue v
JOIN [Event] e ON v.venue_id = e.venue_id
JOIN Booking b ON e.event_id = b.event_id
GROUP BY v.venue_id, v.venue_name;


  --9.Write a SQL query to calculate the total Number of Tickets Sold for Each Event Type.
  SELECT e.event_type, SUM(b.num_tickets) AS Tickets_Sold
  FROM [Event] e
  JOIN Booking b 
  ON e.event_id = b.event_id
  GROUP BY e.event_type
  order by Tickets_Sold desc

  --10.Write a SQL query to calculate the total Revenue Generated by Events in Each Year.
  SELECT e.event_type, SUM(b.total_cost ) AS Total_Revenue, YEAR(e.event_date) AS [Year]
  FROM Booking b
  JOIN [Event]e
  ON b.event_id = e.event_id
  GROUP BY e.event_type, YEAR(e.event_date)
  order by Total_Revenue

  --11.Write a SQL query to list users who have booked tickets for multiple events.
  SELECT c.customer_id, c.customer_name 
  FROM Customer c
  JOIN Booking b 
  ON c.customer_id = b.customer_id
  GROUP BY c.customer_id, c.customer_name
  having COUNT(b.booking_id) > 1

  --12.Write a SQL query to calculate the Total Revenue Generated by Events for Each User.
  SELECT c.customer_id,c.customer_name,SUM(b.total_cost) AS Total_revenue
  FROM Customer c
  JOIN Booking b
  ON c.customer_id = b.customer_id
  GROUP BY c.customer_name,c.customer_id
  order by Total_revenue

  select * from Booking
  --13.Write a SQL query to calculate the Average Ticket Price for Events in Each Category and Venue.
  SELECT e.event_name,v.venue_name, e.event_type, AVG(e.ticket_price) AS AVG_Price
  FROM Venue v
  JOIN [Event] e
  ON v.venue_id = e.venue_id
  GROUP BY v.venue_name,e.event_type,e.event_name
  order by AVG_Price desc

  --14.Write a SQL query to list Users and the Total Number of Tickets They've Purchased in the Last 30 Days.
  SELECT c.customer_name, SUM(b.num_tickets) AS Total_Ticket_purchase
  FROM Customer c
  JOIN Booking b
  ON c.customer_id = b.customer_id
  WHERE b.booking_date BETWEEN DATEADD(DAY, -30, GETDATE()) AND GETDATE()
  GROUP BY c.customer_name

 -- T-4
  --1.Calculate the Average Ticket Price for Events in Each Venue Using a Subquery.
  SELECT v.venue_name,
  (SELECT AVG(ticket_price)-- taking avg as the attribute in this query
  FROM [Event] e 
  WHERE e.venue_id = v.venue_id ) AS Avg_Ticket
  FROM Venue v 

  --2.Find Events with More Than 50% of Tickets Sold using subquery.
 SELECT event_id, event_name ,event_type
FROM [Event] e
WHERE (SELECT SUM(num_tickets) 
FROM Booking b
WHERE b.event_id = e.event_id) > (total_seats * 0.5)


  --3.Calculate the Total Number of Tickets Sold for Each Event.
SELECT event_id, event_name,
       (SELECT SUM(num_tickets)
	   FROM Booking b
	   WHERE b.event_id = e.event_id) AS total_tickets_sold
FROM [Event] e;


/*select e.event_type ,sum(b.num_tickets) as total_tickets
from [Event] e 
join Booking b 
on e.booking_id = b.booking_id
group by e.event_type*/

 --4.Find Users Who Have Not Booked Any Tickets Using a NOT EXISTS Subquery.
 SELECT c.customer_id, c.customer_name 
 FROM Customer c 
 WHERE  not EXISTS 
 (SELECT b.customer_id 
 FROM Booking b
 WHERE b.customer_id = c.customer_id)

 --5.List Events with No Ticket Sales Using a NOT IN Subquery.
 SELECT e.event_id, e.event_name
 FROM [Event] e
 WHERE e.event_id NOT IN 
 (SELECT b.event_id 
 FROM Booking b)
	
 --6.Calculate the Total Number of Tickets Sold for Each Event Type Using a Subquery in the FROM Clause.
SELECT e.event_type, SUM(b.num_tickets) AS total_tickets_sold
FROM (SELECT DISTINCT event_id, event_type FROM [Event] ) e
JOIN Booking b 
ON e.event_id = b.event_id
GROUP BY e.event_type
order by total_tickets_sold


 --7.Find Events with Ticket Prices Higher Than the Average Ticket Price Using a Subquery in the WHERE Clause.
 SELECT event_name, event_type ,ticket_price ,avg(ticket_price) as cmpavg
 FROM [Event]
 WHERE ticket_price > (SELECT AVG(ticket_price) FROM [Event])
 group by event_name, event_type ,ticket_price

 --8.Calculate the Total Revenue Generated by Events for Each User Using a Correlated Subquery.
 SELECT customer_name ,(
 SELECT SUM(total_cost) 
 FROM Booking b 
 WHERE b.customer_id = c.customer_id) AS Tot_Revenue
 FROM Customer c 

 --9.List Users Who Have Booked Tickets for Events in a Given Venue Using a Subquery in the WHERE Clause.
 SELECT customer_name 
 FROM Customer 
 WHERE customer_id IN (
 SELECT b.customer_id 
 FROM Booking b 
 WHERE b.event_id IN(
 SELECT event_id FROM [EVENT] WHERE venue_id = (
 SELECT venue_id FROM Venue WHERE venue_name = 'Salt Lake Stadium')))

 --10. Calculate the Total Number of Tickets Sold for Each Event Category Using a Subquery with GROUP BY.
 SELECT event_type, SUM(total_tickets_) AS total_tickets_sold
FROM (SELECT e.event_type, SUM(b.num_tickets) AS total_tickets_
      FROM [Event] e
      JOIN Booking b ON e.event_id = b.event_id
      GROUP BY e.event_type) AS subdata
GROUP BY event_type
order by total_tickets_sold


 --11.Find Users Who Have Booked Tickets for Events in each Month Using a Subquery with DATE_FORMAT.
 /*SELECT c.customer_id, c.customer_name, DATEName(month,b.booking_date) AS booking_month,
       SUM(num_tickets) AS total_tickets_booked
FROM Customer c
JOIN Booking b ON c.customer_id = b.customer_id
GROUP BY c.customer_id, c.customer_name, DATEName(month,b.booking_date)*/

SELECT (SELECT c.customer_name 
 FROM CUSTOMER c 
 WHERE c.customer_id = b.customer_id) AS customer_name, 
 DATENAME(MONTH,b.booking_date) AS [MONTH] 
 FROM Booking b
 ORDER BY MONTH(b.booking_date)

 --12.Calculate the Average Ticket Price for Events in Each Venue Using a Subquery
 SELECT v.venue_name, (
 SELECT AVG(e.ticket_price)
 FROM [Event] e 
 WHERE e.venue_id = v.venue_id) AS AVG_price
 FROM Venue v



