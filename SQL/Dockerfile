FROM wnameless/oracle-xe-11g-r2

COPY ./DATA_SQL/gebruiker_student.sql /docker-entrypoint-initdb.d/01-student.sql
COPY ./DATA_SQL/cretab.sql /docker-entrypoint-initdb.d/02-cretab.sql
