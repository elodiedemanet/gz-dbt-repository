WITH calculs AS (
    SELECT * 
    FROM {{ ref('int_orders_margin') }}
    LEFT JOIN {{ ref('stg_raw__ship') }}
    USING (orders_id)
)

SELECT 
    orders_id,
    date_date,
    revenue, 
    quantity, 
    purchase_cost, 
    margin,
    shipping_fee,
    ship_cost, 
    log_cost,
    margin + shipping_fee - log_cost - ship_cost AS operational_margin  
FROM calculs

