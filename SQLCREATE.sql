/*
	DB PG WETI PROJECT
	Krzysztof Domarecki
	Train stations
*/

CREATE TABLE Train_Type (
Type char(3) NOT NULL PRIMARY KEY,
CHECK(Type LIKE '[A-Z][A-Z][A-Z]'),
Class_Ammount tinyint,
CHECK (Type = 'TLK' or Type = 'EIP' or Type = 'EIC')
);

CREATE TABLE Train_Schedule (
Schedule_ID int NOT NULL PRIMARY KEY,
Origin varchar(50) NOT NULL,
CHECK(Origin NOT LIKE '%[^A-Z]%'),
Destination varchar(50) NOT NULL,
CHECK(Destination NOT LIKE '%[^A-Z]%'),
Is_Active tinyint,
CHECK(Is_Active < 2),
Type char(3),
Origin_Station_ID int,
Target_Station_ID int,
);

CREATE TABLE Train_Stations (
Station_ID int NOT NULL PRIMARY KEY,
City varchar(50) NOT NULL,
District varchar(50),
Opening_Year char(4)
);

CREATE TABLE Ticket (
Ticket_ID int NOT NULL PRIMARY KEY,
Class tinyint NOT NULL,
CHECK (Class < 4),
Person_ID int
);

CREATE TABLE Train_Stops (
Distance_from_Beg int NOT NULL PRIMARY KEY,
CHECK(Distance_from_Beg >= 0),
Arrival_Time time,
Departure_Time time,
Schedule_ID int,
Station_ID int
);

CREATE TABLE Normal_Day (
Day char(3) NOT NULL PRIMARY KEY,
CHECK(Day like '[A-Z][A-Z][A-Z]')
);

CREATE TABLE Special_Day (
Special_Day_ID char(5) NOT NULL PRIMARY KEY,
CHECK(Special_Day_ID like '[A-Z][A-Z][A-Z][0-9][0-9]'),
Day char (3) NOT NULL,
CHECK(Day like '[A-Z][A-Z][A-Z]')
);

CREATE TABLE Real_Train_Stop (
Stop_ID int NOT NULL PRIMARY KEY,
Real_Arrival_Time time,
Real_Departure_Time time,
Delayed tinyint NOT NULL,
CHECK(Delayed < 2),
Real_Train_Route_ID int,
Distance_from_Beg int,
);

CREATE TABLE Passenger_Route (
Route_ID int NOT NULL PRIMARY KEY,
Distance int NOT NULL,
Have_Transits tinyint NOT NULL,
CHECK (Have_Transits < 2),
Ticket_ID int,
Start_Stop_ID int,
End_Stop_ID int,
);

CREATE TABLE Real_Train_Route (
Real_Train_Route_ID int NOT NULL PRIMARY KEY,
Date date NOT NULL,
Is_Delayed tinyint,
CHECK (Is_Delayed < 2),
Schedule_ID int,
Train_ID int,
);

CREATE TABLE Actuall_Train (
Train_ID int NOT NULL PRIMARY KEY,
Carts_Ammount int,
CHECK (Carts_Ammount > 0),
Max_Passengers int,
CHECK (Max_Passengers > 0),
Type char(3)
);

CREATE TABLE Person (
Person_ID int NOT NULL PRIMARY KEY,
Name varchar(50) NOT NULL,
CHECK(Name NOT LIKE '%[^A-Z]%'),
Surname varchar(50) NOT NULL,
CHECK(Surname NOT LIKE '%[^A-Z]%'),
Age tinyint,
CHECK (Age > 0),
Gender char(1),
CHECK(Gender = 'M' or Gender = 'F' or Gender = 'O')
);

ALTER TABLE Ticket
ADD FOREIGN KEY (Person_ID) REFERENCES Person(Person_ID); 

ALTER TABLE Real_Train_Stop 
ADD FOREIGN KEY (Real_Train_Route_ID) REFERENCES Real_Train_Route(Real_Train_Route_ID);

ALTER TABLE Real_Train_Stop
ADD FOREIGN KEY (Distance_from_Beg) REFERENCES Train_Stops(Distance_from_Beg);

ALTER TABLE Real_Train_Route
ADD FOREIGN KEY (Schedule_ID) REFERENCES Train_Schedule(Schedule_ID);

ALTER TABLE Real_Train_Route
ADD FOREIGN KEY (Train_ID) REFERENCES Actuall_Train(Train_ID);

ALTER TABLE Train_Schedule
ADD FOREIGN KEY (Type) REFERENCES Train_Type(Type);

ALTER TABLE Train_Schedule
ADD FOREIGN KEY (Origin_Station_ID) REFERENCES Train_Stations(Station_ID);

ALTER TABLE Train_Schedule
ADD FOREIGN KEY (Target_Station_ID) REFERENCES Train_Stations(Station_ID);

ALTER TABLE Actuall_Train
ADD FOREIGN KEY (Type) REFERENCES Train_Type(Type);

ALTER TABLE Train_Stops
ADD FOREIGN KEY (Schedule_ID) REFERENCES Train_Schedule(Schedule_ID);

ALTER TABLE Train_Stops
ADD FOREIGN KEY (Station_ID) REFERENCES Train_Stations(Station_ID);

ALTER TABLE Passenger_Route
ADD FOREIGN KEY (Ticket_ID) REFERENCES Ticket(Ticket_ID) ON DELETE CASCADE;

ALTER TABLE Passenger_Route
ADD FOREIGN KEY (Start_Stop_ID) REFERENCES Real_Train_Stop(Stop_ID);

ALTER TABLE Passenger_Route
ADD FOREIGN KEY (End_Stop_ID) REFERENCES Real_Train_Stop(Stop_ID);

CREATE TABLE ND_Schedule (
Day char(3) FOREIGN KEY REFERENCES Normal_Day(Day),
CHECK(Day like '[A-Z][A-Z][A-Z]'),
Schedule_ID int FOREIGN KEY REFERENCES Train_Schedule(Schedule_ID),
PRIMARY KEY(Day, Schedule_ID)
);

CREATE TABLE SD_Schedule (
Special_Day_ID char(5) FOREIGN KEY REFERENCES Special_Day(Special_Day_ID),
CHECK(Special_Day_ID like '[A-Z][A-Z][A-Z][0-9][0-9]'),
Schedule_ID int FOREIGN KEY REFERENCES Train_Schedule(Schedule_ID),
PRIMARY KEY(Special_Day_ID, Schedule_ID)
);
