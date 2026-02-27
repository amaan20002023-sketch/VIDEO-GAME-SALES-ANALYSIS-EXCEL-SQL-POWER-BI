---. Retrieve total sales for each publisher, ranked in descending order. (7 Marks)   
select p.publisher_name,
       round(sum(s.na_sales+s.eu_sales+s.jp_sales+s.other_sales),2) as Total_sales
       from sales s
       join publishers p on s.publisher_id = p.publisher_id
       group by p.publisher_name
       order by Total_sales desc

       /*2. Identify the publisher with the highest number of best-selling games (above 10 million 
sales).*/


WITH BestSellers AS (
    SELECT 
        p.Publisher_Name,
        COUNT(*) AS Num_BestSellers
    FROM sales s
    JOIN publishers p ON s.Publisher_ID = p.Publisher_ID
    GROUP BY p.Publisher_Name, s.Game_Name
    HAVING SUM(s.NA_Sales + s.EU_Sales + s.JP_Sales + s.Other_Sales) > 10
)
SELECT top 1
    Publisher_Name,
    Num_BestSellers
FROM BestSellers
ORDER BY Num_BestSellers DESC


 --3. Calculate the percentage contribution of each publisher to total industry sales. 

 with totalindustry as (
 select 
 sum(s.na_sales+s.eu_sales+s.jp_sales+s.other_sales) as total_global_sales
 from sales s
 ),
 publishersales as (
  select p.publisher_name,
  sum(s.na_sales+s.eu_sales+s.jp_sales+s.other_sales) as publisher_total
  from sales s
  join publishers p on s.publisher_id = p.publisher_id
  group by p.publisher_name)
  select 
  publisher_name,
  publisher_total,
  round((publisher_total/total_global_sales)*100,2) as percent_contribution
  from publishersales
  cross join totalindustry
  order by percent_contribution desc

  --4. Find the publisher with the highest average sales per game. (8 Marks)   
  select top 1
  p.publisher_name,
  round(avg(s.na_sales+s.eu_sales+s.jp_sales+s.other_sales),2) as avg_sales_per_game,
  count(*) as num_games
  from sales s
  join publishers p
  on p.publisher_id = s.publisher_id
  group by p.publisher_name
  having count(*) >=5
  order by avg_sales_per_game desc

  --6. Determine which publisher had the longest consistent sales streak. 
 



  -- Step 1: Yearly sales per publisher (only years with >0 sales)
with Yearly AS (
    SELECT 
        p.Publisher_Name,
        s.Publish_Year AS Year,
        SUM(s.NA_Sales + s.EU_Sales + s.JP_Sales + s.Other_Sales) AS Total_Sales
    FROM sales s
    JOIN publishers p ON s.Publisher_ID = p.Publisher_ID
    GROUP BY p.Publisher_Name, s.Publish_Year
    HAVING SUM(s.NA_Sales + s.EU_Sales + s.JP_Sales + s.Other_Sales) > 0
),

-- Step 2: Detect streak breaks using LAG (gap != 1 year)
WithGaps AS (
    SELECT 
        Publisher_Name,
        Year,
        LAG(Year) OVER (PARTITION BY Publisher_Name ORDER BY Year) AS Prev_Year,
        CASE 
            WHEN LAG(Year) OVER (PARTITION BY Publisher_Name ORDER BY Year) IS NULL THEN 1
            WHEN Year - LAG(Year) OVER (PARTITION BY Publisher_Name ORDER BY Year) = 1 THEN 0
            ELSE 1  -- streak break
        END AS Streak_Start
    FROM Yearly
),

-- Step 3: Assign streak group ID (cumulative sum of starts)
Streaks AS (
    SELECT 
        Publisher_Name,
        Year,
        SUM(Streak_Start) OVER (PARTITION BY Publisher_Name ORDER BY Year) AS Streak_Group
    FROM WithGaps
),

-- Step 4: Count length of each streak per publisher
StreakLengths AS (
    SELECT 
        Publisher_Name,
        Streak_Group,
        COUNT(*) AS Streak_Length
    FROM Streaks
    GROUP BY Publisher_Name, Streak_Group
)

-- Final: Longest streak per publisher, then the overall max
SELECT top 5
    Publisher_Name,
    MAX(Streak_Length) AS Longest_Consecutive_Years
FROM StreakLengths
GROUP BY Publisher_Name
ORDER BY Longest_Consecutive_Years DESC
; 





