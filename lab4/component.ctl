LOAD DATA
INFILE 'component.dat'
INTO TABLE component
FIELDS TERMINATED BY ','
(part_id,component_id TERMINATED BY WHITESPACE)