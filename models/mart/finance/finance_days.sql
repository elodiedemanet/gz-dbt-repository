SELECT date_date
    , COUNT(orders_id) AS nb_transactions
    , SUM(revenue) AS total_revenue
    , AVG(revenue) AS avg_revenue
    , SUM(operational_margin) AS total_op_margin
    , SUM(purchase_cost) AS purchase_cost
    , SUM (shipping_fee) AS shipping_fee
    , SUM(log_cost) AS log_cost
    , SUM(quantity) AS quantity
FROM {{ ref('int_orders_operational') }}
GROUP BY date_date
