LOAD DATA
INFILE 'responsible.dat'
INTO TABLE responsible
FIELDS TERMINATED BY ','
(part_id,emp_num TERMINATED BY WHITESPACE)