/*Which people bought more than 50 tickets (potential loyalty card)*/

SELECT Name, Surname, COUNT(Ticket_ID) as 'Number of Tickets'
FROM Person
JOIN Ticket ON Ticket.Person_ID = Person.Person_ID
GROUP BY Name, Surname
HAVING COUNT(Ticket_ID) > 1;

/*In which city were the most numbers of delays */

SELECT Train_Stations.City, COUNT(Real_Train_Stop.Delayed) AS 'Number of Delays'
FROM Train_Stations
JOIN Train_Stops ON Train_Stops.Station_ID = Train_Stations.Station_ID
JOIN Real_Train_Stop ON Real_Train_Stop.Distance_from_Beg = Train_Stops.Distance_from_Beg
WHERE Real_Train_Stop.Delayed = 1
GROUP BY Train_Stations.City
ORDER BY COUNT(Real_Train_Stop.Delayed) DESC;

/*Which gender buys first class ticket more often(buy more whisky or prosecco for example)*/

SELECT Person.Gender, COUNT(Ticket_ID) AS 'First Class ticket ammount'
FROM Person
JOIN Ticket ON Ticket.Person_ID = Person.Person_ID
WHERE Ticket.Class = 1
GROUP BY Person.Gender
ORDER BY COUNT(Ticket_ID) DESC;

/*Which train type had the most delayed routes*/

SELECT TOP 1 Train_Type.Type, SUM(Real_Train_Route.Is_Delayed) AS 'Total Delay'
FROM Train_Type
JOIN Actuall_Train ON Actuall_Train.Type = Train_Type.Type
JOIN Real_Train_Route ON Real_Train_Route.Train_ID = Actuall_Train.Train_ID
WHERE Real_Train_Route.Is_Delayed = 1
GROUP BY Train_Type.Type
ORDER BY SUM(Real_Train_Route.Is_Delayed) DESC;

/*To which city trains had the destination route most often*/

SELECT TOP 1 City, COUNT(ACT.Train_ID) AS 'Trains with such destination'
FROM Train_Stations AS TST
JOIN Train_Schedule TSC ON TST.Station_ID = TSC.Target_Station_ID
JOIN Real_Train_Route RTR ON RTR.Schedule_ID = TSC.Schedule_ID
JOIN Actuall_Train ACT ON ACT.Train_ID = RTR.Train_ID
GROUP BY City
ORDER BY COUNT(ACT.Train_ID) DESC;

/*Show trains which went on a route with the most amount of stops.*/

SELECT TOP 1 ACT.Train_ID, ACT.Type, COUNT(RTS.Real_Train_Route_ID) AS 'Ammount of stops'
FROM Actuall_Train AS ACT
JOIN Real_Train_Route RTR ON RTR.Train_ID = ACT.Train_ID
JOIN Real_Train_Stop RTS ON RTS.Real_Train_Route_ID = RTR.Real_Train_Route_ID
GROUP BY ACT.Train_ID, ACT.Type
ORDER BY COUNT(RTS.Real_Train_Route_ID) DESC;

--Which trains have more or equal maximum passengers than a particular train (possible replacement)

SELECT Train_ID, TT.Type, Max_Passengers
FROM Actuall_Train AS ACT
JOIN Train_Type TT ON TT.Type = ACT.Type
WHERE ACT.Type = TT.Type 
AND Max_Passengers >= (	SELECT Max_Passengers
						FROM Actuall_Train
						WHERE Train_ID = 10)
ORDER BY Max_Passengers DESC;

--Which trains in schedule are going to Gdynia on monday 

DROP VIEW [Destination Gdynia];

CREATE VIEW [Destination Gdynia] AS
SELECT Schedule_ID, Destination
FROM Train_Schedule AS TS
WHERE Destination = 'Gdynia';

SELECT ACT.Train_ID, ACT.Type, ACT.Max_Passengers, ND_Schedule.Day, TS.Origin, TS.Destination, TS.Schedule_ID
FROM Actuall_Train AS ACT
JOIN Real_Train_Route RTR ON RTR.Train_ID = ACT.Train_ID
JOIN Train_Schedule TS ON TS.Schedule_ID = RTR.Schedule_ID
JOIN ND_Schedule ON ND_Schedule.Schedule_ID = TS.Schedule_ID
WHERE TS.Destination IN (SELECT Destination
						FROM [Destination Gdynia])
					AND ND_Schedule.Day IN (SELECT Day
											FROM Normal_Day
											WHERE Day = 'MON');

-- Show trains that arrive to Gdañsk after 15:00 on 02.03.2022 and their destination is Gdynia 

SELECT ACT.Type, ACT.Train_ID, RTS.Real_Arrival_Time,TS.Origin, TS.Destination, RTR.Date
FROM Actuall_Train AS ACT
JOIN Real_Train_Route RTR ON RTR.Train_ID = ACT.Train_ID
JOIN Real_Train_Stop RTS ON RTS.Real_Train_Route_ID = RTR.Real_Train_Route_ID
JOIN Train_Schedule TS ON TS.Schedule_ID = RTR.Schedule_ID
WHERE RTS.Distance_from_Beg IN (SELECT TSt.Distance_from_Beg
								FROM Train_Stops AS TSt
								JOIN Train_Stations TSTa ON TSTa.Station_ID = TST.Station_ID
								WHERE TSTa.City = 'Gdañsk') 
							AND DATEPART(hh, RTS.Real_Arrival_Time) > 15
							AND TS.Target_Station_ID IN (	SELECT TSTa.Station_ID
															FROM Train_Stations AS TSTa
															WHERE TSTa.City = 'Gdynia')
							AND RTR.Date = '2-03-2022'
ORDER BY RTS.Real_Departure_Time;

-- jakie pociagi jeszcze nie przejechaly ¿adnej drogi

SELECT ACT.Type, ACT.Train_ID, RTR.Real_Train_Route_ID
FROM Actuall_Train AS ACT
LEFT JOIN Real_Train_Route RTR ON RTR.Train_ID = ACT.Train_ID
WHERE RTR.Train_ID IS NULL
	
/*Show list of passengers that were on road on 1-03-2022 */

SELECT Person.Surname, Person.Name, Real_Train_Route.Date
FROM Person
JOIN Ticket ON Ticket.Person_ID = Person.Person_ID
JOIN Passenger_Route ON Passenger_Route.Ticket_ID = Ticket.Ticket_ID
JOIN Real_Train_Stop ON Passenger_Route.Start_Stop_ID = Real_Train_Stop.Stop_ID
JOIN Real_Train_Route ON Real_Train_Stop.Real_Train_Route_ID = Real_Train_Route.Real_Train_Route_ID
WHERE Real_Train_Route.Date = '1-03-2022'
ORDER BY Person.Surname;
	
