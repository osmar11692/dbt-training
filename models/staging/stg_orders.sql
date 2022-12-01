select
--Estos campos vienen de raw orders
o.orderid,
o.orderdate,
o.shipdate,
o.shipmode,
o.ORDERSELLINGPRICE,
o.ORDERCOSTPRICE,
o.ORDERSELLINGPRICE - o.ORDERCOSTPRICE as ORDERPROFIT,
--Estos campos vienen de raw customer
c.customerid,
c.customername,
c.segment,
c.country,
--Estos campos vienen de raw product
p.productid,
p.category,
p.productname,
p.subcategory
FROM {{ ref('raw_orders') }} as o
left join {{ ref('raw_customer') }} as c on o.customerid = c.customerid
left join {{ ref('raw_product') }} as p on o.productid = p.productid