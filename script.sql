CREATE TABLE temperature.hemisphere_nord (
    "Year" INTEGER,
    "Jan" NUMERIC,
    "Feb" NUMERIC,
    "Mar" NUMERIC,
    "Apr" NUMERIC,
    "May" NUMERIC,
    "Jun" NUMERIC,
    "Jul" NUMERIC,
    "Aug" NUMERIC,
    "Sep" NUMERIC,
    "Oct" NUMERIC,
    "Nov" NUMERIC,
    "Dec" NUMERIC,
    "mean_year" NUMERIC,
    "mean_winter" NUMERIC,
    "mean_spring" NUMERIC,
    "mean_summer" NUMERIC,
    "mean_autumn" NUMERIC
);

CREATE TABLE temperature.hemisphere_sud (
    "Year" INTEGER,
    "Jan" NUMERIC,
    "Feb" NUMERIC,
    "Mar" NUMERIC,
    "Apr" NUMERIC,
    "May" NUMERIC,
    "Jun" NUMERIC,
    "Jul" NUMERIC,
    "Aug" NUMERIC,
    "Sep" NUMERIC,
    "Oct" NUMERIC,
    "Nov" NUMERIC,
    "Dec" NUMERIC,
    "mean_year" NUMERIC,
    "mean_winter" NUMERIC,
    "mean_spring" NUMERIC,
    "mean_summer" NUMERIC,
    "mean_autumn" NUMERIC
);

CREATE TABLE temperature.global (
    "Year" INTEGER,
    "Jan" NUMERIC,
    "Feb" NUMERIC,
    "Mar" NUMERIC,
    "Apr" NUMERIC,
    "May" NUMERIC,
    "Jun" NUMERIC,
    "Jul" NUMERIC,
    "Aug" NUMERIC,
    "Sep" NUMERIC,
    "Oct" NUMERIC,
    "Nov" NUMERIC,
    "Dec" NUMERIC,
    "mean_year" NUMERIC,
    "mean_winter" NUMERIC,
    "mean_spring" NUMERIC,
    "mean_summer" NUMERIC,
    "mean_autumn" NUMERIC
);

CREATE TABLE temperature.co2 (
    "Year" INTEGER,
	"country" VARCHAR,
    "co2" NUMERIC,
    "co2_per_capita" NUMERIC,
    "population" NUMERIC,
    "gdp" NUMERIC,
    "cement_co2" NUMERIC,
    "coal_co2" NUMERIC,
    "oil_co2" NUMERIC
);



COPY temperature.hemisphere_nord ("Year", "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec", "mean_year", "mean_winter", "mean_spring", "mean_summer", "mean_autumn")
FROM 'C:\projet\THN_cleaned.csv\THN.csv' DELIMITER ',' CSV HEADER;

COPY temperature.hemisphere_sud ("Year", "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec", "mean_year", "mean_winter", "mean_spring", "mean_summer", "mean_autumn")
FROM 'C:\projet\THS_cleaned.csv\THS.csv' DELIMITER ',' CSV HEADER;

COPY temperature.global ("Year", "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec", "mean_year", "mean_winter", "mean_spring", "mean_summer", "mean_autumn")
FROM 'C:\projet\TM_cleaned.csv\TM.csv' DELIMITER ',' CSV HEADER;

COPY temperature.co2 ("Year","country", "co2", "co2_per_capita", "population", "gdp", "cement_co2", "coal_co2", "oil_co2")
FROM 'C:\projet\CO2_cleaned.csv\CO2.csv' DELIMITER ',' CSV HEADER;



ALTER TABLE temperature.co2
ADD PRIMARY KEY ("Year");

ALTER TABLE temperature.global
ADD PRIMARY KEY ("Year");

ALTER TABLE temperature.hemisphere_nord
ADD PRIMARY KEY ("Year");

ALTER TABLE temperature.hemisphere_sud
ADD PRIMARY KEY ("Year");


SELECT * FROM temperature.hemisphere_nord LIMIT 5;
SELECT * FROM temperature.hemisphere_sud LIMIT 5;
SELECT * FROM temperature.global LIMIT 5;
SELECT * FROM temperature.co2 LIMIT 5;