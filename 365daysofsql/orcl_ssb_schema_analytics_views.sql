SELECT
  dwdate_hier.member_name as year,
  part_hier.member_name as part,
  customer_hier.c_region,
  customer_hier.member_name as customer,
  lo_quantity,
  lo_revenue
FROM  ssb.ssb_av
  HIERARCHIES (
    dwdate_hier,
    part_hier,
    customer_hier)
WHERE
  dwdate_hier.d_year = '1998'
  AND dwdate_hier.level_name = 'MONTH'
  AND part_hier.level_name = 'MANUFACTURER'
  AND customer_hier.c_region = 'AMERICA'
  AND customer_hier.level_name = 'NATION'
ORDER BY
  dwdate_hier.hier_order,
  part_hier.hier_order,
  customer_hier.hier_order;
 
SELECT
  dwdate_hier.member_name as time,
  part_hier.member_name as part,
  customer_hier.member_name as customer,
  supplier_hier.member_name as supplier,
  lo_quantity,
  lo_supplycost
FROM  ssb.ssb_av
  HIERARCHIES (
    dwdate_hier,
    part_hier,
    customer_hier,
    supplier_hier)
WHERE
  dwdate_hier.d_year = '1998'
  AND dwdate_hier.level_name = 'MONTH'
  AND part_hier.level_name = 'MANUFACTURER'
  AND customer_hier.c_region = 'AMERICA'
  AND customer_hier.c_nation = 'CANADA'
  AND customer_hier.level_name = 'CITY'
  AND supplier_hier.s_region = 'ASIA'
  AND supplier_hier.level_name = 'REGION'
ORDER BY
  dwdate_hier.hier_order,
  part_hier.hier_order,
  customer_hier.hier_order,
  supplier_hier.hier_order; 
 
SELECT
  dwdate_hier.member_name as year,
  part_hier.member_name as part,
  customer_hier.member_name as customer,
  supplier_hier.member_name as supplier,
  lo_quantity,
  lo_revenue,
  lo_supplycost  
FROM  ssb.ssb_av
  HIERARCHIES (
    dwdate_hier,
    part_hier,
    customer_hier,
    supplier_hier)
WHERE
  dwdate_hier.d_yearmonth = 'Apr1998'
  AND dwdate_hier.level_name = 'DAY'
  AND part_hier.level_name = 'MANUFACTURER'
  AND customer_hier.c_region = 'AMERICA'
  AND customer_hier.c_nation = 'CANADA'
  AND customer_hier.level_name = 'CITY'
  AND supplier_hier.level_name = 'REGION'
ORDER BY
  dwdate_hier.hier_order,
  part_hier.hier_order,
  customer_hier.hier_order,
  supplier_hier.hier_order;
  
SELECT
  dwdate_hier.member_name as year,
  part_hier.member_name as part,
  supplier_hier.member_name as supplier,
  lo_quantity,
  lo_extendedprice,
  lo_ordtotalprice,
  lo_revenue,
  lo_supplycost  
FROM  ssb.ssb_av
  HIERARCHIES (
    dwdate_hier,
    part_hier,
    supplier_hier)
WHERE
  dwdate_hier.level_name = 'YEAR'
  AND part_hier.level_name = 'MANUFACTURER'
  AND supplier_hier.level_name = 'SUPPLIER'
  AND supplier_hier.s_suppkey = '23997';  
  
SELECT
  dwdate_hier.member_name as time,
  part_hier.p_container,
  part_hier.member_name as part,
  lo_quantity,
  lo_extendedprice,
  lo_ordtotalprice,
  lo_revenue,
  lo_supplycost  
FROM  ssb.ssb_av
  HIERARCHIES (
    dwdate_hier,
    part_hier)
WHERE
  dwdate_hier.member_name = 'June 10, 1998     '
  AND dwdate_hier.level_name = 'DAY'
  AND part_hier.level_name = 'PART'
  AND part_hier.p_size = 32;

SELECT
  dwdate_hier.member_name as time,
  part_hier.member_name as part,
  part_hier.p_name,
  part_hier.p_color,
  lo_quantity,
  lo_revenue,
  lo_supplycost,
  lo_revenue - lo_supplycost as profit
FROM  ssb.ssb_av
  HIERARCHIES (
    dwdate_hier,
    part_hier)
WHERE
  dwdate_hier.d_yearmonth = 'Aug1996'
  AND dwdate_hier.d_dayofweek = 'Friday   '
  AND dwdate_hier.level_name = 'DAY'
  AND part_hier.level_name = 'PART'
  AND part_hier.p_color in ('ivory','coral')
ORDER BY
  dwdate_hier.hier_order,
  part_hier.hier_order;