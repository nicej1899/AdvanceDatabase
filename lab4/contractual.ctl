LOAD DATA
INFILE 'contractual.dat'
INTO TABLE contractual
FIELDS TERMINATED BY ','
(supplier_id,po_number TERMINATED BY WHITESPACE)