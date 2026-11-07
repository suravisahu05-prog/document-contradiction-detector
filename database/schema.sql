-- Table 1: every time a file is scanned
CREATE TABLE IF NOT EXISTS scans (
    id          INTEGER PRIMARY KEY AUTOINCREMENT,
    file_name   TEXT NOT NULL,
    file_type   TEXT,
    scanned_at  DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Table 2: every contradiction the engine finds
CREATE TABLE IF NOT EXISTS contradictions (
    id           INTEGER PRIMARY KEY AUTOINCREMENT,
    scan_id      INTEGER,
    topic        TEXT NOT NULL,
    source_a     TEXT NOT NULL,
    source_b     TEXT NOT NULL,
    value_a      TEXT,
    value_b      TEXT,
    severity     TEXT DEFAULT 'Minor',
    confidence   REAL,
    status       TEXT DEFAULT 'Open',
    created_at   DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (scan_id) REFERENCES scans(id)
);

-- Table 3: who did what (Mark Resolved / Ignore)
CREATE TABLE IF NOT EXISTS audit_log (
    id               INTEGER PRIMARY KEY AUTOINCREMENT,
    contradiction_id INTEGER,
    action           TEXT NOT NULL,
    action_by        TEXT,
    action_at        DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (contradiction_id) REFERENCES contradictions(id)
);
