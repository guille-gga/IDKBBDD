import sqlite3

conn = sqlite3.connect('messageboard.db')
cursor = conn.cursor()

name = input("Usuario: ")
password = input("Password: ")
email = input("Email: ")
age = input("Edad: ")

cursor.execute("INSERT INTO users (name, password, email, age) VALUES (?, ?, ?, ?)", (name, password, email, age))
conn.commit()
conn.close()
print("Usuario creado exitosamente.")