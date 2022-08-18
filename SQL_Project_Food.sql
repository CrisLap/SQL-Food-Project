/*The countries that waste the most numbers of commodities 
ordered by the country that waste most
*/
SELECT country, COUNT(commodity) as number_of_commodities_wasted 
FROM Food_Data 
GROUP BY country
ORDER BY number_of_commodities_wasted DESC;

/*It is not strange that the United States are in first place.
 We need to investigate not only in which state
 there is the most waste, but also where this waste 
 is located (in the supply chain?, during harvest?).
*/
-- country with most waste in the harvest
SELECT country, COUNT(food_supply_stage) as waste_in_harvest
FROM Food_Data 
WHERE food_supply_stage  ='Harvest'
GROUP BY country 
ORDER BY waste_in_harvest DESC;
/*As one might expect, many african states have 
a lot of crop waste
*/
-- the countries that waste less numbers of commodities
SELECT country, COUNT(commodity) as number_of_commodities_wasted
FROM Food_Data 
GROUP BY country 
ORDER BY number_of_commodities_wasted;
/*It is not credible that there are states with only one type
 of wasted food: data is probably missing. 
 To identify the most virtuous states, I would say that 
 a good value is on the 10 types of wasted food
*/
-- the most wasted food
SELECT country, commodity, loss_percentage, food_supply_stage, YEAR
FROM Food_Data 
where loss_percentage ='9.99'
ORDER BY 'year' DESC;
/* The highest wastage rate is 9.99% and the most wasted food 
in recent times (2016) is wheat in Chad where wastage occurs 
throughout the supply chain
*/