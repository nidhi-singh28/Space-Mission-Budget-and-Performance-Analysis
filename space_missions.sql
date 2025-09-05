CREATE DATABASE space_missions;
USE space_missions;

CREATE TABLE missions (
  id INT AUTO_INCREMENT PRIMARY KEY,
  Country VARCHAR(50),
  Year INT,
  Mission_Name VARCHAR(255),
  Mission_Type VARCHAR(50),
  Launch_Site VARCHAR(100),
  Satellite_Type VARCHAR(50),
  Budget_Billion DECIMAL(10,2),
  Success_Rate INT,
  Technology_Used VARCHAR(100),
  Environmental_Impact VARCHAR(20),
  Collaborating_Country VARCHAR(255),
  Duration_Days INT
);

SELECT * FROM missions LIMIT 10;
SELECT 
 (CASE WHEN Country IS NULL THEN 1 ELSE 0 END) AS Null_Country, 
 (CASE WHEN Year IS NULL THEN 1 ELSE 0 END) AS Null_Year,
 (CASE WHEN Mission_Name IS NULL THEN 1 ELSE 0 END) AS Null_MissionName,
 (CASE WHEN Budget_Billion IS NULL THEN 1 ELSE 0 END) AS Null_Budget,
 (CASE WHEN Duration_Days IS NULL THEN 1 ELSE 0 END) AS Null_DurationDays
FROM missions;

SELECT Mission_Name, Year, COUNT(*) AS cnt
FROM missions
GROUP BY Mission_Name,Year
Having cnt>1;

SELECT 
 MIN(Budget_Billion) AS MIN_Budget,
 MAX(Budget_Billion) AS MAX_Budget,
 MIN(Duration_Days) AS MIN_Duration,
 MAX(Duration_Days) AS MAX_Duration
FROM missions;

SELECT Duration_Days, COUNT(*) AS Mission_Count
FROM missions
GROUP BY Duration_Days
ORDER BY Mission_Count DESC;

SELECT DISTINCT Success_Rate FROM missions;

SELECT Country,
COUNT(Mission_Name) AS Total_Missions,
AVG(Budget_billion) AS Avg_Budget,
AVG(Success_Rate) AS Avg_Success
FROM missions
GROUP BY Country
ORDER BY Total_Missions DESC;

SELECT Mission_Type,
COUNT(Mission_Name) AS Total_Missions,
AVG(Budget_billion) AS Avg_Budget,
AVG(Duration_Days) AS Avg_Duration
FROM missions
GROUP BY Mission_Type
ORDER BY Avg_Budget DESC;

SELECT Satellite_Type,
COUNT(Mission_Name) AS Total_Missions,
AVG(Budget_billion) AS Avg_Budget
FROM missions
GROUP BY Satellite_Type
ORDER BY Avg_Budget DESC;

SELECT 
 (CASE 
  WHEN Success_Rate>=80 THEN "High Success"
  WHEN Success_Rate BETWEEN 50 AND 79 THEN "Medium Success"
  ELSE "Low Success"
 END) AS Success_Category,
COUNT(Mission_Name) AS Total_Missions,
AVG(Budget_billion) AS Avg_Budget
FROM missions
GROUP BY Success_Category
ORDER BY Avg_Budget DESC;

SELECT 
 (CASE 
  WHEN Duration_Days<=30 THEN "	Short Term"
  WHEN Duration_Days BETWEEN 31 AND 180 THEN "Medium Term"
  ELSE "Long Term"
 END) AS Duration_Category,
COUNT(Mission_Name) AS Total_Missions,
AVG(Budget_billion) AS Avg_Budget
FROM missions
GROUP BY Duration_Category
ORDER BY Avg_Budget DESC;

SELECT 
 (CASE 
  WHEN Collaborating_Country IS NULL OR Collaborating_Country=" " THEN "No Collaboration"
  ELSE "Collaboration"
 END) AS Collaboration_Status,
COUNT(Mission_Name) AS Total_Missions,
AVG(Budget_billion) AS Avg_Budget,
AVG(Success_Rate) AS Avg_Success
FROM missions
GROUP BY Collaboration_Status
ORDER BY Avg_Budget DESC;





