--Lesson 10 � Aggregations (COUNT, SUM, AVG, GROUP BY)
--Table [property24].[dbo].[propertydata]

-- ============================================
--SECTION 1 � COUNT Aggregations (10 Questions)
-- ============================================
select * from [property24].[dbo].[PropertyData]

--1. How many total properties are in the database?

select count(*) as Total_Properties from [property24].[dbo].[PropertyData]
select count(city) as Total_properties from [property24].[dbo].[PropertyData]
select count(FLOOR_SIZE) as Total_properties from [property24].[dbo].[PropertyData]

--2. How many properties are listed in each province?

select ([province]),
count([province]) as No_of_Properties
from [property24].[dbo].[PropertyData]
group by [PROVINCE]

--3. How many properties are listed in each city?

select ([CITY]),
count([province]) as No_of_Properties
from [property24].[dbo].[PropertyData]
group by [city]

--4. How many properties have more than 2 bedrooms?

select count(*) as No_of_Properties_with_3plus_Bedrooms 
from [property24].[dbo].[PropertyData] where BEDROOMS > 2

--5. How many properties have 2 or more bathrooms?

select count(*) as No_of_Properties_with_2plus_Bathrooms
from [property24].[dbo].[PropertyData] where BATHROOMS >= 2

--6. How many properties have parking for at least 2 cars?

select count(*) as No_of_Properties_with_at_least_2Parking_spots
from [property24].[dbo].[PropertyData] where PARKING >= 2

--7. How many properties are priced above R3,000,000?

select count(*) as No_of_Properties_priced_above_R3000000
from [property24].[dbo].[PropertyData] where PROPERTY_PRICE > 3000000

--8. How many properties are in Gauteng?

select count(*) as No_of_Properties_in_Gauteng
from [property24].[dbo].[PropertyData] where PROVINCE='Gauteng'

--9. How many properties per province have floor size greater than 200?

select ([PROVINCE]),
count([FLOOR_SIZE]) as No_of_Properties_with_floor_size_greater_than_200
from [property24].[dbo].[PropertyData]
where FLOOR_SIZE > 200
group by [PROVINCE]

--10. How many distinct provinces are in the table?

select [PROVINCE],
count(distinct PROVINCE) as No_of_distinct_provinces
from [property24].[dbo].[PropertyData]
group by [PROVINCE]


--SECTION 2 � SUM Aggregations (10 Questions)

--11. What is the total value of all properties combined?

select
sum(cast([PROPERTY_PRICE] as bigint)) as total_value_of_all_properties
from [property24].[dbo].[PropertyData];

--12. What is the total property value per province?

select ([PROVINCE]),
sum(cast([PROPERTY_PRICE] as bigint)) as total_property_value_per_province
from [property24].[dbo].[PropertyData]
group by [PROVINCE]
order by total_property_value_per_province desc;

--13. What is the total property value per city?

select ([CITY]),
sum(cast([PROPERTY_PRICE] as bigint)) as total_property_value_per_city
from [property24].[dbo].[PropertyData]
group by [CITY]
order by total_property_value_per_city desc;

--14. What is the total monthly repayment for all properties?

select
sum(cast([Monthly_Repayment] as bigint)) as total_monthly_repayment_for_all_properties
from  [property24].[dbo].[PropertyData];

--15. What is the total monthly repayment per province?

select ([PROVINCE]),
sum(cast([Monthly_Repayment] as bigint)) as total_monthly_repayment_per_province
from [property24].[dbo].[PropertyData]
group by [PROVINCE]
order by total_monthly_repayment_per_province desc;

--16. What is the total once-off cost for all properties?

select
sum(cast([Total_Once_off_Costs] as bigint)) as total_once_off_cost_for_all_properties
from [property24].[dbo].[PropertyData];

--17. What is the total once-off cost per province?

select ([PROVINCE]),
sum(cast([Total_Once_off_Costs] as bigint)) as total_once_off_cost_per_province
from [property24].[dbo].[PropertyData]
group by [PROVINCE]
order by total_once_off_cost_per_province desc;

--18. What is the total property value for Gauteng?

select
sum(cast([PROPERTY_PRICE] as bigint)) as total_property_value_for_Gauteng
from [property24].[dbo].[PropertyData]
where [PROVINCE] = 'Gauteng';

--19. What is the total property value for properties priced above R4,000,000?

select
sum(cast([PROPERTY_PRICE] as bigint)) as total_value_for_properties_priced_above_4000000
from [property24].[dbo].[PropertyData]
where [PROPERTY_PRICE] >= 4000000;

--20. What is the total minimum gross monthly income required per province?

select ([PROVINCE]),
sum(cast([Min_Gross_Monthly_Income] as bigint)) as total_minimum_gross_monthly_income_per_province
from [property24].[dbo].[PropertyData]
group by [PROVINCE]
order by total_minimum_gross_monthly_income_per_province desc;


--SECTION 3 � AVG Aggregations (10 Questions)

--21. What is the average property price overall?

select
avg(cast([PROPERTY_PRICE] as bigint)) as average_property_price
from[property24].[dbo].[PropertyData];

--22. What is the average property price per province?

select ([PROVINCE]),
avg(cast([PROPERTY_PRICE] as bigint)) as average_property_value_per_province
from [property24].[dbo].[PropertyData]
group by [PROVINCE]
order by average_property_value_per_province desc;

--23. What is the average property price per city?

select ([CITY]),
avg(cast([PROPERTY_PRICE] as bigint)) as average_property_value_per_city
from [property24].[dbo].[PropertyData]
group by [CITY]
order by average_property_value_per_city desc;

--24. What is the average number of bedrooms per province?

select ([PROVINCE]),
avg(cast([BEDROOMS] as int)) as average_number_of_bedrooms_per_province
from [property24].[dbo].[PropertyData]
group by [PROVINCE]
order by average_number_of_bedrooms_per_province desc;

--25. What is the average number of bathrooms per province?

select ([PROVINCE]),
avg(cast([BATHROOMS] as int)) as average_number_of_bathrooms_per_province
from [property24].[dbo].[PropertyData]
group by [PROVINCE]
order by average_number_of_bathrooms_per_province desc;

--26. What is the average floor size per province?

select ([PROVINCE]),
avg(cast([FLOOR_SIZE] as int)) as average_floor_size_per_province
from [property24].[dbo].[PropertyData]
group by [PROVINCE]
order by average_floor_size_per_province desc;

--27. What is the average monthly repayment per province?

select ([PROVINCE]),
avg(cast([Monthly_Repayment] as int)) as average_monthly_repayment_per_province
from [property24].[dbo].[PropertyData]
group by [PROVINCE]
order by average_monthly_repayment_per_province desc;

--28. What is the average once-off cost per province?

select ([PROVINCE]),
avg(cast([Total_Once_off_Costs] as bigint)) as average_once_off_cost_per_province
from [property24].[dbo].[PropertyData]
group by [PROVINCE]
order by average_once_off_cost_per_province desc;

--29. What is the average minimum gross monthly income per province?

select ([PROVINCE]),
avg(cast([Min_Gross_Monthly_Income] as bigint)) as average_minimum_gross_monthly_income_per_province
from [property24].[dbo].[PropertyData]
group by [PROVINCE]
order by average_minimum_gross_monthly_income_per_province desc;

--30. What is the average property price for properties above R3,000,000?

select
avg(cast([PROPERTY_PRICE] as bigint)) as average_property_price_for_properties_priced_above_3000000
from [property24].[dbo].[PropertyData]
where [PROPERTY_PRICE] >= 3000000;


--SECTION 4 � GROUP BY + Filtering (10 Questions)

--31. Which province has the highest average property price?

select top 1 ([PROVINCE]),
avg(cast([PROPERTY_PRICE] as bigint)) as highest_average_property_price
from [property24].[dbo].[PropertyData]
group by [PROVINCE]
order by highest_average_property_price desc;

--32. Which province has the lowest average property price?

select top 1 ([PROVINCE]),
avg(cast([PROPERTY_PRICE] as bigint)) as lowest_average_property_price
from [property24].[dbo].[PropertyData]
group by [PROVINCE]
order by lowest_average_property_price asc;

--33. Which city has the highest total property value?

select top 1 ([CITY]),
sum(cast([PROPERTY_PRICE] as bigint)) as highest_total_property_value
from [property24].[dbo].[PropertyData]
group by [CITY]
order by highest_total_property_value desc;

--34. Which city has the lowest average property price?

select top 1 ([CITY]),
avg(cast([PROPERTY_PRICE] as bigint)) as highest_total_property_value
from [property24].[dbo].[PropertyData]
group by [CITY]
order by highest_total_property_value asc;

--35. How many properties per province are priced above R2,000,000?

select ([PROVINCE]),
count(*) as no_of_properties_above_2000000
from [property24].[dbo].[PropertyData]
where [PROPERTY_PRICE] >= 2000000
group by [PROVINCE]
order by no_of_properties_above_2000000 desc;

--36. What is the average floor size per province for properties above R3,000,000?

select([PROVINCE]),
avg(cast([FLOOR_SIZE] as int)) as average_floor_size_for_properties_above_3000000
from [property24].[dbo].[PropertyData]
where [PROPERTY_PRICE] >= 3000000
group by [PROVINCE]
order by average_floor_size_for_properties_above_3000000 desc;

--37. What is the total property value per province for properties with 3 or more bedrooms?

select([PROVINCE]),
sum(cast([PROPERTY_PRICE] as bigint)) as total_property_value_for_properties_with_3_or_more_bedrooms
from [property24].[dbo].[PropertyData]
where [BEDROOMS] >= 3
group by [PROVINCE]
order by total_property_value_for_properties_with_3_or_more_bedrooms desc;

--38. What is the average monthly repayment per province for properties above R4,000,000?

select [PROVINCE],
avg(cast([Monthly_Repayment] as bigint)) as average_monthly_repayment_per_province_above_4000000
from [property24].[dbo].[PropertyData]
where [PROPERTY_PRICE] >= 4000000
group by [PROVINCE]
order by average_monthly_repayment_per_province_above_4000000;

--39. How many properties per city have parking for 2 or more cars?

select ([CITY]),
count (*) as properties_per_city_with_parking_for_2_or_more_cars
from [property24].[dbo].[PropertyData]
where [PARKING] >= 2
group by [CITY]
order by properties_per_city_with_parking_for_2_or_more_cars desc;

--40. What is the average minimum gross monthly income per province for properties above R5,000,000?

select [PROVINCE],
avg([Min_Gross_Monthly_Income]) as average_minimum_gross_monthly_income_per_province_above_5000000
from [property24].[dbo].[PropertyData]
where [PROPERTY_PRICE] >= 5000000
group by [PROVINCE]
order by average_minimum_gross_monthly_income_per_province_above_5000000 desc;