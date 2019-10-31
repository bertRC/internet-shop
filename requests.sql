CREATE TABLE products
(
    id        INTEGER PRIMARY KEY AUTOINCREMENT,
    name      TEXT    NOT NULL,
    quantity  INTEGER NOT NULL CHECK ( quantity >= 0 )       DEFAULT 0,
    available INTEGER NOT NULL CHECK ( available IN (0, 1) ) DEFAULT 1,
    price     INTEGER NOT NULL CHECK ( price >= 0 )
);

INSERT INTO products(name, quantity, price)
VALUES ('Unicorn Writing Set', 50, 120),
       ('A5 Case Bound Dream It Notebook', 70, 160),
       ('A5 Unicorn Plush Notebook', 60, 320),
       ('Basic Stationery Bundle', 100, 400),
       ('Sticky Notes Memo Set', 120, 80),
       ('ArtWorkz Colouring Collection Bundle', 60, 720),
       ('75 Piece Wooden Case Stationery Set', 30, 800),
       ('15 Piece Glitter Stationery Set - Assorted', 60, 560);

CREATE TABLE users
(
    id    INTEGER PRIMARY KEY AUTOINCREMENT,
    login TEXT NOT NULL,
    name  TEXT NOT NULL
);

INSERT INTO users(login, name)
VALUES ('iivanov88', 'Ivan Ivanov'),
       ('ppetrov89', 'Petr Petrov'),
       ('iammax', 'Maksim Maksimov'),
       ('mrbones', 'Konstantin Konstantinov');

CREATE TABLE orders
(
    id      INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id INTEGER REFERENCES users,
    status  TEXT DEFAULT 'NEW'
);

CREATE TABLE sales
(
    id         INTEGER PRIMARY KEY AUTOINCREMENT,
    order_id   INTEGER REFERENCES orders   NOT NULL,
    product_id INTEGER REFERENCES products NOT NULL,
    quantity   INTEGER                     NOT NULL CHECK ( quantity > 0 ),
    price      INTEGER                     NOT NULL CHECK ( price >= 0 )
);

INSERT INTO orders(user_id)
VALUES (1),
       (2),
       (NULL),
       (3),
       (4);

INSERT INTO sales(order_id, product_id, quantity, price)
VALUES (1, 1, 5, 120),
       (1, 6, 1, 720),
       (2, 2, 2, 160),
       (3, 4, 1, 400),
       (3, 7, 1, 800),
       (4, 3, 10, 300),
       (5, 5, 5, 80),
       (5, 8, 1, 560);

UPDATE orders
SET status = 'PAID'
WHERE id = 1;

INSERT INTO orders(id, user_id)
VALUES (6, 1);

INSERT INTO sales(order_id, product_id, quantity, price)
VALUES (6, 3, 4, 320),
       (6, 5, 4, 80);

UPDATE products
SET available = 0,
    quantity  = 0
WHERE id = 7;

SELECT o.id order_id, p.name, s.quantity, s.price, s.quantity * s.price subtotal
FROM orders o,
     products p,
     sales s
WHERE (o.id = s.order_id)
  AND (p.id = s.product_id);

SELECT o.id order_id, p.name, s.quantity, s.price, s.quantity * s.price subtotal
FROM orders o,
     products p,
     sales s
WHERE (o.id = s.order_id)
  AND (p.id = s.product_id)
  AND (o.user_id = 1);

SELECT o.id order_id, sum(s.quantity * s.price) total, o.status
FROM orders o,
     sales s
WHERE (o.id = s.order_id)
  AND (o.user_id = 1)
GROUP BY o.id;

SELECT o.id order_id, p.name, s.quantity, s.price, s.quantity * s.price subtotal
FROM orders o,
     products p,
     sales s
WHERE (o.id = s.order_id)
  AND (p.id = s.product_id)
  AND (o.user_id IS NULL);

SELECT o.id order_id, sum(s.quantity * s.price) total, o.status
FROM orders o,
     sales s
WHERE (o.id = s.order_id)
  AND (o.user_id IS NULL)
GROUP BY o.id;
