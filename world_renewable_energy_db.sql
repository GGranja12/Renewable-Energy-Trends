USE renewable_energy_final_db;

-- Check the integrity of the database
Select *
From world_renewable_energy;

-- 1: How many countries are detailed in the dataset?
SELECT COUNT(DISTINCT country) AS total_countries
FROM world_renewable_energy;

-- 2: Which time period is the data considering? Sort them from the latest to the earliest.
SELECT DISTINCT year AS years
FROM world_renewable_energy 
ORDER BY years ASC ;

-- 3: What was the rounded average percentage of low carbon eletricity in 2015?
SELECT year, ROUND(AVG(`low-carbon_electricity_(%_electricity)`), 2) as average_low_carbon_elet
FROM world_renewable_energy
WHERE year = 2015;

-- 4: Which were the top 10 countries presenting the highest low carbon eletricity % in 2019?
SELECT country, ROUND(`low-carbon_electricity_(%_electricity)`, 2)
FROM world_renewable_energy
WHERE year = 2019
ORDER BY `low-carbon_electricity_(%_electricity)` DESC
LIMIT 10;

-- 5: And the bottom 10?
SELECT country, ROUND(`low-carbon_electricity_(%_electricity)`, 2)
FROM world_renewable_energy
WHERE year = 2019
ORDER BY `low-carbon_electricity_(%_electricity)` ASC
LIMIT 10;

-- 6: Which were the CO2 emissions in 2019 in each continent?
SELECT continent, ROUND(SUM(value_co2_emissions_kt_by_country)) AS CO2_in_kt
FROM world_renewable_energy
WHERE year = 2019
GROUP BY continent;

-- 7: How many countries presented less than 50% of the pop. with access to eletricity in 2017? 
SELECT COUNT(country) AS total_countries
FROM world_renewable_energy
WHERE year = 2019 AND `access_to_electricity_(%_of_population)` < 50;

-- 8: Get the average renewable energy share in each continent in 2000?
SELECT continent, ROUND(AVG(`renewable_energy_share_in_the_total_final_energy_consumption_(%)`)) AS renewable_energy_share
FROM world_renewable_energy
WHERE year = 2000
GROUP BY continent;

-- 9: Which years presented an average percentage of low carbon_electricity above 30%?
SELECT year, ROUND(AVG(`low-carbon_electricity_(%_electricity)`)) AS low_carbon_elect
FROM world_renewable_energy
GROUP BY year
HAVING low_carbon_elect > 30;

-- 10 Which country was the highest CO2 pollutor in 2019?
SELECT country AS biggest_pollutor_2019, value_co2_emissions_kt_by_country AS CO2_emissions
FROM world_renewable_energy
WHERE year = 2019
ORDER BY value_co2_emissions_kt_by_country DESC
LIMIT 1;