#CREATE SCHEMA Group_project;
##My SQL Code##
ALTER TABLE ifood ADD sum_purchase INT; 

UPDATE ifood
SET sum_purchase = NumWebPurchases + NumCatalogPurchases + NumStorePurchases;			

#Compute the median of total purchase
SELECT AVG(sum_purchase) AS Median
FROM (
  SELECT sum_purchase, @rowindex:=@rowindex + 1 AS rowindex, @total_rows AS total_rows
  FROM ifood, (SELECT @rowindex := 0, @total_rows := (SELECT COUNT(*) FROM ifood)) r
  ORDER BY sum_purchase
) AS d
WHERE rowindex IN (FLOOR(total_rows / 2), CEIL(total_rows / 2));

#Compute the average amount spend on wines that purchases below the median
SELECT AVG(MntWines) AS avg_wines_lower
FROM ifood
WHERE sum_purchase <= (
    SELECT AVG(sum_purchase) AS Median
    FROM (
        SELECT sum_purchase, @rowindex:=@rowindex + 1 AS rowindex, @total_rows AS total_rows
        FROM ifood, (SELECT @rowindex := 0, @total_rows := (SELECT COUNT(*) FROM ifood)) r
        ORDER BY sum_purchase
    ) AS d
    WHERE rowindex IN (FLOOR(total_rows / 2), CEIL(total_rows / 2))
);
#Compute the average amount spend on wines that purchases above the median
SELECT AVG(MntWines) AS avg_wines_upper
FROM ifood
WHERE sum_purchase > (
    SELECT AVG(sum_purchase) AS Median
    FROM (
        SELECT sum_purchase, @rowindex:=@rowindex + 1 AS rowindex, @total_rows AS total_rows
        FROM ifood, (SELECT @rowindex := 0, @total_rows := (SELECT COUNT(*) FROM ifood)) r
        ORDER BY sum_purchase
    ) AS d
    WHERE rowindex IN (FLOOR(total_rows / 2), CEIL(total_rows / 2))
);





#Compute the average income that purchases below the median
SELECT AVG(Income) AS avg_income_lower
FROM ifood
WHERE sum_purchase <= (
    SELECT AVG(sum_purchase) AS Median
    FROM (
        SELECT sum_purchase, @rowindex:=@rowindex + 1 AS rowindex, @total_rows AS total_rows
        FROM ifood, (SELECT @rowindex := 0, @total_rows := (SELECT COUNT(*) FROM ifood)) r
        ORDER BY sum_purchase
    ) AS d
    WHERE rowindex IN (FLOOR(total_rows / 2), CEIL(total_rows / 2))
);



#Compute the average incomes that purchases above the median
SELECT AVG(Income) AS avg_income_upper
FROM ifood
WHERE sum_purchase > (
    SELECT AVG(sum_purchase) AS Median
    FROM (
        SELECT sum_purchase, @rowindex:=@rowindex + 1 AS rowindex, @total_rows AS total_rows
        FROM ifood, (SELECT @rowindex := 0, @total_rows := (SELECT COUNT(*) FROM ifood)) r
        ORDER BY sum_purchase
    ) AS d
    WHERE rowindex IN (FLOOR(total_rows / 2), CEIL(total_rows / 2))
);
