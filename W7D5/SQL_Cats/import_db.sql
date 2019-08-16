DROP TABLE cat_toys, cats, toys;

CREATE TABLE cats
(
  id SERIAL PRIMARY KEY,
  name VARCHAR(100),
  color VARCHAR (255),
  breed VARCHAR (255)
);

CREATE TABLE toys
(
  id SERIAL PRIMARY KEY,
  name VARCHAR(100),
  color VARCHAR (255),
  price INTEGER
);

CREATE TABLE cat_toys
(
  id SERIAL PRIMARY KEY,
  cat_id INTEGER NOT NULL, 
  toy_id INTEGER NOT NULL,
  FOREIGN KEY (cat_id) REFERENCES cats(id),
  FOREIGN KEY (toy_id) REFERENCES toys(id)
);

INSERT INTO
  cats (name, color, breed)
VALUES
  ('Gilbert', 'Brown', 'Bengal'),
  ('Bob', 'Orange', 'Tiger'),
  ('Jill', 'White', 'Lion'),
  ('George', 'Blue', 'Leopard'),
  ('Bruce', 'Black', 'Panther');

INSERT INTO
  toys (name, color, price)
VALUES
  ('Ball', 'Brown', 2),
  ('Yarn', 'Black', 5),
  ('Mouse', 'Black', 10),
  ('Stuffed Animal', 'Blue', 8),
  ('Bird', 'Yellow', 15);

INSERT INTO
cat_toys (cat_id, toy_id)
VALUES
  (2, 4),
  (3, 5),
  (5, 2),
  (1, 3),
  (2, 2);
  