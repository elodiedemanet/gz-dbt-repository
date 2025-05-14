WITH calcul AS (
    SELECT *
FROM {{ ref('stg_raw__sales') }} AS s
LEFT JOIN {{ ref('stg_raw__product') }} AS p
USING (products_id)
)

SELECT date_date  
    , orders_id
    , products_id 
    , revenue
    , quantity 
    , purchase_price
    , quantity * purchase_price AS purchase_cost
    , revenue - (quantity * purchase_price) AS margin 
FROM calcul 




