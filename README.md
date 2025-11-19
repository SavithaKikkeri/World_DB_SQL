# World_DB_SQL
# 🗺️ World Database Analysis - SQL Workbook Summary

This README summarizes the advanced SQL tasks and the optional written assignment from Day 4 of the Data Technician Workbook, focusing exclusively on querying and analysis using the **World Database**. The objective is to extract demographic, geographic, and economic insights using advanced SQL techniques.

---

## 💻 SQL Practical: Advanced Queries

The following table lists the advanced SQL queries used to analyze the `Country`, `City`, and `CountryLanguage` tables in the World database, covering aggregate functions, calculated fields, sorting, filtering, and joining data.

| Task | Objective | SQL Query |
| :--- | :--- | :--- |
| 1. Count Cities in USA | Determine the **total number of cities** in the United States (`USA`). | `select count(name) from city where CountryCode = 'USA';` |
| 2. Highest Life Expectancy | Identify the country with the **highest `LifeExpectancy`**. | `select Name, LifeExpectancy from Country order by LifeExpectancy DESC limit 1;` |
| 3. Cities with 'New' | List of all cities with names including the word **'New'**. | `select Name,from City,where Name LIKE '%New%';` |
| 4. First 10 Populous Cities | List the **first 10 cities** by `Population` in descending order. | `select Name, population from City order by population DESC limit 10;` |
| 5. Population Larger than 2M | Identify cities with a population **exceeding 2,000,000**. | `Select name, population from City where population >2000000;` |
| 6. Cities Beginning with 'Be' | List of cities that **start with the prefix 'Be'**. | `Select name, population from City where Name like 'Be%';` |
| 7. Pop Between 500k–1M | Identify cities with populations ranging **between 500,000 and 1,000,000**. | `Select name, population from City where population between '500000' AND '1000000';` |
| 8. Cities Sorted by Name | Provide a **sorted list of cities** in ascending order by name. | `select Name from City order by name ASC;` |
| 9. Most Populated City | Identify the **most populated city**. | `select Name, population from City order by population DESC limit 1;` |
| 10. City Name Frequency | List **unique city names and their counts**, sorted alphabetically. | `SELECT distinct Name, COUNT(Name), FROM city, GROUP BY Name, order by Name asc;` |
| 11. Lowest Population City | Identify the city with the **lowest population**. | `select Name, population from City order by population asc,limit 1;` |
| 12. Largest Population Country | Identify the country with the **highest population**. | `select Name, population from Country order by population desc,limit 1;` |
| 13. Capital of Spain | Identify the **capital of Spain** (using a `JOIN`). | `select country.name, City.Name from country join City on country.capital = city.ID where Country.name like 'Spain';` |
| 14. Cities in Europe | Compile a list of cities located in **Europe** (using a `JOIN`). | `select city.Name, continent from City join Country on country.capital = city.id where continent like 'Europe';` |
| 15. Average Population | Calculate the **average population** for each country. | `select country.name, avg(country.population) as avg_population from country Group by name;` |
| 16. Capital Cities Pop | Compare the populations of **capital cities** (using a `JOIN`). | `select City.Name, city.population, country.Name from country join City on country.capital = city.ID order by population DeSC;` |
| 17. Low Pop Density | Countries with a **population density ($\frac{Population}{SurfaceArea}$) less than 10**. | `select country.Name, (country.Population/country.SurfaceArea) as Population_density FROM country where (country.Population/country.SurfaceArea) <10 order by Population_density;` |
| 18. High GDP per Capita | Cities with above-average **GDP per capita ($\frac{GNP}{Population}$)**. | `select country.name, city.name, country.population, country.gnp, (country.gnp / country.population) as gdp_per_capita from city join country on country.code = city.countryCode order by gdp_per_capita desc;` |
| 19. Limit (Rows 31-40) | Data on cities ranked between **31st and 40th** by population (using `LIMIT` and `OFFSET`). | `select city.name, city.population from city order by POPULATION DESC LIMIT 10 OFFSET 30;` |


---
