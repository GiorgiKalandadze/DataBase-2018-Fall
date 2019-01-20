--First Problem
--Create Tables######################################################
create sequence STUDENTS_SEQ;
create table STUDENTS
(
    id NUMBER not null,    
    first_name VARCHAR2(20) not null,
    second_name VARCHAR2(20) not null,
    birth_date DATE not null,
    gpa NUMBER not null,
    gender VARCHAR2(1) not null,
    address VARCHAR2(20) not null,
    grant_percent NUMBER,
    status VARCHAR2(1) default 'A',
    constraint STUDENTS_PK primary key (ID)
);


create sequence LECTURERS_SEQ;
create table LECTURERS
(
    id NUMBER not null,
    first_name VARCHAR2(20) not null,
    second_name VARCHAR2(20) not null,
    gender VARCHAR2(1) not null,
    address VARCHAR2(20) not null,
    salary NUMBER not null,
    constraint LECTURERS_PK primary key (ID)
);


create sequence COURSES_SEQ;
create table COURSES
(  
    id NUMBER not null,
    course_name VARCHAR2(20) not null,
    lector_id NUMBER not null,
    credit NUMBER not null,
    constraint COURSES_PK primary key (ID),
    constraint COURSES_FK1 foreign key (lector_id) references LECTURERS(id)
);


create sequence CHOSEN_COURSES_SEQ;
create table CHOSEN_COURSES
(
    id          NUMBER not null,
    student_id  NUMBER not null,
    course_id  NUMBER not null,
    points  NUMBER,
    status VARCHAR2(1) default 'A',
    constraint CHOSEN_COURSES primary key (ID),
    constraint CHOSEN_COURSES_FK1 foreign key (student_id) references STUDENTS(id),
    constraint CHOSEN_COURSES_FK2 foreign key (course_id) references COURSES(id)
);


--Drop Tables#######################################################################
--drop table CHOSEN_COURSES;
--drop sequence CHOSEN_COURSES_SEQ;
--drop table COURSES;
--drop sequence COURSES_SEQ;
--drop table LECTURERS;
--drop sequence LECTURERS_SEQ;
--drop table STUDENTS;
--drop sequence STUDENTS_SEQ;



--Second Problem
CREATE OR REPLACE PACKAGE package1 AS 
    --1
    PROCEDURE insert_student(first_name  VARCHAR2, second_name VARCHAR2, birth_date date, gpa NUMBER, gender VARCHAR2,
                                address VARCHAR2, grant_percent NUMBER, status VARCHAR2);
    --2
    PROCEDURE insert_lector(first_name  VARCHAR2, second_name VARCHAR2, gender VARCHAR2, address VARCHAR2, salary NUMBER);
    
    --3
    PROCEDURE insert_course(course_name  VARCHAR2, lector_id  NUMBER, credit NUMBER);
    
    --4
    PROCEDURE choose_course(ustudent_id NUMBER, ucourse_id NUMBER, upoints NUMBER, ustatus VARCHAR2);
        
    --5
    PROCEDURE update_point(ustudent_id NUMBER, ucourse_id NUMBER, upoints NUMBER);
    
    FUNCTION get_points(student_id NUMBER, course_id NUMBER) RETURN NUMBER;
        
    FUNCTION get_credits(student_id NUMBER) RETURN NUMBER;
    
END package1; 
/

CREATE OR REPLACE PACKAGE BODY package1 AS 
    --1
    PROCEDURE insert_student(first_name  VARCHAR2, second_name VARCHAR2,  birth_date date, gpa NUMBER, gender VARCHAR2,
                                address VARCHAR2, grant_percent NUMBER, status VARCHAR2) is 
        begin
            insert into STUDENTS VALUES(STUDENTS_SEQ.nextval, first_name, second_name, birth_date, gpa, gender, address, grant_percent, status);
        end insert_student; 
   
    --2
    PROCEDURE insert_lector(first_name  VARCHAR2, second_name VARCHAR2, gender VARCHAR2, address VARCHAR2, salary NUMBER) is
        begin
            insert into LECTURERS VALUES(LECTURERS_SEQ.nextval, first_name, second_name, gender, address, salary);
        end insert_lector;
    
    --3
    PROCEDURE insert_course(course_name  VARCHAR2, lector_id  NUMBER, credit NUMBER) is
        begin
            insert into COURSES VALUES(COURSES_SEQ.nextval, course_name, lector_id, credit);
        end insert_course;
    
    --4
    PROCEDURE choose_course(ustudent_id NUMBER, ucourse_id NUMBER, upoints number, ustatus VARCHAR2) is
        begin
            insert into CHOSEN_COURSES VALUES(CHOSEN_COURSES_SEQ.nextval, ustudent_id , ucourse_id , upoints, ustatus);
        end choose_course;
        
    --5
    PROCEDURE update_point(ustudent_id NUMBER, ucourse_id NUMBER, upoints NUMBER) is
        begin
            update CHOSEN_COURSES set points = upoints
                WHERE(course_id = ucourse_id and student_id = ustudent_id); 
        end update_point;
    
    FUNCTION get_points(student_id NUMBER, course_id NUMBER)
        RETURN NUMBER is
        point NUMBER;
        BEGIN 
            select c.points into point
            From CHOSEN_COURSES c
            Where (c.student_id = student_id and c.course_id = course_id );
            RETURN point; 
        END get_points;
        
    FUNCTION get_credits(student_id NUMBER)
        RETURN NUMBER is
        credit NUMBER;
        BEGIN
            select sum(c.credit) into credit
            from chosen_courses s
            left join courses c
                on s.course_id = c.id
            where s.student_id = student_id and
                s.status = 'A';
            RETURN credit;
        END get_credits;
    
END package1; 
/


 
BEGIN
    package1.INSERT_STUDENT('giorgi', 'kalandadze', '24-sep-1999', 3.18, 'M', 'a.yazbegis29a', 100, 'A'); 
    package1.INSERT_STUDENT('anastasia', 'nikolaishvili', '10-oct-1999', 3.45, 'F', 'arayishvilis25', 100, 'A'); 
    package1.INSERT_STUDENT('demetre', 'uridia', '24-mar-1999', 3.77, 'M', 'farnavazis17', 100, 'A');
    package1.INSERT_STUDENT('ana', 'beradze', '24-mar-1999', 2.14, 'F', 'chavchavadzis15', 75, 'A'); 
    package1.INSERT_STUDENT('demetre', 'pipia', '21-jan-1999', 4.0, 'M', 'pavlovis18', 100, 'A'); 
    package1.INSERT_STUDENT('gega', 'darakhvelidze', '07-aug-1999', 3.25, 'M', 'v.fshavelas2', 100, 'A'); 
    package1.INSERT_STUDENT('aleksandre', 'pertaia', '14-jan-1999', 3.42, 'M', 'nucubidzis85', 100, 'A'); 
    package1.INSERT_STUDENT('devi', 'khositashvili', '04-jun-1999', 3.56, 'M', 'kavtaradzis27', 100, 'A'); 
    package1.INSERT_STUDENT('elene', 'nioradze', '23-dec-1998', 2.88, 'F', 'kartozias3', 50, 'A');
    
    package1.insert_lector('nikoloz', 'machavariani', 'M', 'a.yazbegis24a', 800);
    package1.insert_lector('nikoloz', 'tsimakuridze', 'M', 'griboedovis14', 700);
    package1.insert_lector('zaza', 'sichinava', 'M', 'nafareulis6', 800);
    package1.insert_lector('sopo', 'kiria', 'F', 'politovskaias45', 900);
    package1.insert_lector('zaur', 'meshveliani', 'M', 'l.asatianis36', 600);
    package1.insert_lector('nino', 'kasradze', 'F', 'eristavis7', 750);
    
    package1.insert_course('calculus', 1, 6);
    package1.insert_course('discrete math', 2, 6);
    package1.insert_course('bazebi', 3, 4);
    package1.insert_course('progrmaing', 4, 5);
    

    package1.choose_course(1, 1, 5, 'A'); --student course point
    package1.choose_course(1, 2, 10, 'A');
    package1.choose_course(1, 3, 40, 'A');
    package1.choose_course(1, 4, 20, 'S');
    package1.choose_course(2, 1, 30, 'S');
    package1.choose_course(2, 2, 20, 'A');
    package1.choose_course(2, 3, 20, 'S');
    package1.choose_course(3, 4, 70, 'A');
    package1.choose_course(4, 2, 20, 'S');

    package1.update_point(1, 3, 40);
    package1.update_point(2, 4, 50);
    package1.update_point(3, 2, 80);
    package1.update_point(1, 1, 40);
    
End;
/

--########################################3333333333333333333333333
CREATE OR REPLACE VIEW student_list AS 
    select  s.first_name as FIRST_NAME,
            s.second_name as SECOND_NAME,
            package1.get_credits(s.id) as CREDITS,
                (select sum(c.credit) 
                from chosen_courses s
                left join courses c on s.course_id = c.id
                where s.student_id = student_id and s.status = 'S') as ALL_CREDITS,
                    (select avg(cc.points) from chosen_courses cc where s.id = cc.id) AVERAGE_POINT,
                    'Minimum : ' || (select min(cc.points) from chosen_courses cc  where s.id = cc.student_id 
                        group by s.first_name, s.second_name, package1.get_credits(s.id)) ||
                    '; Maximum : ' || (select max(cc.points) from chosen_courses cc where s.id = cc.id
                        group by s.first_name, s.second_name, package1.get_credits(s.id)) as range 
                from students s
            where s.status = 'A';
        

  
  
select *
 from student_list;
 
