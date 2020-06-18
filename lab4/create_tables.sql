-- Incomplete example of table creation for TUT-Lab2 8trd127
-- Paul Girard Ph.D. UQAC

drop view purchase_pds;
drop view part_pds;
drop view part_sks;

drop table contractual;
drop table pot_supplier;
drop table detail;
drop table component;
drop table responsible;
drop table product;
drop table supplier;
drop table pa_agent;
drop table pa_task;
drop table part;
drop table purchase_order;


create table supplier
        (supplier_id    number(4)       primary key,
        supplier_name 	char(15)        not null,
        addr        	char(20)        not null,
        contact         char(15)        not null
);

create table purchase_order
        (po_number     	number(4)       primary key,
        po_date  	char(8)         not null,
        total           number(8,2)     default 0,
        status          char(15)        default 'not_completed'
);

create table part
        (part_id        number(4)       primary key,
        part_name       char(15)        not null,
        unit            char(15)        not null,
        unit_price      number(10)      not null,
        min_qty         number(10)      not null,
        stock_qty       number(10)      not null,
        order_qty       number(10)      default 0
);

create table pa_task
        (emp_num        number(4)       unique,
        po_number       number(4)       not null,
        foreign key (po_number) references purchase_order(po_number),
        CONSTRAINT pk_pa_task primary key (emp_num, po_number)
);

create table pa_agent
        (emp_num        number(4)      	primary key,
        pa_name       	char(15)        not null,
        foreign key (emp_num) references pa_task(emp_num)
);

create table component
        (part_id        number(4)       not null,
        component_id    number(4)       not null,
        foreign key (part_id)           references part(part_id),
        foreign key (component_id)      references part(part_id),
        CONSTRAINT pk_component primary key (part_id, component_id)
);

create table responsible
        (part_id        number(4)       not null,
        emp_num         number(4)       not null,
        foreign key (emp_num) references pa_agent(emp_num),
        foreign key (part_id) references part(part_id),
        CONSTRAINT pk_responsible primary key (part_id, emp_num)
);

create table product
        (supplier_id    number(4)       not null,
        product_id      number(4)       unique,
        product_name    char(15)        not null,
        unit            number(10)      not null,
        unit_price      number(10)      not null,
        foreign key (supplier_id) references supplier(supplier_id),
        CONSTRAINT pk_product primary key (supplier_id, product_id)
);

create table pot_supplier
        (supplier_id    number(4)       not null,
        product_id      number(4)       not null,
        part_id         number(4)       not null,
        foreign key (product_id) references product(product_id),
        foreign key (part_id)    references part(part_id),
        CONSTRAINT pk_pot_supplier primary key (supplier_id, product_id, part_id)
);

create table contractual
        (supplier_id    number(4)       not null,
        po_number       number(4)       not null,
        foreign key (supplier_id) references supplier(supplier_id),
        foreign key (po_number)   references purchase_order(po_number),
        CONSTRAINT pk_contractual primary key (supplier_id, po_number)
);

create table detail
        (po_number      number(4)       not null,
        product_id      number(4)       not null,
        qty_order       number(10)      not null,
        qty_rec         number(10)      not null,
        foreign key (product_id) references product(product_id),
        foreign key (po_number)  references purchase_order(po_number),
        CONSTRAINT pk_detail primary key (po_number, product_id)
);


create or replace view purchase_pds as
	select po_number, total, status from purchase_order;

create or replace view part_pds as
        select part_id, part_name from part;

create or replace view part_sks as
        select part_id, unit_price, stock_qty from part;
