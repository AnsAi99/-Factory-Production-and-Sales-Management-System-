create table factories (
   factoryid   number generated always as identity primary key,
   factoryname varchar2(100) not null,
   location    varchar2(150) not null,
   phone       varchar2(20) unique
);

create table suppliers (
   supplierid   number generated always as identity primary key,
   suppliername varchar2(100) not null,
   contactphone varchar2(20) unique,
   city         varchar2(50)
);

create table products (
   productid   number generated always as identity primary key,
   productname varchar2(100) not null,
   unitprice   number(10,2) check ( unitprice >= 0 ),
   category    varchar2(50)
);

-- 2. الجداول التابعة والمرتبطة (Child Tables)
create table departments (
   departmentid   number generated always as identity primary key,
   departmentname varchar2(100) not null,
   budget         number(12,2) check ( budget >= 0 ),
   factoryid      number not null,
   constraint fk_dept_factory foreign key ( factoryid )
      references factories ( factoryid )
);

create table employees (
   employeeid   number generated always as identity primary key,
   fullname     varchar2(100) not null,
   salary       number(10,2) check ( salary > 0 ),
   departmentid number not null,
   constraint fk_emp_dept foreign key ( departmentid )
      references departments ( departmentid )
);

create table rawmaterials (
   materialid    number generated always as identity primary key,
   materialname  varchar2(100) not null,
   stockquantity number default 0 check ( stockquantity >= 0 ),
   supplierid    number not null,
   constraint fk_mat_supplier foreign key ( supplierid )
      references suppliers ( supplierid )
);

create table productionorders (
   orderid          number generated always as identity primary key,
   quantityproduced number check ( quantityproduced > 0 ),
   productiondate   date default sysdate,
   productid        number not null,
   supervisorid     number not null,
   constraint fk_order_prod foreign key ( productid )
      references products ( productid ),
   constraint fk_order_emp foreign key ( supervisorid )
      references employees ( employeeid )
);
create table bill_of_materials (
   bom_id           number generated always as identity primary key,
   productid        number not null,
   materialid       number not null,
   quantityrequired number not null,
   constraint fk_bom_product foreign key ( productid )
      references products ( productid ),
   constraint fk_bom_material foreign key ( materialid )
      references rawmaterials ( materialid )
);
create table customers (
   customerid     number generated always as identity primary key,
   customername   varchar(50) not null,
   customerphone  varchar(20) unique,
   customeradress varchar(100)
)
create table invoices (
   invoicenum   number generated always as identity primary key,
   customerid   number not null,
   productid    number not null,
   quantitysold number check ( quantitysold > 0 ),
   orderdate    date default sysdate,
   constraint fk_invo_cust foreign key ( customerid )
      references customers ( customerid ),
   constraint fk_invo_products foreign key ( productid )
      references products ( productid )
)-- 3. إدخال البيا نات التجريبية
insert into factories (
   factoryname,
   location,
   phone
) values
   ( 'مصنع الرياض',
     'الرياض',
     '0110000000' );
insert into suppliers (
   suppliername,
   contactphone,
   city
) values
   ( 'مورد الصلب',
     '0500000000',
     'جدة' );
insert into products (
   productname,
   unitprice,
   category
) values
   ( 'منتج أ',
     150.00,
     'حديد' );

insert into departments (
   departmentname,
   budget,
   factoryid
) values
   ( 'الإشراف والإنتاج',
     50000.00,
     1 );
insert into employees (
   fullname,
   salary,
   departmentid
) values
   ( 'أحمد علي',
     5500.00,
     1 );

insert into rawmaterials (
   materialname,
   stockquantity,
   supplierid
) values
   ( 'حديد خام',
     200,
     1 );
insert into productionorders (
   quantityproduced,
   productid,
   supervisorid
) values
   ( 50,
     1,
     1 );
insert into bill_of_materials (
   materialid,
   quantityrequired,
   productid
) values
   ( 1,
     5,
     1 );
insert into customers (
   customername,
   customerphone,
   customeradress
) values
   ( 'علي ',
     784545454,
     'الحصبة جوار مطعم العيدروس' );
insert into invoices (
   customerid,
   productid,
   quantitysold
) values
   ( 1,
     1,
     198 );
commit;

-- 4. عرض البيانات للتأكد
select *
  from factories;
select *
  from suppliers;
select *
  from products;
select *
  from departments;
select *
  from employees;
select *
  from rawmaterials;
select *
  from productionorders;
select i.invoicenum,
       c.customername,
       i.quantitysold
  from invoices i
  join customers c
on i.customerid = c.customerid;