with 

source as (

    select * from {{ source('raw', 'sales') }}

),

renamed as (

    select
        date_date,
        orders_id,
        pdt_id as products_id,
        revenue,
        quantity,
        CONCAT(orders_id, '-',pdt_id) AS pk_order_product
    from source
)

select * from renamed
