/* Covid-19 Data Exploration */
 

Select Location, date, total_cases, total_deaths, population
from PortfolioProject.`covid-death1`

# Total Cases vs Total Deaths
# It Shows likelihood of dying in our country

Select Location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as DeathPercentage
from PortfolioProject.`covid-death1`
where location like 'India'

-- Countries with Highest Infection Rate compared to Population

SELECT Location, population, MAX(total_cases) as HighestInfectionCoount, MAX((total_cases/population)*100) as PercentPopulationInfected
from PortfolioProject.`covid-death1`
GROUP BY Location, population
order by PercentPopulationInfected desc

-- Countries with Highest Death Count per Population

SELECT Location, MAX(total_deaths) as TotalDeathCount
from PortfolioProject.`covid-death1`
GROUP BY Location
order by TotalDeathCount desc;

# Showing contintents with the highest death count per population

SELECT continent, MAX(total_deaths) as TotalDeathCount
from PortfolioProject.`covid-death1`
GROUP BY continent
order by TotalDeathCount desc;

-- GLOBAL NUMBERS

Select SUM(new_cases) as total_cases, SUM(new_deaths) as total_deaths, SUM(new_deaths)/SUM(New_Cases)*100 as DeathPercentage
From -- GLOBAL NUMBERS

Select SUM(new_cases) as total_cases, SUM(new_deaths) as total_deaths, SUM(new_deaths)/SUM(new_Cases)*100 as DeathPercentage
From PortfolioProject.`covid-death1`

-- Total Population vs Vaccinations
-- Shows Percentage of Population that has recieved at least one Covid Vaccine

Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, sum(vac.new_vaccinations) OVER (Partition by dea.Location Order by dea.location, dea.date) as RollingPeopleVaccinated
From PortfolioProject.`covid-death1` dea 
Join PortfolioProject.`covid-vaccination` vac
	On dea.population = vac.population
    








