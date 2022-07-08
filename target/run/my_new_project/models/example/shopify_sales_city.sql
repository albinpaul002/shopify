

      create or replace transient table trainingdb.albinschema.shopify_sales_city  as
      (Select 
cast(CREATED_AT as DATE) AS ORDER_DATE ,SHIPPING_ADDRESS_CITY as CITY,SHIPPING_ADDRESS_PROVINCE as PROVINCE,SHIPPING_ADDRESS_COUNTRY as COUNTRY, SUM(TOTAL_PRICE_USD) as TOTAL_SALES
FROM "FIVETRAN_DATABASE"."SHOPIFY_DS"."ORDER"
where CITY IS NOT NULL AND COUNTRY IS NOT NULL 
group by 1,2,3,4
HAVING TOTAL_SALES>0
order by 3 desc
      );
    