LOAD DATA
INFILE 'detail.dat'
INTO TABLE detail
FIELDS TERMINATED BY ','
(po_number,product_id,qty_order,qty_rec TERMINATED BY WHITESPACE)