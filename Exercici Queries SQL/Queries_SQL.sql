
-- 1.
SELECT COUNT(flightID) as total
FROM `Flights`

-- 2.
SELECT Origin, AVG(ArrDelay) AS AVG_ArrDelay, AVG(DepDelay) AS AVG_DepDelay
FROM Flights
GROUP BY Origin


-- 3.
SELECT Origin, colYear, colMonth, AVG(ArrDelay) AS AVG_ArrDelay
FROM Flights
GROUP BY Origin, colYear, colMonth


-- 4.
SELECT p.City, f.colYear, f.colMonth, AVG(f.ArrDelay) as AVG_ArrDelay
FROM Flights AS f
JOIN USAirports AS p ON f.Origin = p.IATA 
GROUP BY p.City, f.colYear, f.colMonth


-- 5.
SELECT Flights.colMonth, Flights.colYear, SUM(Flights.Cancelled) AS Sum_Cancelled
FROM Flights
JOIN Carriers ON Carriers.CarrierCode = Flights.UniqueCarrier
GROUP BY Flights.colMonth, Flights.colYear
HAVING Sum_Cancelled


-- 6.
SELECT TailNum, SUM(Distance) AS total_distance 
FROM Flights
GROUP BY TailNum
ORDER By total_distance DESC

-- 7.
SELECT UniqueCarrier, AVG(ArrDelay) AS AVG_Delay
FROM Flights
GROUP BY UniqueCarrier
HAVING AVG_Delay > 10
ORDER BY AVG_Delay DESC