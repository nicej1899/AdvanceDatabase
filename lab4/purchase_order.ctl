LOAD DATA
INFILE 'purchase_order.dat'
INTO TABLE purchase_order
FIELDS TERMINATED BY ','
(po_number,po_date,total,status TERMINATED BY WHITESPACE)