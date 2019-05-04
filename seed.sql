DROP TABLE IF EXISTS football_team;

CREATE TABLE football_team (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  points INT,
  position VARCHAR(255),
  image VARCHAR(255)
);

INSERT INTO football_team (name, points, position, image) VALUES ('Man City', 92, '1st', "https://picsum.photos/200");
INSERT INTO football_team (name, points, position, image) VALUES ('Liverpool', 91, '2nd', "https://picsum.photos/200");
INSERT INTO football_team (name, points, position, image) VALUES ('Spurs', 71, '3rd', "https://picsum.photos/200");
INSERT INTO football_team (name, points, position, image) VALUES ('Chelsea', 70, '4th', "https://picsum.photos/200");
INSERT INTO football_team (name, points, position, image) VALUES ('Arsenal', 68, '5th', "https://picsum.photos/200");


DROP TABLE IF EXISTS player;

CREATE TABLE player (
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  age INT,
  position VARCHAR(255),
  team_id INTEGER REFERENCES football_team (id) CONSTRAINT fk_player_football_team FOREIGN KEY (team_id) REFERENCES football_team (id)
  image VARCHAR(255)
);

INSERT INTO player (first_name, last_name, age, position, team_id, image) VALUES ('Petr', 'Cech', 34, 'GK', 5, "https://picsum.photos/200");
INSERT INTO player (first_name, last_name, age, position, team_id, image) VALUES ('Raheem', 'Stirling', 24, 'RW', 1, "https://picsum.photos/200");
INSERT INTO player (first_name, last_name, age, position, team_id, image) VALUES ('Eden', 'Hazard', 28, 'LW', 4, "https://picsum.photos/200");
INSERT INTO player (first_name, last_name, age, position, team_id, image) VALUES ('Sadio', 'Mane', 28, 'LW', 2, "https://picsum.photos/200");
INSERT INTO player (first_name, last_name, age, position, team_id, image) VALUES ('Harry', 'Kane', 27, 'CF', 3, "https://picsum.photos/200");
INSERT INTO player (first_name, last_name, age, position, team_id, image) VALUES ('Dele', 'Alli', 24, 'CM', 3, "https://picsum.photos/200");
INSERT INTO player (first_name, last_name, age, position, team_id, image) VALUES ('Olivier', 'Giroud', 29, 'CF', 4, "https://picsum.photos/200");
INSERT INTO player (first_name, last_name, age, position, team_id, image) VALUES ('Aaron', 'Ramsey', 28, 'CM', 5, "https://picsum.photos/200");
INSERT INTO player (first_name, last_name, age, position, team_id, image) VALUES ('John', 'Stones', 24, 'CB', 1, "https://picsum.photos/200");

DROP TABLE IF EXISTS cricket_team;

CREATE TABLE cricket_team (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  points INT,
  position VARCHAR(255),
  image VARCHAR(255)
);

INSERT INTO cricket_team (name, points, position, image) VALUES ('England', 14, '2nd', "https://picsum.photos/200");
INSERT INTO cricket_team (name, points, position, image) VALUES ('Australia', 12, '3rd=', "https://picsum.photos/200");
INSERT INTO cricket_team (name, points, position, image) VALUES ('India', 15, '1st', "https://picsum.photos/200");
INSERT INTO cricket_team (name, points, position, image) VALUES ('New Zeland', 12, '3rd=', "https://picsum.photos/200");
INSERT INTO cricket_team (name, points, position, image) VALUES ('Afghanistan', 8, '5th', "https://picsum.photos/200");
