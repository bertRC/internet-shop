CREATE TABLE products
(
    id        INTEGER PRIMARY KEY AUTOINCREMENT,
    name      TEXT    NOT NULL,
    quantity  INTEGER NOT NULL CHECK ( quantity >= 0 )       DEFAULT 0,
    available INTEGER NOT NULL CHECK ( available IN (0, 1) ) DEFAULT 1,
    price     INTEGER NOT NULL CHECK ( price >= 0 )
);

INSERT INTO products(name, quantity, price)
VALUES ('Nukeproof Mega 275 Carbon Pro Bike GX Eagle 2019', 5, 204000),
       ('Vitus Sommet Mountain Bike (NX - 1x11) 2019', 7, 99000),
       ('Marin Wolf Ridge 8 Full Suspension Bike 2019', 6, 177000),
       ('Cube Reaction TM Pro 27.5 Mountain Bike 2019', 10, 59400),
       ('Marin Pine Mountain 27.5 Hardtail Bike 2019', 12, 37500),
       ('Nukeproof Mega 275 Alloy Pro Bike GX Eagle 2019', 6, 170000),
       ('Nukeproof Mega 275 Carbon RS Bike XO1 Eagle 2019', 3, 255000),
       ('Vitus Sommet CRS Mountain Bike (GX Eagle) 2019', 6, 160000);

