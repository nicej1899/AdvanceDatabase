-- Example for a better display
set define on
set verify off

accept num number prompt 'Enter the supplier number : '

-- execution of sql request

select supplier_id,supplier_name,addr "Address",contact "Sales Contact"
from supplier where supplier_id=&num;
