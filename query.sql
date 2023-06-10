DROP TABLE "User";
-- One-to-one
-- Membuat tabel "User"
CREATE TABLE "User" (
  user_id SERIAL PRIMARY KEY,
  username VARCHAR(50) NOT NULL,
  email VARCHAR(100) NOT NULL
);
-- Membuat tabel "Profile" dengan foreign key "user_id"
CREATE TABLE "Profile" (
  profile_id SERIAL PRIMARY KEY,
  user_id INTEGER,
  full_name VARCHAR(100) NOT NULL,
  address VARCHAR(200) NOT NULL,
  FOREIGN KEY(user_id) REFERENCES "User"(user_id)
);
-- One-to-many
-- Membuat tabel "Country"
CREATE TABLE "Country" (
  country_id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  population INTEGER,
  capital VARCHAR(100)
);
-- Membuat tabel "City" dengan foreign key "country_id"
CREATE TABLE "City" (
  city_id SERIAL PRIMARY KEY,
  country_id INTEGER,
  name VARCHAR(100) NOT NULL,
  population INTEGER,
  FOREIGN KEY(country_id) REFERENCES "Country"(country_id)
);
-- Membuat tabel "Actor"
CREATE TABLE "Actor" (
  actor_id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL
);
-- Membuat tabel "Movie"
CREATE TABLE "Movie" (
  movie_id SERIAL PRIMARY KEY,
  title VARCHAR(200) NOT NULL,
  release_year INTEGER
);
-- Membuat tabel "Actor_Movie" untuk hubungan many-to-many
CREATE TABLE "Actor_Movie" (
  actor_id INTEGER,
  movie_id INTEGER,
  PRIMARY KEY (actor_id, movie_id),
  FOREIGN KEY (actor_id) REFERENCES "Actor" (actor_id),
  FOREIGN KEY (movie_id) REFERENCES "Movie" (movie_id)
);
-- Insert data pada tabel "User"
INSERT INTO
  "User" (username, email)
VALUES
  ('aji.prio', 'aji.prio@example.com'),
  ('budi.hartono', 'budi.har@example.com'),
  ('elon.musk', 'elon.musk@example.com');
-- Insert data pada tabel "Profile"
INSERT INTO
  "Profile" (user_id, full_name, address)
VALUES
  (1, 'Aji Prio', '321 Mars'),
  (2, 'Budi Hartono', '324 Jakarta'),
  (3, 'Elon Musk', '123 Depok');
-- Insert data pada tabel "Actor"
INSERT INTO
  "Actor" (name)
VALUES
  ('Tom Hanks'),
  ('Scarlett Johansson'),
  ('Leonardo DiCaprio');
-- Insert data pada tabel "Movie"
INSERT INTO
  "Movie" (title, release_year)
VALUES
  ('Forrest Gump', 1994),
  ('Lost in Translation', 2003),
  ('The Wolf of Wall Street', 2013);
-- Insert data pada tabel "Actor_Movie"
INSERT INTO
  "Actor_Movie" (actor_id, movie_id)
VALUES
  (1, 1),
  -- Tom Hanks dalam film Forrest Gump
  (2, 2),
  -- Scarlett Johansson dalam film Lost in Translation
  (3, 3);
-- Leonardo DiCaprio dalam film The Wolf of Wall Street
  -- Insert data pada tabel "Country"
INSERT INTO
  "Country" (name, population, capital)
VALUES
  ('Indonesia', 273523615, 'Jakarta'),
  ('United States', 331002651, 'Washington, D.C.'),
  ('China', 1439323776, 'Beijing');
-- Insert data pada tabel "City"
INSERT INTO
  "City" (country_id, name, population)
VALUES
  (1, 'Jakarta', 10953519),
  -- Jakarta, Indonesia
  (2, 'New York City', 8336817),
  -- New York City, United States
  (3, 'Shanghai', 24256800);
-- Shanghai, China