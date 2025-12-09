sqlite3 messageboard.db < schema.sql
sqlite3 messageboard.db < insertar.sql
# sqlite3 messageboard.db < update-delete.sql
sqlite3 messageboard.db "SELECT * FROM users"