-- COVID 19 Analysis Project--

-- Please note data with ISO Code OWID is not linked to a country. Furthermore, this data will be excluded from this project--

-- Data Cleansing + Quality Checks--
-- Format dates in Covid Deaths Table--
UPDATE coviddeaths
SET date = STR_TO_DATE(date, '%d-%m-%Y');

-- Format dates in Covid Vaccine Table--
UPDATE covid_vac
SET date = STR_TO_DATE(date, '%d-%m-%Y');

-- Checking for duplicates in Covid Vaccine Table--
select date, continent, location, count(*) as dup
from covid_vac
group by date, continent,location
having dup > 1;

-- Checking for duplicates in Covid Vaccine Table--
select date, continent, location, count(*) as dup
from coviddeaths
group by date, continent,location
having dup > 1;


-- Tableau Queries--

-- Overall New Cases vs Death (Query used for Tableau Dashboard)
select
	sum(new_deaths) as Total_Deaths,
	sum(new_cases) as Total_Cases,
    (sum(new_deaths) / sum(new_cases)) * 100 as Cases_To_Death_Ratio
from
	coviddeaths
where iso_code not like '%OWID%';

-- Find top 10 highest rate of death vs case rates by country (Query used for Tableau Dashboard)--
select
	Continent,
    Location,
    sum(new_deaths) as Total_Deaths,
    sum(new_cases) as Total_Cases,
	(sum(new_deaths) / sum(new_cases)) * 100 AS Death_Percent
FROM
	coviddeaths
where iso_code not like '%owid%'
group by continent,location
order by Death_Percent desc
limit 10;

-- Find top 10 highest rate of covid death rates relative to the population (Query used for Tableau Dashboard)--
select
	continent,
    location,
    max(population) as Population,
    sum(new_deaths) as Total_Deaths,
    sum(new_cases) as Total_Cases,
    (sum(new_deaths)/max(population)) * 100 as Pop_Death_Perecentage
from
	coviddeaths
    where iso_code not like '%OWID%'
    group by continent, location
    order by Pop_Death_Perecentage desc;
    
-- Compare the Death to Case Ratio Month Over Month (Query used for Tableau Dashboard) --
select
	Continent,
	Location,
    concat(LPAD(month(date), 2,'0'), '-', year(date)) as Month_Year,
    YEAR(date) as Year,
    sum(new_deaths) as Death_Count,
    sum(new_cases) as Total_Cases
from
	coviddeaths
where iso_code not like '%OWID%'
group by continent,location, Month_Year, Year
order by Year asc;

-- Death Count By Continent (Query used for Tableau Dashboard)--
select
	continent,
    sum(new_deaths) as Total_Deaths
from
	coviddeaths
where iso_code not like '%OWID%'
group by continent
order by Total_deaths desc;

-- List out top 10 countries with highest number of infections (Query used for Tableau Dashboard)--

select
	Continent,
	Location,
    sum(new_cases) as Total_Cases
from 
	coviddeaths
where iso_code not like '%OWID%'
group by continent, location
order by Total_Cases desc
limit 10;


-- Additional Queries For Analysis--

-- Find the total average amount of cases for all countries--
WITH cte AS (
  SELECT location, sum(new_cases) AS sum_of_total_cases
  FROM coviddeaths
  where iso_code not like '%OWID%'
  group by location
)
SELECT round(AVG(sum_of_total_cases),2) AS Avg_Cases
FROM cte;

-- Find the total average amount of cases for all countries and then only display location with cases more than the average-
with cte as (
	select location, sum(new_cases) as sum_of_total_cases
    from coviddeaths
    where iso_code not like '%OWID%'
    group by location
    order by sum_of_total_cases asc
)

select location, sum_of_total_cases 
from cte
where sum_of_total_cases > (
select avg(sum_of_total_cases) as avg_of_total_cases
from cte
);

-- List out top 20 countries with lowest number of cases--
select
	continent,
	location,
    sum(new_cases) as total_cases
from
	coviddeaths
where total_cases <> 0
group by continent, location
order by total_cases asc
limit 20;


-- Calculate the running total of new vaccines and vaccine to population ratio --
with Vac_vs_Pop (continent, location, date, population, new_vaccination, Running_Total_Vaccines)
as
(select
	cd.continent,
    cd.location,
    cd.date,
    cd.population,
    cv.new_vaccinations,
    sum(cv.new_vaccinations) over (partition by cd.location order by cd.location, cd.date) as Running_Total_Vaccines
from
	coviddeaths cd
		join
	covid_vac cv on cd.location = cv.location and cd.date = cv.date
where cd.iso_code not like '%owid%'
)

select *, (Running_Total_Vaccines/Population) * 100 as Vaccine_to_Pop_Ratio
from Vac_vs_Pop;


-- Find top 10 lowest rate of vaccinated countries relative to population--
select
	cv.continent,
    cv.location,
    max(cv.people_fully_vaccinated) as Vaccinated,
    cd.population,
    (MAX(cv.people_fully_vaccinated) / MAX(cd.population)) * 100 AS Vaccinated_Population
from
	covid_vac cv
		join
	coviddeaths cd on cv.location = cd.location and cv.date = cd.date
where cv.people_fully_vaccinated <> 0
group by continent, location, population
order by Vaccinated_Population asc
limit 10;

-- List out top 10 countries with highest number of fully vaccinated individuals--

select
	Continent,
    Location,
    max(people_fully_vaccinated) as Fully_Vaccinated
from
	covid_vac
where iso_code not like '%owid%'
group by iso_code, continent, location
order by max(people_fully_vaccinated) desc;


-- Find top 10 highest(Exclude over 100%) rate of vaccinatinated countries relative to population--
select
	cv.continent,
    cv.location,
    max(cv.people_fully_vaccinated) as Vaccinated,
    max(cd.population) as population,
    (MAX(cv.people_fully_vaccinated) / MAX(cd.population)) * 100 AS Vaccinated_Population_Percent
from
	covid_vac cv
		join
	coviddeaths cd on cv.location = cd.location and cv.date = cd.date
group by continent, location, population
having Vaccinated_Population_Percent <= 100
order by Vaccinated_Population_Percent desc
limit 10;