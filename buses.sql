PRAGMA foreign_keys = TRUE;

-- .mode column -- present data as table --


/* SQL Data Definition

Creation of tables for every schema defined in Task 1.

The values inserted are fictional.

Note that the order of tables matters because of foreign key constraints.
*/

CREATE TABLE staff (
	id NUMERIC (4,0) NOT NULL,
	staff_name VARCHAR (100) NOT NULL,
	email VARCHAR (70),
	street VARCHAR (100) NOT NULL,
	city VARCHAR (100) NOT NULL,
	postcode VARCHAR (10) NOT NULL,
	PRIMARY KEY (id)
);

INSERT INTO staff
VALUES
    (1001, 'MacLeod', 'EilidhMacLeod92@gmail.com', '14 Highland Avenue', 'Aberdeen', 'AB10 6NP'),
    (1002, 'Cameron', 'c.cameron@outlook.com', '32 Castle Street', 'Edinburgh', 'EH2 3AY'),
    (1003, 'Fraser', 'FionaFraser@yahoo.com', '8 Lochside Drive', 'Glasgow', 'G2 7RJ'),
    (1004, 'Sinclair', 'Angus.S@hotmail.com', '45 Glenview Terrace', 'Aberdeen', 'AB10 6NP'),
    (1005, 'Drummond', 'drummi@gmail.com', '21 Riverside Road', 'Edinburgh', 'EH2 3AY'),
    (1006, 'MacKenzie', 'CallumMacKenzie@hotmail.com', '9 Braemar Crescent', 'Stirling', 'FK8 2LP'),
    (1007, 'Guthrie', 'mg75@icloud.com', '15 Castlehill Crescent', 'Edinburgh', 'EH2 3AY'),
    (1008, 'Douglas', 'Brodie.Douglas@yahoo.com', '12 Heather Lane', 'Fort William', 'PH33 6TU'),
    (1009, 'Ross', 'IslaRoss@gmail.com', '56 Thistle Street', 'Kirkwall', 'KW15 1DW'),
    (1010, 'Campbell', 'Alasdair.Campbell@outlook.com', '27 Ben Nevis Avenue', 'Aviemore', 'PH22 1PY'),
    (2001, 'MacGregor', 'mg65@yahoo.com', '6 Dunrobin Place', 'Thurso', 'KW14 7HP'),
    (2002, 'MacNeil', 'mickymacneil@gmail.com', '18 Glencoe Street', 'Dundee', 'DD1 4LB'),
    (2003, 'MacIntosh', 'Ainsley.MacIntosh@hotmail.com', '3 Seaview Place', 'Oban', 'PA34 4RR'),
    (2004, 'Wallace', 'walli99@gmail.com', '23 Skye Court', 'Inverness', 'IV51 9PJ'),
    (2005, 'MacRae', 'aileen.macrae@icloud.com', '35 Paisley Road', 'Motherwell', 'ML1 2BE'),
    (2006, 'Buchanan', 'Iona.Buchanan@yahoo.com', '50 Borders Lane', 'Galashiels', 'TD1 3DS'),
    (2007, 'MacFarlane', 'Moira.MacFarlane@outlook.com', '11 Loch Ness Terrace', 'Inverness', 'IV63 6TX'),
    (2008, 'Sinclair', 'sinclair@gmail.com', '2 Orkney Close', 'Edinburgh', 'EH2 3AY'),
    (2009, 'MacNeil', 'MacNeil88@hotmail.com', '8 Paisley Road', 'Stirling', 'FK8 3YF'),
    (2010, 'MacKenzie', 'mickmack76@gmail.com', '21 Seagate Street', 'Dundee', 'DD1 4LB')
;

CREATE TABLE phone (
	id NUMERIC (4,0) NOT NULL,
	type VARCHAR (10),
	phone_number VARCHAR (20) NOT NULL,
	PRIMARY KEY (id, phone_number),
	FOREIGN KEY (id) references staff (id)
);

INSERT INTO phone
VALUES
    (1001, 'mobile', '+44 157833 1001'),
    (1001, 'landline', '+44 12345 1001'),
    (1002, 'mobile', '+44 157815 1002'),
    (1003, 'mobile', '+44 157844 1003'),
    (1003, 'landline', '+44 56789 1003'),
    (1004, 'mobile', '+44 157825 1004'),
    (1004, 'landline', '+44 13579 1004'),
    (1005, 'mobile', '+44 157833 1005'),
    (1006, 'mobile', '+44 157815 1006'),
    (1006, 'landline', '+44 98765 1006'),
    (1007, 'mobile', '+44 157815 1007'),
    (1008, 'mobile', '+44 157833 1008'),
    (1009, 'mobile', '+44 157844 1009'),
    (1010, 'mobile', '+44 157842 1010'),
    (1010, 'landline', '+44 90796 1010'),
    (2001, 'mobile', '+44 157891 2001'),
    (2002, 'mobile', '+44 157891 2002'),
    (2003, 'mobile', '+44 157892 2003'),
    (2003, 'landline', '+44 34567 2003'),
    (2004, 'mobile', '+44 157890 2004'),
    (2005, 'mobile', '+44 157893 2005'),
    (2006, 'mobile', '+44 157894 2006'),
    (2007, 'mobile', '+44 157890 2007'),
    (2008, 'mobile', '+44 157890 2008'),
    (2009, 'mobile', '+44 157892 2009'),
    (2010, 'mobile', '+44 157891 2010')
;

CREATE TABLE station (
	station_name VARCHAR (100) NOT NULL,
	town VARCHAR(100) NOT NULL,
	id NUMERIC (4,0) NOT NULL,
	PRIMARY KEY (station_name),
	FOREIGN KEY (id) references staff (id)
);

INSERT INTO station
VALUES 
    ('Buchanan Gardens', 'St Andrews', 1001),
    ('St Andrews Bus Station', 'St Andrews', 1001),
    ('Seagate Bus Station', 'Dundee', 1002),
    ('Edinburgh Bus Station', 'Edinburgh', 1003),
    ('Glasgow Bus Station', 'Glasgow', 1004),
    ('Aberdeen Central Railway Station', 'Aberdeen', 1005),
    ('Inverness Bus Station', 'Inverness', 1006),
    ('Perth Bus Station', 'Perth', 1007),
    ('Stirling Bus Station', 'Stirling', 1008),
    ('Leuchars Railway Station', 'Leuchars', 1009)
;
	

CREATE TABLE service (
	service_number VARCHAR (3) NOT NULL,
	origin_station_name VARCHAR (100) NOT NULL,
	destination_station_name VARCHAR (100) NOT NULL,
	PRIMARY KEY (service_number),
	FOREIGN KEY (origin_station_name) references station (station_name),
	FOREIGN KEY (destination_station_name) references station (station_name)
);

INSERT INTO service
VALUES
	("99A", "Buchanan Gardens", "Seagate Bus Station"),
	("99B", "Seagate Bus Station", "Buchanan Gardens"),
	("X60", "Buchanan Gardens", "Edinburgh Bus Station"),
	("X24", "Buchanan Gardens", "Glasgow Bus Station"),
	("X56", "Edinburgh Bus Station", "Glasgow Bus Station"),
	("X30", "Edinburgh Bus Station", "Aberdeen Central Railway Station"),
	("12", "Seagate Bus Station", "Aberdeen Central Railway Station"),
	("X44", "Glasgow Bus Station", "Inverness Bus Station"),
	("67", "Perth Bus Station", "St Andrews Bus Station"),
	("15", "Stirling Bus Station", "Buchanan Gardens"),
	("X89", "Inverness Bus Station", "Aberdeen Central Railway Station")
;


CREATE TABLE stop (
	stop_name VARCHAR (100),
	PRIMARY KEY (stop_name)
);

INSERT INTO stop
VALUES
	("St Andrews Bus Station"),
	("Buchanan Gardens"),
	("Seagate Bus Station"),
	("Edinburgh Bus Station"),
	("Glasgow Bus Station"),
	("Aberdeen Central Railway Station"),
	("Inverness Bus Station"),
	("Perth Bus Station"),
	("Stirling Bus Station"),
	("Leuchars Railway Station"),
	("Arbroath Bus Station"),
	("Cowie Bridge"),
	("Fort William Rail Station"),
	("Cairngorm Hotel"),
	("Edinburgh Airport")
;	
	
CREATE TABLE service_time (
	service_number VARCHAR (3) NOT NULL,
	start_time CHAR (5) NOT NULL,
	PRIMARY KEY (service_number, start_time),
	FOREIGN KEY (service_number) references service (service_number)
);

INSERT INTO service_time
VALUES
	("99A", "06:30"),
	("99A", "09:30"),
	("99A", "16:30"),
	("99A", "20:30"),
	
	("99B", "07:30"),
	("99B", "10:30"),
	("99B", "17:30"),
	("99B", "21:30"),
	
	("X60", "07:00"),
	("X60", "10:00"),
	("X60", "15:00"),
	("X60", "21:00"),
	
	("X24", "05:00"),
	("X24", "09:00"),
	("X24", "13:00"),
	("X24", "22:00"),
	
	("X56", "08:00"),
	("X56", "18:00"),
	
	("X30", "08:15"),
	("X30", "10:15"),
	("X30", "20:15"),
	
	("12", "07:30"),
	("12", "10:30"),
	("12", "17:30"),
	("12", "21:30"),
	
	("X44", "06:45"),
	("X44", "10:00"),
	("X44", "17:45"),
	
	("67", "06:30"),
	("67", "10:00"),
	("67", "20:00"),
	
	("15", "10:30"),
	("15", "16:30"),
	
	("X89", "09:30"),
	("X89", "11:30"),
	("X89", "15:30"),
	("X89", "19:30")
;

CREATE TABLE manager (
	id VARCHAR (4) NOT NULL,
	annual_salary VARCHAR (5),
	PRIMARY KEY (id),
	FOREIGN KEY (id) references staff (id)
);

INSERT INTO manager
VALUES
	("1001", "71000"),
	("1002", "67000"),
	("1003", "59000"),
	("1004", "58000"),
	("1005", "55000"),
	("1006", "62000"),
	("1007", "55000"),
	("1008", "60000"),
	("1009", "66000"),
	("1010", "59000")
;

CREATE TABLE driver (
	id VARCHAR (4) NOT NULL,
	hourly_salary NUMERIC (4,2),
	PRIMARY KEY (id),
	FOREIGN KEY (id) references staff (id)
);

INSERT INTO driver
VALUES
	("2001", "15.25"),
	("2002", "15.25"),
	("2003", "15.25"),
	("2004", "15.80"),
	("2005", "15.80"),
	("2006", "15.80"),
	("2007", "16.90"),
	("2008", "16.90"),
	("2009", "17.50"),
	("2010", "17.50")
;

CREATE TABLE drives (
	service_number VARCHAR (3) NOT NULL,
	id VARCHAR (4) NOT NULL,
	hours_driven VARCHAR (6),
	PRIMARY KEY (service_number, id),
	FOREIGN KEY (service_number) references service (service_number),
	FOREIGN KEY (id) references staff (id)
);

INSERT INTO drives
VALUES
	("99A", "2001", "63.00"),
	-- ("99B", "2001", "41.00"), 	line 99B is currently out of order
	("X60", "2001", "91.00"),
	-- ("99A", "2002", "26.00"),	driver 2002 is currently ill and does not drive
	-- ("99B", "2002", "26.00"),
	-- ("X60", "2002", "102.00"),
	-- ("X24", "2002", "19.00"),
	("X60", "2003", "65.00"),
	("X24", "2003", "105.00"),
	("X56", "2003", "10.50"),
	("X56", "2004", "103.50"),
	("X30", "2004", "42.50"),
	("X56", "2005", "50.00"),
	("X30", "2005", "38.00"),
	("12", "2006", "152.00"),
	("X44", "2007", "66.00"),
	("67", "2007", "98.00"),
	("12", "2008", "31.00"),
	("X44", "2008", "75.00"),
	("67", "2009", "114.00"),
	("15", "2009", "58.00"),
	("15", "2010", "21.00"),
	("X89", "2010", "163.00")
;

CREATE TABLE arrives (
	service_number VARCHAR (3) NOT NULL,
	stop_name VARCHAR (100) NOT NULL,
	start_time VARCHAR (5) NOT NULL,
	arrival_time VARCHAR (5) NOT NULL,
	fare_from_origin NUMERIC (4,2),
	PRIMARY KEY (service_number, stop_name, start_time),
	FOREIGN KEY (service_number, start_time) references service_time (service_number, start_time),
	FOREIGN KEY (stop_name) references stop (stop_name)
	
);

INSERT INTO arrives
VALUES
	-- service line 99A --
	("99A", "Buchanan Gardens", "06:30", "06:30", "01.50"),
	("99A", "Buchanan Gardens", "09:30", "09:30", "01.50"),
	("99A", "Buchanan Gardens", "16:30", "16:30", "01.50"),
	("99A", "Buchanan Gardens", "20:30", "20:30", "01.50"),
	
	("99A", "Leuchars Railway Station", "06:30", "06:45", "01.50"),
	("99A", "Leuchars Railway Station", "09:30", "09:45", "01.50"),
	("99A", "Leuchars Railway Station", "16:30", "16:45", "01.50"),
	("99A", "Leuchars Railway Station", "20:30", "20:45", "01.50"),

	("99A", "Seagate Bus Station", "06:30", "07:00", "01.50"),
	("99A", "Seagate Bus Station", "09:30", "10:00", "01.50"),
	("99A", "Seagate Bus Station", "16:30", "17:00", "01.50"),
	("99A", "Seagate Bus Station", "20:30", "21:00", "01.50"),
	
	-- service line 99B --
	("99B", "Seagate Bus Station", "07:30", "07:30", "01.50"),
	("99B", "Seagate Bus Station", "10:30", "10:30", "01.50"),
	("99B", "Seagate Bus Station", "17:30", "17:30", "01.50"),
	("99B", "Seagate Bus Station", "21:30", "21:30", "01.50"),
	
	("99B", "Leuchars Railway Station", "07:30", "07:45", "01.50"),
	("99B", "Leuchars Railway Station", "10:30", "10:45", "01.50"),
	("99B", "Leuchars Railway Station", "17:30", "17:45", "01.50"),
	("99B", "Leuchars Railway Station", "21:30", "21:45", "01.50"),

	("99B", "Buchanan Gardens", "07:30", "08:00", "01.50"),
	("99B", "Buchanan Gardens", "10:30", "11:00", "01.50"),
	("99B", "Buchanan Gardens", "17:30", "18:00", "01.50"),
	("99B", "Buchanan Gardens", "21:30", "22:00", "01.50"),
	
	-- service line X60 --
	("X60", "Buchanan Gardens", "07:00", "07:00", "01.50"),
	("X60", "Buchanan Gardens", "10:00", "10:00", "01.50"),
	("X60", "Buchanan Gardens", "15:00", "15:00", "01.50"),
	("X60", "Buchanan Gardens", "21:00", "21:00", "01.50"),
	
	("X60", "Leuchars Railway Station", "07:00", "07:15", "09.00"),
	("X60", "Leuchars Railway Station", "10:00", "10:15", "09.00"),
	("X60", "Leuchars Railway Station", "15:00", "15:15", "09.00"),
	("X60", "Leuchars Railway Station", "21:00", "21:15", "09.00"),

	("X60", "Edinburgh Bus Station", "07:00", "09:00", "09.00"),
	("X60", "Edinburgh Bus Station", "10:00", "12:00", "09.00"),
	("X60", "Edinburgh Bus Station", "15:00", "17:00", "09.00"),
	("X60", "Edinburgh Bus Station", "21:00", "23:00", "09.00"),
	
	-- service line X24 --
	("X24", "Buchanan Gardens", "05:00", "05:30", "03.00"),
	("X24", "Buchanan Gardens", "09:00", "09:30", "03.00"),
	("X24", "Buchanan Gardens", "13:00", "13:30", "03.00"),
	("X24", "Buchanan Gardens", "22:00", "22:30", "03.00"),
	
	("X24", "Seagate Bus Station", "05:00", "05:30", "09.00"),
	("X24", "Seagate Bus Station", "09:00", "09:30", "09.00"),
	("X24", "Seagate Bus Station", "13:00", "13:30", "09.00"),
	("X24", "Seagate Bus Station", "22:00", "22:30", "09.00"),

	("X24", "Glasgow Bus Station", "05:00", "08:00", "09.00"),
	("X24", "Glasgow Bus Station", "09:00", "12:00", "09.00"),
	("X24", "Glasgow Bus Station", "13:00", "16:00", "09.00"),
	("X24", "Glasgow Bus Station", "22:00", "01:00", "09.00"),
	
	-- service line X56 --
	("X56", "Edinburgh Bus Station", "08:00", "08:00", "04.00"),
	("X56", "Edinburgh Bus Station", "18:00", "18:00", "04.00"),
	
	("X56", "Stirling Bus Station", "08:00", "09:00", "04.00"),
	("X56", "Stirling Bus Station", "18:00", "19:00", "04.00"),

	("X56", "Glasgow Bus Station", "08:00", "10:00", "04.00"),
	("X56", "Glasgow Bus Station", "18:00", "20:00", "04.00"),
	
	-- service line X30 --
	("X30", "Edinburgh Bus Station", "08:15", "08:15", "11.00"),
	("X30", "Edinburgh Bus Station", "10:15", "10:15", "11.00"),
	("X30", "Edinburgh Bus Station", "20:15", "20:15", "11.00"),
	
	("X30", "Buchanan Gardens", "08:15", "09:30", "11.00"),
	("X30", "Buchanan Gardens", "10:15", "11:30", "11.00"),
	("X30", "Buchanan Gardens", "20:15", "21:30", "11.00"),

	("X30", "Aberdeen Central Railway Station", "08:15", "10:45", "11.00"),
	("X30", "Aberdeen Central Railway Station", "10:15", "12:45", "11.00"),
	("X30", "Aberdeen Central Railway Station", "20:15", "22:45", "11.00"),
	
	-- service line 12 --
	("12", "Seagate Bus Station", "07:30", "07:30", "04.00"),
	("12", "Seagate Bus Station", "10:30", "10:30", "04.00"),
	("12", "Seagate Bus Station", "17:30", "17:30", "04.00"),
	("12", "Seagate Bus Station", "21:30", "21:30", "04.00"),
	
	("12", "Arbroath Bus Station", "07:30", "08:15", "04.00"),
	("12", "Arbroath Bus Station", "10:30", "11:15", "04.00"),
	("12", "Arbroath Bus Station", "17:30", "18:15", "04.00"),
	("12", "Arbroath Bus Station", "21:30", "22:15", "04.00"),
	
	("12", "Cowie Bridge", "07:30", "08:45", "04.00"),
	("12", "Cowie Bridge", "10:30", "11:45", "04.00"),
	("12", "Cowie Bridge", "17:30", "18:45", "04.00"),
	("12", "Cowie Bridge", "21:30", "22:45", "04.00"),

	("12", "Aberdeen Central Railway Station", "07:30", "09:30", "04.00"),
	("12", "Aberdeen Central Railway Station", "10:30", "12:30", "04.00"),
	("12", "Aberdeen Central Railway Station", "17:30", "19:30", "04.00"),
	("12", "Aberdeen Central Railway Station", "21:30", "23:30", "04.00"),
	
	-- service line X44 --
	("X44", "Glasgow Bus Station", "06:45", "06:45", "10.00"),
	("X44", "Glasgow Bus Station", "10:00", "10:00", "10.00"),
	("X44", "Glasgow Bus Station", "17:45", "17:45", "10.00"),
	
	("X44", "Fort William Rail Station", "06:45", "08:30", "07.00"),
	("X44", "Fort William Rail Station", "10:00", "11:45", "07.00"),
	("X44", "Fort William Rail Station", "17:45", "19:30", "07.00"),

	("X44", "Inverness Bus Station", "06:45", "10:00", "07.00"),
	("X44", "Inverness Bus Station", "10:00", "13:00", "07.00"),
	("X44", "Inverness Bus Station", "17:45", "21:00", "07.00"),

	-- service line 67 --
	("67", "Perth Bus Station", "06:30", "06:30", "06.00"),
	("67", "Perth Bus Station", "10:00", "10:00", "06.00"),
	("67", "Perth Bus Station", "20:00", "20:00", "06.00"),
	
	("67", "Leuchars Railway Station", "06:30", "07:00", "01.50"),
	("67", "Leuchars Railway Station", "10:00", "10:30", "01.50"),
	("67", "Leuchars Railway Station", "20:00", "20:30", "01.50"),

	("67", "St Andrews Bus Station", "06:30", "07:30", "01.50"),
	("67", "St Andrews Bus Station", "10:00", "11:00", "01.50"),
	("67", "St Andrews Bus Station", "20:00", "21:00", "01.50"),
	
	-- service line 15 --
	("15", "Stirling Bus Station", "10:30", "10:30", "09.00"),
	("15", "Stirling Bus Station", "16:30", "16:30", "09.00"),
	
	("15", "Perth Bus Station", "10:30", "11:30", "09.00"),
	("15", "Perth Bus Station", "16:30", "17:30", "09.00"),
	
	("15", "Seagate Bus Station", "10:30", "12:00", "09.00"),
	("15", "Seagate Bus Station", "16:30", "18:00", "09.00"),

	("15", "Buchanan Gardens", "10:30", "12:30", "09.00"),
	("15", "Buchanan Gardens", "16:30", "18:30", "09.00"),
	
	-- service line X89 --
	("X89", "Inverness Bus Station", "09:30", "09:30", "12.00"),
	("X89", "Inverness Bus Station", "11:30", "11:30", "12.00"),
	("X89", "Inverness Bus Station", "15:30", "15:30", "12.00"),
	("X89", "Inverness Bus Station", "19:30", "19:30", "12.00"),
	
	("X89", "Cairngorm Hotel", "09:30", "10:30", "12.00"),
	("X89", "Cairngorm Hotel", "11:30", "12:30", "12.00"),
	("X89", "Cairngorm Hotel", "15:30", "16:30", "12.00"),
	("X89", "Cairngorm Hotel", "19:30", "20:30", "12.00"),

	("X89", "Aberdeen Central Railway Station", "09:30", "13:00", "12.00"),
	("X89", "Aberdeen Central Railway Station", "11:30", "15:00", "12.00"),
	("X89", "Aberdeen Central Railway Station", "15:30", "19:00", "12.00"),
	("X89", "Aberdeen Central Railway Station", "19:30", "23:00", "12.00")
;



/* SQL Data Manipulation 

Exemplary SQL queries to access and extract data from the database defined above: 
*/

-- For testing purposes, create queries to retrieve all data from all tables created:
	SELECT * FROM staff;
	SELECT * FROM phone;
	SELECT * FROM driver;
	SELECT * FROM manager;
	SELECT * FROM station;
	SELECT * FROM service;
	SELECT * FROM drives;
	SELECT * FROM service_time;
	SELECT * FROM arrives;
	SELECT * FROM stop;

-- 1. List all services which have "Seagate Bus Station" in Dundee as their origin:

	SELECT origin_station_name, service_number
	FROM service
	WHERE origin_station_name = "Seagate Bus Station";

-- 2. Calculate an average monthly salary of a bus station manager:
	
	SELECT AVG (annual_salary/12) AS "Average monthly salary of a bus station manager:"
	FROM manager;

-- 3. List the names of all drivers of services which have Edinburgh Bus Station in Edinburgh as their
-- origin or destination, in increasing order of the amount to be paid to them for the hours driven:	
	
	SELECT 
		staff.id, 
		staff.staff_name, 
		SUM ((driver.hourly_salary * drives.hours_driven)) AS "Salary"
	FROM 
		service
	JOIN 
		drives ON service.service_number = drives.service_number
	JOIN 
		staff ON drives.id = staff.id
	JOIN 
		driver ON staff.id = driver.id
	WHERE 
		(origin_station_name = "Edinburgh Bus Station") OR (destination_station_name = "Edinburgh Bus Station")
	GROUP BY 
		staff.id
	ORDER BY 
		Salary;

-- 4. List the manager of the most connected station, measured by the number of services which have
-- that station as their origin or destination.

	SELECT MAX (station_count) AS "Number of services", station.station_name, staff.id, staff.staff_name AS Manager
	FROM station 
	JOIN (
		SELECT station.station_name, COUNT(*) AS station_count
		FROM station
		JOIN service ON (station.station_name = service.origin_station_name) 
		    	OR (station.station_name = service.destination_station_name)
		GROUP BY station.station_name
		ORDER BY station_count DESC
	) AS connections ON station.station_name = connections.station_name
	JOIN staff ON station.id = staff.id;

-- 5. For the bus stop "Buchanan Gardens, St Andrews" list in the chronological order arrival times at this stop, origins, 
-- destinations, and service numbers of all bus services passing this stop between 10 am and 2 pm.
	
	SELECT 
		stop.stop_name, 
		arrives.arrival_time, 
		service.service_number, 
		service.origin_station_name, 
		service.destination_station_name
	FROM 
		stop
	JOIN 
		arrives ON stop.stop_name = arrives.stop_name
	JOIN 
		service ON arrives.service_number = service.service_number
	WHERE 
		stop.stop_name = "Buchanan Gardens" AND arrives.arrival_time >= "10:00" AND arrives.arrival_time <= "14:00"
	ORDER BY 
		arrives.arrival_time;
	
-- 6. List ID and name of the driver with the minimum total salary.
	
	SELECT driver.id, staff.staff_name, MIN ("Total Salary")
	FROM driver
	JOIN (
		SELECT driver.id, SUM (driver.hourly_salary * drives.hours_driven) AS "Total Salary"
		FROM driver
		JOIN drives ON driver.id = drives.id
		GROUP BY driver.id
	) AS "Sum of salaries" ON driver.id = "Sum of salaries".id
	JOIN staff ON driver.id = staff.id;

-- 7. Which service lines pass the stops "Buchanan Gardens" and "Leuchars Railway Station"?
/*
	SELECT service.service_number, service_time.start_time, arrives.arrival_time, arrives.stop_name
	FROM service
	JOIN service_time ON service.service_number = service_time.service_number
	JOIN arrives ON service_time.service_number = arrives.service_number
	WHERE arrives.stop_name = "Buchanan Gardens" AND arrives.stop_name = "Leuchars Railway Station";
*/
-- 7. Which service lines pass the stop "Seagate Bus Station"? List service number as well as origin and destination.

	SELECT 
		service.service_number,
		arrives.stop_name, 
		service.origin_station_name AS "From", 
		service.destination_station_name AS "To" 
	FROM
		service
	JOIN
		service_time ON service.service_number = service_time.service_number
	JOIN
		arrives ON service_time.service_number = arrives.service_number
	WHERE
		arrives.stop_name = "Seagate Bus Station"
	GROUP BY
		service.service_number;

-- 8. List ID and name of all managers and the station name of the station they are managing, including managers who are not in charge of a station.
 
	SELECT manager.id, staff.staff_name, station.station_name
	FROM manager
	JOIN staff ON manager.id = staff.id
	LEFT JOIN station ON staff.id = station.id;

-- 9. Find the managers associated with the stations in Edinburgh and Glasgow.

	SELECT staff.id, staff.staff_name, station.station_name
	FROM staff
	JOIN manager ON staff.id = manager.id
	JOIN station ON manager.id = station.id
	WHERE station.town = "Edinburgh" OR station.town = "Glasgow"; 



/* SQL Views */ 
	
-- View 1: Customer

-- Customers should be able to see all tables with information about the service, but no sensitive data like names, contact details, address, 
-- and salary (data protection and privacy).

CREATE VIEW customer AS
	
	SELECT 
		service.*, 
		service_time.start_time,
		arrives.fare_from_origin
	FROM 
		service
	LEFT JOIN 
		service_time ON service.service_number = service_time.service_number
	LEFT JOIN 
		arrives ON service_time.service_number = arrives.service_number
	GROUP BY service.service_number
	HAVING
		service.origin_station_name = "Buchanan Gardens"
	ORDER BY service_time.start_time
	;

SELECT * FROM customer;

-- View 2: Finance department

-- The finance department is responsible for payroll generation and therefore needs access to information in the staff, driver, drives, and manager relation:

CREATE VIEW finance AS

	SELECT 
		staff.*, 
		manager.annual_salary, 
		driver.hourly_salary, 
		drives.service_number, 
		drives.hours_driven
	FROM staff
	LEFT JOIN manager ON staff.id = manager.id
	LEFT JOIN driver ON staff.id = driver.id
	LEFT JOIN drives ON driver.id = drives.id;

SELECT * FROM finance;	

-- View 3: Driver

-- Every driver should have access to information about his/her salary, specific service lines driven and how many hours he/she was driving that line. 
-- This view should be customised for every individual driver. I have created a view for the driver with ID 2005:

CREATE VIEW driver_2005 AS

	SELECT 
		driver.*, 
		drives.service_number,
		drives.hours_driven,
		SUM (driver.hourly_salary * drives.hours_driven) AS "Salary component"
	FROM driver
	JOIN drives ON driver.id = drives.id
	JOIN service ON drives.service_number = service.service_number
	WHERE driver.id = 2005
	GROUP BY drives.service_number;

SELECT * FROM driver_2005;
