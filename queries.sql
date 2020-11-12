/* list the patient who stays in hospital with their departments and they has an appointment today.*/

select distinct(p.patient_id ),p.patient_fname 
from treatment t 
inner join appointment a on t.treatment_id =a.treatment_id 
inner join assigned a2 on a.patient_id = a2.patient_id 
inner join doctor d on d.doctor_id =a2.doctor_id 
inner join department dep on dep.department_id = d.department_id 
inner join patient p on a2.patient_id = p.patient_id 
where t.treatment_type ='MR' and p.date_exit is null and a.app_date ='21/03/2020';


/* list the doctor information and the surgery count where doctors works at general surgery  */

select count(*),d.doctor_fname ,d.doctor_id ,d.doctor_lname ,d.doctor_title ,d.doctor_job ,d.doctor_gender ,d.doctor_birthdate,t.treatment_name 
from doctor d inner join treatment t on d.doctor_id =t.doctor_id 
inner join appointment a on a.treatment_id =t.treatment_id 
inner join department dep on d.department_id =dep.department_id 
where t.treatment_type = 'Surgery' and dep.department_name ='General Surgery'
group by d.doctor_fname ,d.doctor_id ,d.doctor_lname ,d.doctor_title ,d.doctor_job ,d.doctor_gender ,d.doctor_birthdate ,t.treatment_name



/* The average,total and minimum salaries of doctor grouped by department */

select department_id,avg(doctor_salary),sum(doctor_salary),min(doctor_salary)
from doctor
group by department_id 
order by department_id desc

/* The patients who left the hospital */

select * 
from patient p 
where date_exit is null

/* The patients who has more than 1 appointment */

select count(*), patient 
from patient natural join appointment 
group by patient 
having count(*) >1

/* The doctor salaries between 8001 and 10000 and union of 5000 to 7000 */

select doctor_fname,doctor_salary
from doctor 
where doctor_salary between 8001.00 and 10000.00 union
select doctor_fname,doctor_salary from doctor where doctor_salary between 5000.00 and 7000.00;

/* The rooms of where the room capacities is less than 3 */

select room_capacity,room_id 
from room 
where room_capacity < all ( select room_capacity
                                              from room
                                              where room_capacity = '3');

/* List the every values of doctors information with their treatments  */
select *
from doctor full outer join treatment using(doctor_id)

/* list the patients who stays in room_id 1 */

select *
from patient p
where room_id =(select room_id 
from room 
where room_id =1)

/* List the patient whose first name start with As*/

select patient_fname
from patient 
where patient_fname like 'As%';

/* List the doctors whose first name has 4 letter */

select distinct(doctor_fname)
from doctor
where doctor_fname like '____';



/* List the patients who does not stay in room 7,8 or 9 */
select *
from patient p2 
where room_id not in(select room_id 
from room r2 
where room_id  between 7 and 9)

/* The second lowest salary in between doctors */
select min(doctor_salary)
from doctor 
where doctor_salary >some(select (doctor_salary)
from doctor)


/* List doctor id, title, first name and salary where their salary is more than 9000 */
select doctor_id,doctor_title,doctor_fname, doctor_salary
from (select doctor_id,doctor_title,doctor_fname ,doctor_salary
from doctor) as S
where doctor_salary >=9000

/* List the doctor title ,doctor id and treatment name who is able to do treatment in hospital */
select doctor_title,doctor_id ,treatment_name
from doctor natural join treatment 


/*List the patients and their room and appointment informations  */
select * 
from  patient p inner join room r ON r.room_id = p.room_id 
inner join appointment a on a.patient_id =p.patient_id 

