/*
	DB PG WETI PROJECT
	Krzysztof Domarecki
	Train stations
*/

INSERT INTO Train_Type VALUES ('EIC', 3);
INSERT INTO Train_Type VALUES ('TLK', 2);
INSERT INTO Train_Type VALUES ('EIP', 2);

INSERT INTO Actuall_Train VALUES (1, 20, 250, 'TLK');
INSERT INTO Actuall_Train VALUES (2, 25, 350, 'TLK');
INSERT INTO Actuall_Train VALUES (3, 30, 450, 'EIP');
INSERT INTO Actuall_Train VALUES (4, 10, 150, 'EIP');
INSERT INTO Actuall_Train VALUES (5, 12, 180, 'EIC');
INSERT INTO Actuall_Train VALUES (6, 78, 20, 'EIC');
INSERT INTO Actuall_Train VALUES (7, 18, 210, 'TLK');
INSERT INTO Actuall_Train VALUES (8, 9, 200, 'TLK');
INSERT INTO Actuall_Train VALUES (9, 12, 220, 'EIC');
INSERT INTO Actuall_Train VALUES (10, 18, 190, 'EIP');

INSERT INTO Normal_Day VALUES ('MON');
INSERT INTO Normal_Day VALUES ('TUE');
INSERT INTO Normal_Day VALUES ('WEN');
INSERT INTO Normal_Day VALUES ('THU');
INSERT INTO Normal_Day VALUES ('FRI');
INSERT INTO Normal_Day VALUES ('SAT');
INSERT INTO Normal_Day VALUES ('SUN');

INSERT INTO Special_Day VALUES ('JAN01' ,'SAT');
INSERT INTO Special_Day VALUES ('APR15' ,'FRI');
INSERT INTO Special_Day VALUES ('APR17' ,'SUN');
INSERT INTO Special_Day VALUES ('APR18' ,'MON');
INSERT INTO Special_Day VALUES ('MAY01' ,'SUN');
INSERT INTO Special_Day VALUES ('MAY03' ,'TUE');
INSERT INTO Special_Day VALUES ('JUN16' ,'THU');
INSERT INTO Special_Day VALUES ('AUG16' ,'THU');
INSERT INTO Special_Day VALUES ('NOV01' ,'TUE');
INSERT INTO Special_Day VALUES ('DEC24' ,'SUN');

INSERT INTO Person VALUES (1001,'Jan' ,'Kowalski', 21, 'M');
INSERT INTO Person VALUES (1002,'Adam' ,'Kaczmarek', 41, 'M');
INSERT INTO Person VALUES (1003,'Joanna' ,'Morelowska', 28, 'F');
INSERT INTO Person VALUES (1004,'Krzysztof' ,'Polaris', 24, 'M');
INSERT INTO Person VALUES (1005,'Katarzyna' ,'Walczyk', 38, 'F');
INSERT INTO Person VALUES (1006,'Orianna' ,'Tubis', 19, 'F');
INSERT INTO Person VALUES (1007,'Pawel' ,'Ptak', 29, 'M');
INSERT INTO Person VALUES (1008,'Wojciech' ,'Noris', 71, 'M');
INSERT INTO Person VALUES (1009,'Anna' ,'Bucha', 61, 'F');
INSERT INTO Person VALUES (1010,'Lech' ,'Hubertowicz', 51, 'M');

INSERT INTO Train_Stations VALUES (10001,'Warszawa' ,'G³ówny', '1890');
INSERT INTO Train_Stations VALUES (10101,'Kraków' ,'G³ówny', '1990');
INSERT INTO Train_Stations VALUES (10201,'Gdañsk' ,'G³ówny', '1897');
INSERT INTO Train_Stations VALUES (10301,'S³upsk' ,'G³ówny', '1990');
INSERT INTO Train_Stations VALUES (10401,'Szczecin' ,'G³ówny', '1890');
INSERT INTO Train_Stations VALUES (10501,'Czestochowa' ,'G³ówny', '1999');
INSERT INTO Train_Stations VALUES (10601,'Katowice' ,'G³ówny', '1899');
INSERT INTO Train_Stations VALUES (10701,'Gdynia' ,'G³ówny', '1900');
INSERT INTO Train_Stations VALUES (10801,'Rzeszow' ,'G³ówny', '2001');
INSERT INTO Train_Stations VALUES (10901,'Bydgoszcz' ,'G³ówny', '2023');

INSERT INTO Ticket VALUES (100001, 1, 1001);
INSERT INTO Ticket VALUES (100002, 2, 1004);
INSERT INTO Ticket VALUES (100003, 2, 1004);
INSERT INTO Ticket VALUES (100004, 2, 1002);
INSERT INTO Ticket VALUES (100005, 1, 1007);
INSERT INTO Ticket VALUES (100006, 1, 1008);
INSERT INTO Ticket VALUES (100007, 2, 1005);
INSERT INTO Ticket VALUES (100008, 1, 1003);
INSERT INTO Ticket VALUES (100009, 1, 1010);
INSERT INTO Ticket VALUES (100010, 1, 1010);

INSERT INTO Train_Schedule VALUES (10000001,'Warszawa','Gdynia', 1, 'EIP', 10001, 10701);
INSERT INTO Train_Schedule VALUES (10000002,'Gdansk','Krakow', 0, 'EIC', 10201, 10101);
INSERT INTO Train_Schedule VALUES (10000003,'Rzeszow','Slupsk', 0, 'TLK', 10801, 10301);
INSERT INTO Train_Schedule VALUES (10000004,'Gdansk','Rzeszow', 0, 'TLK', 10201, 10801);
INSERT INTO Train_Schedule VALUES (10000005,'Gdynia','Czestochowa', 1, 'EIP', 10701, 10501);
INSERT INTO Train_Schedule VALUES (10000006,'Bydgoszcz','Gdansk', 0, 'EIP', 10901, 10201);
INSERT INTO Train_Schedule VALUES (10000007,'Gdansk','Szczecin', 0, 'EIC', 10201, 10401);
INSERT INTO Train_Schedule VALUES (10000008,'Katowice','Krakow', 0, 'EIC', 10601, 10101);
INSERT INTO Train_Schedule VALUES (10000009,'Krakow','Rzeszow', 0, 'EIC', 10101, 10801);
INSERT INTO Train_Schedule VALUES (10000010,'Szczecin','Gdynia', 0, 'TLK', 10401, 10701);
INSERT INTO Train_Schedule VALUES (10000011,'Krakow','Bydgoszcz', 1, 'EIP', 10101, 10901);

INSERT INTO Train_Stops VALUES (0,'14:00','14:00', 10000001, 10001);
INSERT INTO Train_Stops VALUES (300,'16:00','16:15', 10000001, 10201);
INSERT INTO Train_Stops VALUES (330,'16:30','16:30', 10000001, 10701);
INSERT INTO Train_Stops VALUES (1,'11:00','11:00', 10000005, 10701);
INSERT INTO Train_Stops VALUES (20,'11:15','11:30', 10000005, 10201);
INSERT INTO Train_Stops VALUES (270,'14:00','14:20', 10000005, 10001);
INSERT INTO Train_Stops VALUES (600,'16:00','16:00', 10000005, 10501);
INSERT INTO Train_Stops VALUES (2,'21:00','21:00', 10000011, 10101);
INSERT INTO Train_Stops VALUES (302,'22:00','22:15', 10000011, 10001);
INSERT INTO Train_Stops VALUES (689,'23:50','23:50', 10000011, 10901);

INSERT INTO Real_Train_Route VALUES (1,'1-03-2022', 0, 10000001,1);
INSERT INTO Real_Train_Route VALUES (2,'2-03-2022', 1, 10000001,1);
INSERT INTO Real_Train_Route VALUES (3,'3-03-2022', 1, 10000001,3);
INSERT INTO Real_Train_Route VALUES (4,'4-03-2022', 1, 10000001,4);
INSERT INTO Real_Train_Route VALUES (5,'1-03-2022', 0, 10000005,7);
INSERT INTO Real_Train_Route VALUES (6,'2-03-2022', 1, 10000005,7);
INSERT INTO Real_Train_Route VALUES (7,'3-03-2022', 0, 10000005,8);
INSERT INTO Real_Train_Route VALUES (8,'4-03-2022', 1, 10000005,8);
INSERT INTO Real_Train_Route VALUES (9,'1-03-2022', 0, 10000011,9);
INSERT INTO Real_Train_Route VALUES (10,'2-03-2022', 0, 10000011,9);

INSERT INTO Real_Train_Stop VALUES (10001,'14:00', '14:00', 0, 1, 0);
INSERT INTO Real_Train_Stop VALUES (10002,'16:00', '16:15', 0, 1, 300);
INSERT INTO Real_Train_Stop VALUES (10003,'16:30', '16:30', 0, 1, 330);
INSERT INTO Real_Train_Stop VALUES (10011,'14:00', '14:00', 1, 2, 0);
INSERT INTO Real_Train_Stop VALUES (10012,'16:50', '16:55', 1, 2, 300);
INSERT INTO Real_Train_Stop VALUES (10013,'18:00', '18:00', 1, 2, 330);
INSERT INTO Real_Train_Stop VALUES (20001,'11:00', '11:00', 0, 5, 1);
INSERT INTO Real_Train_Stop VALUES (20002,'11:15', '11:30', 0, 5, 20);
INSERT INTO Real_Train_Stop VALUES (20003,'14:00', '14:20', 0, 5, 270);
INSERT INTO Real_Train_Stop VALUES (20004,'16:00', '16:00', 0, 5, 600);

INSERT INTO Passenger_Route VALUES (1, 300, 0, 100001, 10001, 10002);
INSERT INTO Passenger_Route VALUES (2, 330, 0, 100004, 10001, 10003);
INSERT INTO Passenger_Route VALUES (3, 420, 1, 100005, 10001, 20004);
INSERT INTO Passenger_Route VALUES (4, 20, 0, 100009, 10012, 10013);
INSERT INTO Passenger_Route VALUES (5, 599, 0, 100003, 20001, 20004);
INSERT INTO Passenger_Route VALUES (6, 720, 1, 100008, 20001, 10013);

INSERT INTO ND_Schedule VALUES ('MON', 10000001);
INSERT INTO ND_Schedule VALUES ('TUE', 10000001);
INSERT INTO ND_Schedule VALUES ('WEN', 10000001);
INSERT INTO ND_Schedule VALUES ('THU', 10000001);
INSERT INTO ND_Schedule VALUES ('FRI', 10000001);
INSERT INTO ND_Schedule VALUES ('FRI', 10000005);
INSERT INTO ND_Schedule VALUES ('FRI', 10000011);
INSERT INTO ND_Schedule VALUES ('SAT', 10000001);
INSERT INTO ND_Schedule VALUES ('SAT', 10000011);

INSERT INTO SD_Schedule VALUES ('APR15', 10000001);
INSERT INTO SD_Schedule VALUES ('APR15', 10000011);
INSERT INTO SD_Schedule VALUES ('APR15', 10000002);
INSERT INTO SD_Schedule VALUES ('MAY03', 10000005);
INSERT INTO SD_Schedule VALUES ('MAY03', 10000001);
INSERT INTO SD_Schedule VALUES ('JUN16', 10000011);
INSERT INTO SD_Schedule VALUES ('JUN16', 10000005);
INSERT INTO SD_Schedule VALUES ('NOV01', 10000004);
INSERT INTO SD_Schedule VALUES ('DEC24', 10000009);

/*select * from Train_Type
select * from Actuall_Train
select * from Normal_Day
select * from Special_Day
select * from Person
select * from Train_Stations
select * from Ticket
select * from Train_Schedule
select * from Train_Stops
select * from Real_Train_Route
select * from Real_Train_Stop
select * from ND_Schedule
select * from SD_Schedule
select * from Passenger_Route*/
/*delete from Passenger_Route where Route_ID = 1
select * from Passenger_Route*/
