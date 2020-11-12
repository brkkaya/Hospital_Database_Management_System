create table department(
department_id int not null primary key,
department_name varchar(20) not null);

create table doctor(
doctor_id int primary key,
doctor_fname varchar(20) not null,
doctor_mname varchar(20),
doctor_lname varchar(20) not null,
doctor_gender varchar(6) not null,
doctor_email varchar(40) not null,
doctor_birthdate varchar(10) not null,
doctor_address varchar(255) not null,
doctor_title varchar(20) not null,
doctor_job varchar(20) not null,
department_id int not null,
foreign key(department_id) references department (department_id) on delete cascade on update cascade);

alter table doctor
add column doctor_salary int not null;

create table doctor_phones(
doctor_id int not null,
phone varchar(15) not null primary key,
foreign key (doctor_id) references doctor(doctor_id) on delete cascade on update cascade);


create table room(
room_id int not null primary key,
room_capacity int not null,
room_type varchar(50) not null);




create table patient(
patient_id int primary key,
patient_fname varchar(20),
patient_mname varchar(20),
patient_lname varchar(20),
patient_gender varchar(6),
patient_birth_date varchar(20),
patient_address varchar(255),
patient_phone varchar(15),
room_id int not null,
date_entered varchar(20) not null,
date_exit varchar(20));

alter table patient 
add constraint room_fkey foreign key(room_id) references room;



create table assigned(
patient_id int not null,
doctor_id int not null,
unique(patient_id,doctor_id),
foreign key(patient_id) references patient (patient_id) on delete cascade on update cascade,
foreign key(doctor_id) references doctor on delete cascade on update cascade);



create table treatment(
treatment_id int not null primary key,
treatment_name varchar(50) not null,
treatment_type varchar(50) not null,
doctor_id int not null,
foreign key(doctor_id) references doctor);




create table appointment( 
app_date varchar(15) not null, 
treatment_id int not null,
patient_id int not null,
unique(app_date,patient_id),
unique(app_date,treatment_id),
foreign key(patient_id) references patient(patient_id) on delete cascade on update cascade,
foreign key(treatment_id) references treatment(treatment_id) on delete cascade on update cascade);

create view patient_info as 
select patient_id, patient_fname,patient_gender,room_id ,date_entered 
from patient



