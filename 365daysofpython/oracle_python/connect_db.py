import cx_Oracle

connection = cx_Oracle.connect(
    user="hr",
    password="welcome",
    dsn="localhost/xepdb1"
)

cursor = connection.cursor()
cursor.execute("""
SELECT first_name, last_name
FROM employees WHERE
department_id = :did AND employee_id > :eid
""",
did = 50,
eid = 190)

for fname, lname in cursor:
    print("Values", fname, lname)