CREATE TABLE products
(
    id        INTEGER PRIMARY KEY AUTOINCREMENT,
    name      TEXT    NOT NULL,
    quantity  INTEGER NOT NULL CHECK ( quantity >= 0 )       DEFAULT 0,
    available INTEGER NOT NULL CHECK ( available IN (0, 1) ) DEFAULT 1,
    price     INTEGER NOT NULL CHECK ( price >= 0 )
);

