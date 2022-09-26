DROP DATABASE IF EXISTS SpotifyClone;

  CREATE DATABASE IF NOT EXISTS SpotifyClone;

  CREATE TABLE SpotifyClone.plans(
    plan_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(45) NOT NULL,
    plan_value DECIMAL(3,2) NOT NULL
  );

  CREATE TABLE SpotifyClone.artist(
    artist_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(45) NOT NULL    
  );

  CREATE TABLE SpotifyClone.album(
    album_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(45) NOT NULL,
    release_year YEAR,
    artist_id INT NOT NULL,
      FOREIGN KEY (artist_id) REFERENCES SpotifyClone.artist (artist_id)
  );

  CREATE TABLE SpotifyClone.musics(
    music_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(45) NOT NULL,
    duration_in_seconds INT NOT NULL,
    album_id INT NOT NULL,
      FOREIGN KEY (album_id) REFERENCES SpotifyClone.album (album_id)
  );

  CREATE TABLE SpotifyClone.user(
    user_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(45) NOT NULL,
    age INT NOT NULL,
    subscription_date DATE NOT NULL,
    plan_id INT NOT NULL,
      FOREIGN KEY (plan_id) REFERENCES SpotifyClone.plans (plan_id)
  );

  CREATE TABLE SpotifyClone.follow_artist(
    user_id INT NOT NULL PRIMARY KEY,
    artist_id INT,
      FOREIGN KEY (artist_id) REFERENCES SpotifyClone.artist (artist_id),
      FOREIGN KEY (user_id) REFERENCES SpotifyClone.user (user_id)
  );

  CREATE TABLE SpotifyClone.historic(
    historic_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    reproduction_date DATETIME NOT NULL,
    music_id INT NOT NULL,
    user_id INT NOT NULL,
      FOREIGN KEY (music_id) REFERENCES SpotifyClone.musics (music_id),
      FOREIGN KEY (user_id) REFERENCES SpotifyClone.user (user_id)
  );

  INSERT INTO SpotifyClone.plans (name, plan_value)
  VALUES
    ('gratuito', 0.00),
    ('universitário', 5.99),
    ('pessoal', 6.99),
    ('familiar', 7.99);

  INSERT INTO SpotifyClone.artist (name)
  VALUES
    ('Beyoncé'),
    ('Queen'),
    ('Elis Regina'),
    ('Baco Exu do Blues'),
    ('Blind Guardian'),
    ('Nina simone');

  INSERT INTO SpotifyClone.album (name, release_year, artist_id)
  VALUES
    ('Renassance', 2022, 1),
    ('Jazz', 1978, 2),
    ('Hot Space', 1982, 2),
    ('Falso Brilhante', 1998), 3,
    ('Vento de Maio', 2001, 3),
    ('QVVJFA?', 2003, 4),
    ('Somewhere Far Beyond', 2007, 5),
    ('I Put A Spell On You', 2012, 6);

  INSERT INTO SpotifyClone.musics (name, duration_in_seconds, album_id)
  VALUES
    1('BREAK MY SOUL', 279, 1),
    2('VIRGO’S GROOVE', 369, 1),
    3('ALIEN SUPERSTAR', 116, 1),
    4('Don’t Stop Me Now', 203, 2),
    5('Under Pressure', 152, 3),
    6('Como Nossos Pais', 105, 4),
    7('O Medo de Amar é o Medo de Ser Livre', 207, 5),
    8('Samba em Paris', 267, 6),
    9('The Bard’s Song', 244, 7),
    10('Feeling Good', 100, 8);

  INSERT INTO SpotifyClone.user (name, age, subscription_date, plan_id)
  VALUES
    ('Barbara Liskov', 82, '2019-10-20', 1),
    ('Robert Cecil Martin', 58, '2017-01-06', 1),
    ('Ada Lovelace', 37, '2017-12-30', 4),
    ('Martin Fowler', 46, '2017-01-17', 4),
    ('Sandi Metz', 58, '2018-04-29', 4),
    ('Paulo Freire', 19, '2018-02-14', 2),
    ('Bell Hooks', 26, '2018-01-05', 2),
    ('Christopher Alexander', 85, '2019-06-05', 3),
    ('Judith Butler', 45, '2020-05-13', 3),
    ('Jorge Amado', 58, '2017-02-17', 3);

  INSERT INTO SpotifyClone.follow_artist (user_id, artist_id)
  VALUES
    (1, 1),
    (1, 2),
    (1, 3),
    (2, 1),
    (2, 3),
    (3, 2),
    (4, 4),
    (5, 5),
    (5, 6),
    (6, 6),
    (6, 1),
    (7, 6),
    (8),
    (9, 3),
    (10, 2);

  INSERT INTO SpotifyClone.historic (reproduction_date, music_id, user_id)
  VALUES
    ('2022-02-28 10:45:55', 8, 1),
    ('2020-05-02 05:30:35', 2, 1),
    ('2020-03-06 11:22:33', 10, 1),
    ('2022-08-05 08:05:17', 10, 2),
    ('2020-01-02 07:40:33', 7, 2),
    ('2020-11-13 16:55:13', 10, 3),
    ('2020-12-05 18:38:30', 2, 3),
    ('2021-08-15 17:10:10', 8, 4),
    ('2022-01-09 01:44:33', 8, 5),
    ('2022-01-09 01:44:33', 5, 5),
    ('2017-01-24 00:31:17', 7, 6),
    ('2017-01-24 00:31:17', 1, 6),
    ('2011-12-15 22:30:49', 4, 7),
    ('2012-03-17 14:56:41', 4, 8),
    ('2022-02-24 21:14:22', 9, 9),
    ('2015-12-13 08:30:22', 3, 10);