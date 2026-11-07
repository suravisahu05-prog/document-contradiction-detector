import sqlite3

conn = sqlite3.connect("contradictions.db")

with open("schema.sql") as f:
    conn.executescript(f.read())

with open("sample_data.sql") as f:
    conn.executescript(f.read())

for row in conn.execute("SELECT id, topic, severity, confidence, status FROM contradictions"):
    print(row)

conn.close()