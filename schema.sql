CREATE DATABASE catalog;


CREATE TABLE author(
  id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  first_name VARCHAR(255) NOT NULL,
  last_name VARCHAR(255) NOT NULL
);

CREATE TABLE game(
  INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  multiplayer BOOLEAN NOT NULL,
  last_played_at DATE NOT NULL,
  publish_date DATE NOT NULL,
  archived BOOLEAN NOT NULL,
  author_id INT,
  FOREIGN KEY (author_id) REFERENCES author(ID)
);

CREATE TABLE item(
  id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  publish_date DATE, 
  archived BOOLEAN,
  label_id INT, 
  author_id INT,
  genre_id INT NOT NULL,
  FOREIGN KEY (genre_id) REFERENCES genre(id),
  FOREIGN KEY (author_id) REFERENCES author(id),
  FOREIGN KEY (label_id) REFERENCES label(id)
);
