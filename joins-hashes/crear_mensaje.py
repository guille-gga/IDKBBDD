import sqlite3

conn = sqlite3.connect('messageboard.db')
cursor = conn.cursor()

name = input("Usuario: ")
password = input("Contraseña: ")
password2 = cursor.execute("SELECT password FROM users WHERE name = ?",[name])
print(password, password2.fetchone()[0])

mensaje = input("Mensaje: ")