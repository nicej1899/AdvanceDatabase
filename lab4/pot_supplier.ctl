LOAD DATA
INFILE 'pot_supplier.dat'
INTO TABLE pot_supplier
FIELDS TERMINATED BY ','
(supplier_id,product_id,part_id TERMINATED BY WHITESPACE)