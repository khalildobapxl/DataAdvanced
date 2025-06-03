#### Shows all users in the database
```sql
SELECT USERNAME FROM ALL_USERS;
```
#### Shows current database
```sql
SELECT GLOBAL_NAME FROM GLOBAL_NAME;
```
#### Shows all sequences
```sql
SELECT sequence_name, min_value, max_value, increment_by, last_number
FROM user_sequences
ORDER BY sequence_name;
```