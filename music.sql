-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music

-- Artists table to store artist information
CREATE TABLE artists (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

-- Albums table to store album information
CREATE TABLE albums (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    release_date DATE NOT NULL
);

-- Producers table to store producer information
CREATE TABLE producers (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

-- Songs table to store song information
CREATE TABLE songs (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    duration_in_seconds INTEGER NOT NULL,
    release_date DATE NOT NULL,
    album_id INTEGER REFERENCES albums(id)
);

-- Junction table to associate songs with artists
CREATE TABLE song_artists (
    song_id INTEGER REFERENCES songs(id),
    artist_id INTEGER REFERENCES artists(id),
    PRIMARY KEY (song_id, artist_id)
);

-- Junction table to associate songs with producers
CREATE TABLE song_producers (
    song_id INTEGER REFERENCES songs(id),
    producer_id INTEGER REFERENCES producers(id),
    PRIMARY KEY (song_id, producer_id)
);

-- Example data insertion

-- Insert data into artists table
INSERT INTO artists (name) VALUES
  ('Hanson'),
  ('Queen'),
  ('Mariah Carey'),
  ('Boyz II Men'),
  ('Lady Gaga'),
  ('Bradley Cooper'),
  ('Nickelback'),
  ('Jay Z'),
  ('Alicia Keys'),
  ('Katy Perry'),
  ('Juicy J'),
  ('Maroon 5'),
  ('Christina Aguilera'),
  ('Avril Lavigne'),
  ('Destiny''s Child');

-- Insert data into albums table
INSERT INTO albums (title, release_date) VALUES
  ('Middle of Nowhere', '1997-04-15'),
  ('A Night at the Opera', '1975-10-31'),
  ('Daydream', '1995-11-14'),
  ('A Star Is Born', '2018-09-27'),
  ('Silver Side Up', '2001-08-21'),
  ('The Blueprint 3', '2009-10-20'),
  ('Prism', '2013-12-17'),
  ('Hands All Over', '2011-06-21'),
  ('Let Go', '2002-05-14'),
  ('The Writing''s on the Wall', '1999-11-07');

-- Insert data into producers table
INSERT INTO producers (name) VALUES
  ('Dust Brothers'),
  ('Stephen Lironi'),
  ('Roy Thomas Baker'),
  ('Walter Afanasieff'),
  ('Benjamin Rice'),
  ('Rick Parashar'),
  ('Al Shux'),
  ('Max Martin'),
  ('Cirkut'),
  ('Shellback'),
  ('Benny Blanco'),
  ('The Matrix'),
  ('Darkchild');

-- Insert data into songs table with references to albums
INSERT INTO songs (title, duration_in_seconds, release_date, album_id) VALUES
  ('MMMBop', 238, '1997-04-15', 1),
  ('Bohemian Rhapsody', 355, '1975-10-31', 2),
  ('One Sweet Day', 282, '1995-11-14', 3),
  ('Shallow', 216, '2018-09-27', 4),
  ('How You Remind Me', 223, '2001-08-21', 5),
  ('New York State of Mind', 276, '2009-10-20', 6),
  ('Dark Horse', 215, '2013-12-17', 7),
  ('Moves Like Jagger', 201, '2011-06-21', 8),
  ('Complicated', 244, '2002-05-14', 9),
  ('Say My Name', 240, '1999-11-07', 10);

-- Associate songs with artists
INSERT INTO song_artists (song_id, artist_id) VALUES
  (1, 1), -- MMMBop - Hanson
  (2, 2), -- Bohemian Rhapsody - Queen
  (3, 3), (3, 4), -- One Sweet Day - Mariah Carey, Boyz II Men
  (4, 5), (4, 6), -- Shallow - Lady Gaga, Bradley Cooper
  (5, 7), -- How You Remind Me - Nickelback
  (6, 8), (6, 9), -- New York State of Mind - Jay Z, Alicia Keys
  (7, 10), (7, 11), -- Dark Horse - Katy Perry, Juicy J
  (8, 12), (8, 13), -- Moves Like Jagger - Maroon 5, Christina Aguilera
  (9, 14), -- Complicated - Avril Lavigne
  (10, 15); -- Say My Name - Destiny's Child

-- Associate songs with producers
INSERT INTO song_producers (song_id, producer_id) VALUES
  (1, 1), (1, 2), -- MMMBop - Dust Brothers, Stephen Lironi
  (2, 3), -- Bohemian Rhapsody - Roy Thomas Baker
  (3, 4), -- One Sweet Day - Walter Afanasieff
  (4, 5), -- Shallow - Benjamin Rice
  (5, 6), -- How You Remind Me - Rick Parashar
  (6, 7), -- New Y
