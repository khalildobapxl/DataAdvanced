FROM wnameless/oracle-xe-11g-r2

COPY ./DATA_SQL/gebruiker_student.sql /docker-entrypoint-initdb.d/student.sql