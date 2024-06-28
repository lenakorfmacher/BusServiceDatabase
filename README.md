# Bus Service Database

SQL database of bus services.

## Purpose
This project was developed as part of my coursework at the University of St Andrews. It was created to fulfill the requirements of a specific assignment. The suggested approach is an exemplary SQL database script including data definition and data manipulation queries.

By including this project in my portfolio, I aim to demonstrate my skills in SQL. It serves as an example of my work to potential employers and collaborators.

## Features
- Definition of a database including several schemas, based on a given szenario and ER-Model
- SQL queries and views to retrieve requested data.
- Report explaining the database design and chosen queries.

## Usage
1. Make sure you have SQLite installed on your system. You can download it from the [SQLite Download Page](https://www.sqlite.org/download.html).
2. Clone the repository to your local machine.
3. Open your terminal or command prompt, navigate to the directory where buses.sql is located, and run the following command, which will create a new SQLite database file named buses.db and execute the SQL commands from buses.sql to set up the database:
        **sqlite3 buses.db < buses.sql**
4. Verify the contents of the database by opening it with the SQLite CLI: 
        **sqlite3 buses.db**
5. Once inside the SQLite CLI, you can run additional SQL commands to further explore the database.


## Technologies Used
SQL, SQLite

## Szenario and Tasks
The following is taken from the szenario and tasks description underlying this coursework component:

### Szenario
We will work with the E–R Model for a bus company scenario. Bus services are identified by a number used by customers and drivers (like 42, 99A, or X59). Each service has a starting bus station (origin) and an ending bus station (destination). Bus stations have a name and town (like Seagate in Dundee or Buchanan in Glasgow). Each service runs multiple times a day and passes a number of stops. For each run of the service, it is necessary to record its arrival time to each stop on the route, as well as the fare from the origin to each stop.
The bus company employs bus drivers, who work on hourly wages. Bus drivers are assigned to one or more bus services. To calculate their pay, it is necessary to record their hourly wage, and how many hours they have worked on each service. The bus company also employs station managers, who are paid an annual salary.
The rest of the details must be inferred from the E–R diagram on Figure 1.

### Task 1
Translate the E–R model into the corresponding database schema, i.e. into the collection of relation schemas. In your report, present the relation schemas and provide a brief rationale for any design choices you make. Be sure to identify appropriate primary keys, foreign keys, and attribute types.

### Task 2
Create an SQLite database, which corresponds to the database schema from Task 1.
To complete this task, you should create a plain text file called buses.sql, containing SQL code to define tables for each relational schema from Task 1, and then insert data into your tables.
You need to create about 10 rows per each table, and make sure that you insert rows which make each query from Task 3 to return at least 2 results (you may revisit this task later, and add extra data while working on Task 3, if necessary).
Make sure that integrity constraints are enforced. In SQLite, you have to put the line PRAGMA foreign_keys = TRUE; in the the file buses.sql in the beginning of the script, above the commands used to create and popu- late the tables. In addition to specifying primary and foreign keys, and attribute types, you are encour- aged to use additional SQL features to enforce database integrity, e.g. cascading actions, default values, etc.

In your report, give the high-level overview of this process, describing your approach to developing and testing the SQL code to ensure the integrity of your data.

### Task 3
Extend the buses.sql script created in Task 2, adding to it (below the statements to create table and insert date), SQL code to perform the following queries:
1. List all services which have Seagate Bus Station in Dundee as their origin;
2. Calculate an average monthly salary of a bus station manager;
3. List the names of all drivers of services which have Edinburgh Bus Station in Edinburgh as their origin or destination, in increasing order of the amount to be paid to them for the hours driven;
4. List the manager of the most connected station, measured by the number of services which have that station as their origin or destination.
5. For the bus stop "Buchanan Gardens, St Andrews" list in the chronological order arrival times at this stop, origins, destinations, and service numbers of all bus services passing this stop between 10 am and 2 pm.

Next, formulate at least 4 new queries and at least 3 appropriate views, stating them as precisely as you can in plain English. Implement them in SQL, and include the SQL code for all the queries and views, and their output, in the report.

## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Copyright
© 2024 Lena Korfmacher. All rights reserved.