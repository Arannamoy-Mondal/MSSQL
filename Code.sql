create database hello;

use hello;

-- DDL
create table student(  -- for create table
  id int identity(1,1),
  name varchar(255),
  account_balance decimal(35,2)
);

alter table student alter column name varchar(200); -- change data type 
alter table student add last_name varchar(255); -- add new column
alter table student add hello char(2);
alter table student drop column hello; -- drop column
exec sp_rename 'student.name','first_name','column'; -- rename column name
exec sp_rename student1,student; -- rename table name
drop table student; -- drop table
truncate table student; -- truncate table

-- DML
insert into student (first_name,last_name,account_balance) values ('Hello','World',100),('Hello','World',100),('Hello','World',100); -- insert

update student set first_name='x' where id=1; -- update

delete from student where id=1; -- delete

begin transaction -- transaction
	update student set account_balance=account_balance+50 where id=2;
	update student set account_balance=account_balance-50 where id=30;
rollback;


begin try
	begin transaction;
	update student set account_balance=account_balance+50 where id=2;
	update student set account_balance=account_balance-50 where id=30;
	commit;
end try
begin catch
	rollback;
	print 'Ok';
end catch;
	

select * from student;


-- function

select 'hello '+'world';
select * from student where first_name like '__l%';
select * from student where first_name like '%_o';
