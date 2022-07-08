

      create or replace transient table trainingdb.albinschema.shopify_daily_avg_order  as
      (-- Use the `ref` function to select from other models

SELECT CAST(CREATED_AT AS DATE)AS ORDER_DATE,ROUND(AVG(TOTAL_PRICE_USD),2) AS AVG_SALES 
FROM "FIVETRAN_DATABASE"."SHOPIFY_DS"."ORDER"
GROUP BY 1
ORDER BY 1
      );
    