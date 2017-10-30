// My Sql important functions
-------------------------------------------
String Functions:
------------------------------------------
substr(str,position)
instr(str,substr)
replace(ename,'MI','99')              # search for a string and replaces the provided string.
position('hi' in 'howhihello')         # Returns the index position from the string.
LOCATE("hi", "howhihello")              # Returns the index position from the string.

concat(str1,str2)                     #  concat two strings
reverse(string)                      
INSERT("W3Schools.com", 11, 3, "no")   # Insert the sub string at specified position.
space(5)                               # Returns 5 spaces as output.
upper()
lower()
trim()
ltrim()
rtrim()
lpad('hello',10,'$')
rpad('hello',10,'$')

-------------------------------------------
Date Functions:
-------------------------------------------
adddate(date,interval 5 year)   # year/month/week/day/hour
extract(unit from date)           # unit= year/month/day/ or (year(date)/month(date)/day(date))
str_to_date('string',format)        # format= %YY=1987; %yy=87;%m=1-12;%M=Full Month;%d=1-31;%D=1st,2nd ..

-------------------------------------------
Adv Functions:
-------------------------------------------
case Stmt: 
COALESCE(NULL, NULL, 'HELLO', NULL, 'HI'); # This will pick the first not null value from the list.
cast  # Used for data type conversion.

---------------------------------------
Math Functions:
---------------------------------------
truncate(value,decimal_place)

#######################################################################################
select * from emp10 order by sal desc limit 2,1; # Limit first arg is offset and second arg no of rows from  offset.
limit 2,1 # It will display 3rd rec
limit 4,5 # It will keep 4 rec in offset and it will dispaly next 5 records. This will work like rownum;

check for rank and dense rank


select *from emp where sal=select sal from(select rownum,sal from emp order by sal desc) where rownum=6;

select * from emp where rowid in(select decode(mod(rownum,2)==0),rowid,Null)

Nth highest salary.
SELECT Salary
FROM EmployeeSalary Emp1
WHERE N-1 = (
                SELECT COUNT( DISTINCT ( Emp2.Salary ) )
                FROM EmployeeSalary Emp2
                WHERE Emp2.Salary >= Emp1.Salary
            )