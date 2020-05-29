-- Drop table if exists
DROP TABLE if exists firepower;

-- Create new table to import data
CREATE TABLE firepower (
	country VARCHAR,
	ISO3 VARCHAR,
	"rank" INT,
	TotalPopulation INT,
	ManpowerAvailable INT,
	TotalMilitaryPersonnel INT,
	ActivePersonnel INT,
	ReservePersonnel INT,
	TotalAircraftStrength INT,
	FighterAircraft INT,
	AttackAircraft INT,
	TotalHelicopterStrength INT,
	AttackHelicopters INT
);

-- Import data from firepower.csv
-- View the table to ensure all data has been imported correctly
SELECT * FROM firepower;

DELETE FROM firepower WHERE reservepersonnel = 0;

SELECT * FROM firepower;

Update firepower
Set fighteraircraft = 1 where fighteraircraft = 0; 

Update firepower
Set TotalAircraftStrength = TotalAircraftStrength + 1 where fighteraircraft = 1


DROP TABLE if exists military_avg ;

CREATE TABLE military_avg
  AS (SELECT AVG(TotalMilitaryPersonnel) as Avg_MilitaryPersonnel
		,AVG(TotalAircraftStrength) as Avg_AircraftStrength
		,AVG(TotalHelicopterStrength) as Avg_HelicopterStrength
		,AVG(TotalPopulation) as Avg_Population
	  FROM firepower
	 );
select * from military_avg;

CREATE TABLE Militaryavg (id SERIAL PRIMARY KEY) AS
    SELECT TotalMilitaryPersonnel, TotalAircraftStrength, TotalHelicopterStrength, TotalPopulation
    FROM firepower;
SELECT AVG(TotalMilitaryPersonnel), AVG(TotalAircraftStrength),
AVG(TotalHelicopterStrength),  AVG(TotalPopulation)
FROM Militaryavg;

Select * from Militaryavg
