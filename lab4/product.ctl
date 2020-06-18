LOAD DATA
INFILE 'product.dat'
INTO TABLE product
FIELDS TERMINATED BY ','
(supplier_id,product_id,product_name,unit,unit_price TERMINATED BY WHITESPACE)