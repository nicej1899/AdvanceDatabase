LOAD DATA
INFILE 'part.dat'
INTO TABLE part
FIELDS TERMINATED BY ','
(part_id,part_name,unit,unit_price,min_qty,stock_qty,order_qty TERMINATED BY WHITESPACE)