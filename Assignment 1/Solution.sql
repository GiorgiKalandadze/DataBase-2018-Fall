--1
select e.first_name,
       e.last_name,
       e.job_id,
       e.salary,
       d.department_name,
       m.city,
       (select max(j.salary) from employees j) max_sal
  from employees e
  join departments d 
    on d.department_id = e.department_id
  join locations m 
    on m.location_id = d.location_id
 where e.salary  > 
    (select max(k.salary) from employees k 
    join departments f 
    on f.department_id = k.department_id
    where f.department_name = 'Human Resources');

--2
select e.first_name,
       e.last_name,
       e.job_id,
       e.department_id,
       d.department_name,
       case when e.salary < 5000 then 'low_sal'
            when e.salary > 5000 and e.salary < 10000 then 'middle_sal'
            else 'high_sal' end "Salary Value"
  from employees e
  join departments d on e.department_id = d.department_id
  where (select avg(e2.salary) from employees e2 where e2.department_id = e.department_id) >
        (select avg(e3.salary) from employees e3)
  order by case when d.department_id = 80  then 1
                when d.department_id = 100 then 3
                else 2 end,
                d.department_id;

--3
select e.first_name,
       e.last_name,
       e.department_id,
       s.counts,
       s.maxs,
       s.mins,
       s.avgs,
       case
            when e.commission_pct is not null then e.first_name || ' ' || e.last_name 
            || ' ' || 'earns a ' || e.commission_pct * 100 || '% ' || 'commission'
            else '--'
       end
  from employees e 
 left join (select m.department_id,
                   count(m.employee_id) counts,
                   max(m.salary) maxs,
                   min(m.salary) mins,
                   avg(m.salary) avgs
              from employees m
             group by m.department_id) s
   on s.department_id = e.department_id
  where length(to_char(e.salary)) = 4 and to_char(e.salary) like '%5%';

--4
 select e.first_name || ' ' || e.last_name,
       e.email user_name,
       case when e.commission_pct is not null or e.commission_pct = 0 then e.commission_pct * 100 || '%'
       else 'without commission' end
  from employees e 
  left join jobs j on e.job_id = j.job_id
  left join job_history h on e.employee_id = h.employee_id
  where months_between(sysdate, hire_date) > 120 and e.salary >= j.min_salary and e.salary <= j.max_salary
    and (e.department_id != h.department_id or e.employee_id not in(select employee_id from job_history)); 
  

--5
select e.first_name,
       e.last_name,
       m2.last_name,
       d.department_name
  from employees e
  join employees m on e.manager_id = m.employee_id
  join employees m2 on m.manager_id = m2.employee_id
  join departments d on m2.department_id = d.department_id
  where m2.last_name in('King', 'Hunold') or (m2.salary > 8000 and d.department_name!= 'Administration');
        