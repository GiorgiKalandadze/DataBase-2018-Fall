--#################################
create sequence SALES_SEQ;
create table SALES
(
    id NUMBER,
    item_name VARCHAR2(50),
    unit_id NUMBER,
    quantity NUMBER,
    price NUMBER,
    sell_time DATE default sysdate,
    seller_id NUMBER,
    client_id NUMBER 
);
alter table SALES
  add constraint SALES_PK primary key (ID);
alter table SALES
  add constraint SALES_FK1 foreign key (unit_id)
  references UNIT_TYPES (ID);
alter table SALES
  add constraint SALES_FK2 foreign key (client_id)
  references CLIENT (ID);
alter table SALES
  add constraint SALES_FK3 foreign key (seller_id)
  references SELLER (ID);


--#################################
create sequence CLIENT_SEQ;
create table CLIENT
(
    id NUMBER,
    client_first_name VARCHAR2(50),
    client_last_name VARCHAR2(50),
    client_id VARCHAR2(50)
);

alter table CLIENT
  add constraint CLIENT_PK primary key (ID);


--#################################
create sequence SELLER_SEQ;
create table SELLER
(
    id NUMBER,
    seller_first_name VARCHAR2(50),
    seller_last_name VARCHAR2(50),
    seller_id NUMBER
);
alter table SELLER
  add constraint SELLER_PK primary key (ID);

--#################################
create sequence CLIENT_CONTACT_TYPES_SEQ;
create table CLIENT_CONTACT_TYPES
(
    id NUMBER,
    contact_type_code VARCHAR2(50) not null
);

alter table CLIENT_CONTACT_TYPES
  add constraint CLIENT_CONTACT_TYPES_PK primary key (ID);

--#################################
create sequence CLIENT_CONTACTS_SEQ;
create table CLIENT_CONTACTS
(
    id NUMBER,
    client_id NUMBER,
    contact_type_id NUMBER,
    contact_info VARCHAR2(50)
);
alter table CLIENT_CONTACTS
  add constraint CLIENT_CONTACTS_PK primary key (ID);
alter table CLIENT_CONTACTS
  add constraint CLIENT_CONTACTS_FK1 foreign key (client_id)
  references CLIENT (ID);
alter table CLIENT_CONTACTS
  add constraint CLIENT_CONTACTS_FK2 foreign key (contact_type_id)
  references CLIENT_CONTACT_TYPES (ID);

--#################################
create sequence UNIT_TYPES_SEQ;
create table UNIT_TYPES
(
    id NUMBER,
    unit_type VARCHAR2(50) not null
);
alter table UNIT_TYPES
  add constraint UNIT_TYPES primary key (ID);



--INSERT PART ######################################### 3333333333333
--15 CLIENT
INSERT INTO CLIENT VALUES (CLIENT_SEQ.nextval, 'Giorgi1', 'Kalandadze1', '000000001');
INSERT INTO CLIENT VALUES (CLIENT_SEQ.nextval, 'Giorgi2', 'Kalandadze2', '000000002');
INSERT INTO CLIENT VALUES (CLIENT_SEQ.nextval, 'Giorgi3', 'Kalandadze3', '000000003');
INSERT INTO CLIENT VALUES (CLIENT_SEQ.nextval, 'Giorgi4', 'Kalandadze4', '000000004');
INSERT INTO CLIENT VALUES (CLIENT_SEQ.nextval, 'Giorgi5', 'Kalandadze5', '000000005');
INSERT INTO CLIENT VALUES (CLIENT_SEQ.nextval, 'Giorgi6', 'Kalandadze6', '000000006');
INSERT INTO CLIENT VALUES (CLIENT_SEQ.nextval, 'Giorgi7', 'Kalandadze7', '000000007');
INSERT INTO CLIENT VALUES (CLIENT_SEQ.nextval, 'Giorgi8', 'Kalandadze8', '000000008');
INSERT INTO CLIENT VALUES (CLIENT_SEQ.nextval, 'Giorgi9', 'Kalandadze9', '000000009');
INSERT INTO CLIENT VALUES (CLIENT_SEQ.nextval, 'Giorgi10', 'Kalandadze10', '000000010');
INSERT INTO CLIENT VALUES (CLIENT_SEQ.nextval, 'Giorgi11', 'Kalandadze11', '000000011');
INSERT INTO CLIENT VALUES (CLIENT_SEQ.nextval, 'Giorgi12', 'Kalandadze12', '000000012');
INSERT INTO CLIENT VALUES (CLIENT_SEQ.nextval, 'Giorgi13', 'Kalandadze13', '000000013');
INSERT INTO CLIENT VALUES (CLIENT_SEQ.nextval, 'Giorgi14', 'Kalandadze14', '000000014');
INSERT INTO CLIENT VALUES (CLIENT_SEQ.nextval, 'Giorgi15', 'Kalandadze15', '000000015');

--5 SELLER
INSERT INTO SELLER VALUES (SELLER_SEQ.nextval, 'James1', 'Bond1', '10000000000');
INSERT INTO SELLER VALUES (SELLER_SEQ.nextval, 'James2', 'Bond2', '20000000000');
INSERT INTO SELLER VALUES (SELLER_SEQ.nextval, 'James3', 'Bond3', '30000000000');
INSERT INTO SELLER VALUES (SELLER_SEQ.nextval, 'James4', 'Bond4', '40000000000');
INSERT INTO SELLER VALUES (SELLER_SEQ.nextval, 'James5', 'Bond5', '50000000000');



 --UNIT INFO
INSERT INTO UNIT_TYPES VALUES (UNIT_TYPES_SEQ.nextval, 'Kilogram');
INSERT INTO UNIT_TYPES VALUES (UNIT_TYPES_SEQ.nextval, 'Gram');
INSERT INTO UNIT_TYPES VALUES (UNIT_TYPES_SEQ.nextval, 'Litre');
INSERT INTO UNIT_TYPES VALUES (UNIT_TYPES_SEQ.nextval, 'Piece');
INSERT INTO UNIT_TYPES VALUES (UNIT_TYPES_SEQ.nextval, 'Box');
  
--SALES INFO
INSERT INTO SALES VALUES (SALES_SEQ.nextval, 'item1', 1, 1, 1, '1-JAN-18', 1, 1);
INSERT INTO SALES VALUES (SALES_SEQ.nextval, 'item2', 1, 1, 1, '2-JAN-18', 1, 1);
INSERT INTO SALES VALUES (SALES_SEQ.nextval, 'item3', 1, 1, 2, '3-JAN-18', 1, 1);
INSERT INTO SALES VALUES (SALES_SEQ.nextval, 'item4', 1, 2, 5, '4-JAN-18', 1, 2);
INSERT INTO SALES VALUES (SALES_SEQ.nextval, 'item5', 2, 2, 10, '17-FAB-18', 2, 3);
INSERT INTO SALES VALUES (SALES_SEQ.nextval, 'item6', 2, 5, 15, '22-FAB-18', 2, 4);
INSERT INTO SALES VALUES (SALES_SEQ.nextval, 'item7', 2, 5, 20,'10-FAB-18', 2, 5);
INSERT INTO SALES VALUES (SALES_SEQ.nextval, 'item8', 2, 5, 20, '1-FAB-18', 2, 6);
INSERT INTO SALES VALUES (SALES_SEQ.nextval, 'item9', 3, 5, 30, '21-MAR-18', 3, 7);
INSERT INTO SALES VALUES (SALES_SEQ.nextval, 'item10', 3, 10, 30, '11-APR-18', 3, 8);
INSERT INTO SALES VALUES (SALES_SEQ.nextval, 'item11', 3, 10, 40, '7-APR-18', 3, 9);
INSERT INTO SALES VALUES (SALES_SEQ.nextval, 'item12', 3, 20, 50, '23-APR-18', 3, 10);
INSERT INTO SALES VALUES (SALES_SEQ.nextval, 'item13', 4, 20, 99, '1-APR-18', 4, 11);
INSERT INTO SALES VALUES (SALES_SEQ.nextval, 'item14', 4, 20, 100, '4-MAY-18', 4, 12);
INSERT INTO SALES VALUES (SALES_SEQ.nextval, 'item15', 4, 40, 100, '5-MAY-18', 4, 13);
INSERT INTO SALES VALUES (SALES_SEQ.nextval, 'item16', 4, 45, 200, '24-SEP-18', 4, 13);
INSERT INTO SALES VALUES (SALES_SEQ.nextval, 'item17', 5, 77, 200, '8-SEP-18', 5, 14);
INSERT INTO SALES VALUES (SALES_SEQ.nextval, 'item18', 5, 100, 500, '6-DEC-18', 5, 14);
INSERT INTO SALES VALUES (SALES_SEQ.nextval, 'item19', 5, 130, 500, '24-DEC-18', 5, 15);
INSERT INTO SALES VALUES (SALES_SEQ.nextval, 'item20', 5, 200, 1000, '26-DEC-18', 5, 15);



INSERT INTO CLIENT_CONTACT_TYPES VALUES(CLIENT_CONTACT_TYPES_SEQ.nextval, 'email');
INSERT INTO CLIENT_CONTACT_TYPES VALUES(CLIENT_CONTACT_TYPES_SEQ.nextval, 'phone');
--CONTACT INFO
INSERT INTO CLIENT_CONTACTS VALUES (CLIENT_CONTACTS_SEQ.nextval, 1, 1, '1@mail.com');
INSERT INTO CLIENT_CONTACTS VALUES (CLIENT_CONTACTS_SEQ.nextval, 2, 1, '2@mail.com');
INSERT INTO CLIENT_CONTACTS VALUES (CLIENT_CONTACTS_SEQ.nextval, 3, 1, '3@mail.com');
INSERT INTO CLIENT_CONTACTS VALUES (CLIENT_CONTACTS_SEQ.nextval, 4, 1, '4@mail.com');
INSERT INTO CLIENT_CONTACTS VALUES (CLIENT_CONTACTS_SEQ.nextval, 5, 1, '5@mail.com');
INSERT INTO CLIENT_CONTACTS VALUES (CLIENT_CONTACTS_SEQ.nextval, 6, 1, '6@mail.com');
INSERT INTO CLIENT_CONTACTS VALUES (CLIENT_CONTACTS_SEQ.nextval, 7, 1, '7@mail.com');
INSERT INTO CLIENT_CONTACTS VALUES (CLIENT_CONTACTS_SEQ.nextval, 8, 1, '8@mail.com');
INSERT INTO CLIENT_CONTACTS VALUES (CLIENT_CONTACTS_SEQ.nextval, 9, 1, '9@mail.com');
INSERT INTO CLIENT_CONTACTS VALUES (CLIENT_CONTACTS_SEQ.nextval, 10, 1, '10@mail.com');
INSERT INTO CLIENT_CONTACTS VALUES (CLIENT_CONTACTS_SEQ.nextval, 11, 1, '11@mail.com');
INSERT INTO CLIENT_CONTACTS VALUES (CLIENT_CONTACTS_SEQ.nextval, 12, 1, '12@mail.com');
INSERT INTO CLIENT_CONTACTS VALUES (CLIENT_CONTACTS_SEQ.nextval, 13, 1, '13@mail.com');
INSERT INTO CLIENT_CONTACTS VALUES (CLIENT_CONTACTS_SEQ.nextval, 14, 1, '14@mail.com');
INSERT INTO CLIENT_CONTACTS VALUES (CLIENT_CONTACTS_SEQ.nextval, 15, 1, '15@mail.com');

INSERT INTO CLIENT_CONTACTS VALUES (CLIENT_CONTACTS_SEQ.nextval, 1, 2, '100000001');
INSERT INTO CLIENT_CONTACTS VALUES (CLIENT_CONTACTS_SEQ.nextval, 2, 2, '100000002');
INSERT INTO CLIENT_CONTACTS VALUES (CLIENT_CONTACTS_SEQ.nextval, 3, 2, '100000003');
INSERT INTO CLIENT_CONTACTS VALUES (CLIENT_CONTACTS_SEQ.nextval, 4, 2, '100000004');
INSERT INTO CLIENT_CONTACTS VALUES (CLIENT_CONTACTS_SEQ.nextval, 5, 2, '100000005');
INSERT INTO CLIENT_CONTACTS VALUES (CLIENT_CONTACTS_SEQ.nextval, 6, 2, '100000006');
INSERT INTO CLIENT_CONTACTS VALUES (CLIENT_CONTACTS_SEQ.nextval, 7, 2, '100000007');
INSERT INTO CLIENT_CONTACTS VALUES (CLIENT_CONTACTS_SEQ.nextval, 8, 2, '100000008');
INSERT INTO CLIENT_CONTACTS VALUES (CLIENT_CONTACTS_SEQ.nextval, 9, 2, '100000009');
INSERT INTO CLIENT_CONTACTS VALUES (CLIENT_CONTACTS_SEQ.nextval, 10, 2, '100000010');
INSERT INTO CLIENT_CONTACTS VALUES (CLIENT_CONTACTS_SEQ.nextval, 11, 2, '100000011');
INSERT INTO CLIENT_CONTACTS VALUES (CLIENT_CONTACTS_SEQ.nextval, 12, 2, '100000012');
INSERT INTO CLIENT_CONTACTS VALUES (CLIENT_CONTACTS_SEQ.nextval, 13, 2, '100000013');
INSERT INTO CLIENT_CONTACTS VALUES (CLIENT_CONTACTS_SEQ.nextval, 14, 2, '100000014');
INSERT INTO CLIENT_CONTACTS VALUES (CLIENT_CONTACTS_SEQ.nextval, 15, 2, '100000015');
  

  
--VIEW PART ######################################### 44444444444
create view SALE_V as 
(
select 
    c.CLIENT_FIRST_NAME,
    c.CLIENT_LAST_NAME,
    s.ITEM_NAME,
    u.UNIT_TYPE,
    s.QUANTITY,
    s.PRICE,
    s.PRICE * s.QUANTITY TOTAL_PRICE,
    s.SELL_TIME,
    sel.SELLER_FIRST_NAME,
    sel.SELLER_LAST_NAME
    from SALES s
join SELLER sel on s.seller_id = sel.id
join CLIENT c on s.client_id = c.id
join UNIT_TYPES u on s.unit_id = u.id
);

--55 ######################################### 55555555555555555
select  trunc(s.SELL_TIME),
        sum(s.PRICE * s.QUANTITY),
        avg(s.PRICE * s.QUANTITY),
        count(s.id),
        count(distinct s.CLIENT_ID)
    from SALES s
group by trunc(s.SELL_TIME);


