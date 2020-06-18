LOAD DATA
INFILE 'supplier.dat'
INTO TABLE supplier
FIELDS TERMINATED BY ','
(supplier_id,supplier_name,addr,contact TERMINATED BY WHITESPACE)