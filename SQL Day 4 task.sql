use world;
/*Count Cities in USA: Scenario: You've been tasked with conducting a demographic analysis of cities in the United States. 
Your first step is to determine the total number of cities within the country to provide a baseline for further analysis. */

select *
from country;
/*Count Cities in USA: Scenario: You've been tasked with conducting a demographic analysis of cities in the United States. Your first step is to determine the total number of cities within the country to provide a baseline for further analysis. */

select count(Name) as TotalCityUSA
from city
where CountryCode= 'USA';

/*Country with Highest Life Expectancy: Scenario: As part of a global health initiative, 
you've been assigned to identify the country with the highest life expectancy. This information will be crucial for prioritising healthcare resources and interventions. */
select LifeExpectancy,Name
from Country
order by LifeExpectancy DESC
Limit 1;

  /*"New Year Promotion: Featuring Cities with 'New : Scenario: In anticipation of the upcoming New Year,
  your travel agency is gearing up for a special promotion featuring cities with names including the word 'New'.
  You're tasked with swiftly compiling a list of all cities from around the world. This curated selection will be essential in creating promotional materials 
  and enticing travellers with exciting destinations to kick off the New Year in style. */
  select city.Name, city.CountryCode, country.Name
  From City
  inner join country
  on city.countrycode = country.code
  Where country.Name like '%New%';
  
  select city.Name, city.CountryCode, country.Name 

  From City 

  inner join country 

  on city.countrycode = country.code 

  Where country.Name like '%New%' 

 Order by country.Name; 
  
  
  /*Display Columns with Limit (First 10 Rows): Scenario: You're tasked with providing a brief overview of the most populous cities in the world.
  To keep the report concise, you're instructed to list only the first 10 cities by population from the database. */
  select Population, Name, CountryCode
  From city
  order by population Desc
  limit 10;
  
  /*Cities with Population Larger than 2,000,000: Scenario: A real estate developer is interested in cities with substantial population sizes for 
  potential investment opportunities.
  You're tasked with identifying cities from the database with populations exceeding 2 million to focus their research efforts. */
  Select name,population,countrycode
  from city
  where population > 2000000
  order by Population;
  
  /*Cities Beginning with 'Be' Prefix: Scenario: A travel blogger is planning a series of articles featuring cities with unique names.
  You're tasked with compiling a list of cities from the database that start with the prefix 'Be' to assist in the blogger's content creation process*/
  select name
  from city
  where name like 'Be%';
  
  /*Cities with Population Between 500,000-1,000,000: 
  Scenario: An urban planning committee needs to identify mid-sized cities suitable for infrastructure development projects.
  You're tasked with identifying cities with populations ranging between 500,000 and 1 million to inform their decision-making process.*/
  Select name,population,countrycode
  from city
  where population between 500000 And 1000000
  order by Population;
  
  /*Display Cities Sorted by Name in Ascending Order: Scenario: A geography teacher is preparing a lesson on alphabetical order using city names.
  You're tasked with providing a sorted list of cities from the database in ascending order by name to support the lesson plan*/
  
  select name
  from city
  order by name ASC;
  
  /*Most Populated City: Scenario: A real estate investment firm is interested in cities with significant population
  densities for potential development projects. You're tasked with identifying the most populated city from 
  the database to guide their investment decisions and strategic planning.*/
  select *
  from city
  order by population desc
  limit 1;
  
  
  /* City Name Frequency Analysis: Supporting Geography Education Scenario: In a geography class, 
  students are learning about the distribution of city names around the world. The teacher, 
  in preparation for a lesson on city name frequencies, wants to provide students with a list of unique city names sorted alphabetically,
  along with their respective counts of occurrences in the database. You're tasked with this sorted list to support the geography teacher. */
  
select name, count(name) as frequency
from city
group by name
order by name;

select * 

  from country 

  order by population desc 

  limit 1; 
  
  /*Capital of Spain: Scenario: A travel agency is organising tours across Europe and needs accurate information on capital cities. 
  You're tasked with identifying the capital of Spain from the database to ensure itinerary accuracy and 
  provide travellers with essential destination information. */
  
  select name, capital, region, GovernmentForm,code2
  from country
  where name= 'Spain';
  
  select * from country;
  
  /*Cities in Europe: Scenario: A European cultural exchange program is seeking to connect students with cities across the continent.
  You're tasked with compiling a list of cities located in Europe from the database to facilitate program planning and student engagement*/
  
  select c.name, c.countrycode, Co.continent
  from city as c
  inner join country as co
  on c.countrycode=co.Code
  where continent = 'Europe';
  
  /*Average Population by Country: Scenario: A demographic research team is conducting a comparative analysis of population distributions across countries. 
  You're tasked with calculating the average population for each country from the database to provide valuable insights into global population trends.*/
  
  select AVG(population), countrycode
  from city
  Group by CountryCode
  order by avg(Population); 
  
    select co.name, co.capital, co.code2, c.name
    from country as co
  inner join city as c
  on c.countrycode=co.code
  where co.name= 'Spain'; 
  
 /*Capital Cities Population Comparison: Scenario: A statistical analysis firm is examining population distributions between capital cities worldwide.
 You're tasked with comparing the populations of capital cities from different countries to identify trends and patterns in urban demographics.*/
 
 select co.name, co.capital, co.code2, c.name, c.population
    from country as co
  inner join city as c
  on c.countrycode=co.code
 order by c.population; 
 
 /*Countries with Low Population Density: Scenario: An agricultural research institute is studying countries with low population densities for potential agricultural development projects.
 You're tasked with identifying countries with sparse populations from the database to support the institute's research efforts. */
 select co.name as country, co.capital, co.code2, c.name, c.population
    from country as co
  inner join city as c
  on c.countrycode=co.code
 order by c.population 
 limit 1; 
 
 /*Cities with High GDP per Capita: Scenario: An economic consulting firm is analysing cities with high GDP per capita for investment opportunities.
 You're tasked with identifying cities with above-average GDP per capita from the database to assist the firm in identifying potential investment destinations.*/
 select c.name,  co.name, co.Population, (co.gnp/co.Population) as GDPperCapita
 from city as c
 inner join country as co
 on c.CountryCode=co.Code
 where (co.gnp/co.Population) > (select avg(co.gnp/co.Population) from country
 where co.population>0)
 order by (co.gnp/co.Population) Desc;
 
 select c.name,  co.name, co.Population, (co.gnp/co.Population) as GDPperCapita
from city as c
inner join country as co
on c.CountryCode=co.Code
where (co.gnp/co.Population) > (select avg(gnp/Population) from country)
order by (co.gnp/co.Population) Desc;
 
 select ci.name, (co.gnp*1000000/co.population) as gdp
from country as co
join city as ci
on co.code = ci.countrycode
where  (co.gnp*1000000/co.population) > (select avg(gnp*1000000/population)from country);

 /*Display Columns with Limit (Rows 31-40): 
 Scenario: A market research firm requires detailed information on cities beyond the top rankings for a comprehensive analysis.
 You're tasked with providing data on cities ranked between 31st and 40th by population to ensure a thorough understanding of urban demographics. */
 
select * 
 from city 
 order by Population DESC
 limit 10
 offset 30;