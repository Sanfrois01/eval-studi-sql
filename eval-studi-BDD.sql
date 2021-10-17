CREATE DATABASE `eval-studi-sql` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;




CREATE TABLE complexe (
 nom VARCHAR(50)  PRIMARY KEY UNIQUE NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE cinemas(
  id_cinema INTEGER NOT NULL PRIMARY KEY UNIQUE,
  nom VARCHAR(50) NOT NULL ,
  nombre_salle INTEGER, 
  adresse VARCHAR(50),
  est_possede VARCHAR(50),
  FOREIGN KEY (est_possede) REFERENCES complexe(nom)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE clients(
  id_client INTEGER PRIMARY KEY UNIQUE NOT NULL AUTO_INCREMENT,
  nom VARCHAR(50) NOT NULL,
  prenom VARCHAR(50) NOT NULL,
  email VARCHAR(50) NOT NULL,
  mot_de_passe VARCHAR(50) NOT NULL,
  age INTEGER,
  type_client VARCHAR(50)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE seances(
  id_seance INTEGER NOT NULL PRIMARY KEY,
  titre_film VARCHAR(50) NOT NULL,
  heure_projection TIME NOT NULL,
  date_projection  DATE NOT NULL,
  nombre_de_place INTEGER,
  est_diffuse INTEGER,
  est_reserve INTEGER,
  FOREIGN KEY (est_diffuse)  REFERENCES cinemas(id_cinema),
  FOREIGN KEY (est_reserve) REFERENCES clients(id_client)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



CREATE TABLE tarifs(
  prix DECIMAL,
  coute INTEGER,
  FOREIGN KEY (coute) REFERENCES clients(id_client) 

)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



INSERT INTO complexe(nom) VALUES ("Complexe de Cinema");


INSERT INTO cinemas (id_cinema, nom, nombre_salle, adresse) VALUES (1, 'Cinema de Marseille', 5, '818 Truax Center');
INSERT INTO cinemas (id_cinema, nom, nombre_salle, adresse) VALUES (2, 'Cinema de Paris', 6, '44914 Village Road');
INSERT INTO cinemas (id_cinema, nom, nombre_salle, adresse) VALUES (3, 'Cinema de Paris', 11, '47236 Swallow Lane');
INSERT INTO cinemas (id_cinema, nom, nombre_salle, adresse) VALUES (4, 'Cinema de Nîmes', 4, '1672 Cascade Court');
INSERT INTO cinemas (id_cinema, nom, nombre_salle, adresse) VALUES (5, 'Cinema de Paris', 9, '2723 Morningstar Point');


INSERT INTO clients (id_client, nom, prenom, email, mot_de_passe, type_client, age) VALUES (1, 'Gregoretti', 'Brittne', 'bgregoretti0@loc.gov', 'jY7bjW', 'Plein Tarif', 34);
INSERT INTO clients (id_client, nom, prenom, email, mot_de_passe, type_client, age) VALUES (2, 'McLaverty', 'Averyl', 'amclaverty1@google.fr', 'JL6SDh', 'Plein Tarif', 43);
INSERT INTO clients (id_client, nom, prenom, email, mot_de_passe, type_client, age) VALUES (3, 'Sidey', 'Tuckie', 'tsidey2@businessinsider.com', 'uS50ZXy5SYar', 'Tarif Réduit', 7);
INSERT INTO clients (id_client, nom, prenom, email, mot_de_passe, type_client, age) VALUES (4, 'McKendry', 'Cyrille', 'cmckendry3@nifty.com', '5YvHMTY6mXF', 'Tarif Réduit', 13);
INSERT INTO clients (id_client, nom, prenom, email, mot_de_passe, type_client, age) VALUES (5, 'Hooks', 'Leontine', 'lhooks4@rediff.com', 'nHlOvEm9j', 'Etudiant', 21);


INSERT INTO seances (id_seance, titre_film, heure_projection, date_projection, nombre_de_place,est_diffuse,est_reserve) VALUES (1, 'Coup de torchon (Clean Slate)', '14:00', '2021-10-11', 41,1,3);
INSERT INTO seances (id_seance, titre_film, heure_projection, date_projection, nombre_de_place,est_diffuse,est_reserve) VALUES (2, 'Two Faces of January, The', '13:00', '2021-10-12', 26,2,2);
INSERT INTO seances (id_seance, titre_film, heure_projection, date_projection, nombre_de_place,est_diffuse,est_reserve) VALUES (3, 'Mississippi Masala', '10:00', '2021-10-12', 39,4,4);
INSERT INTO seances (id_seance, titre_film, heure_projection, date_projection, nombre_de_place,est_diffuse,est_reserve) VALUES (4, 'Art of Getting By, The', '22:00', '2021-10-12', 16,4,1);
INSERT INTO seances (id_seance, titre_film, heure_projection, date_projection, nombre_de_place,est_diffuse,est_reserve) VALUES (5, 'Glorious Technicolor', '15:00', '2021-10-11', 14,3,5);


INSERT INTO tarifs (prix) VALUES ( 12.9);
INSERT INTO tarifs (prix) VALUES ( 5.9);
INSERT INTO tarifs (prix) VALUES ( 7.6);


CREATE USER 'user'@'localhost' IDENTIFIED BY  '*$2y$10$f93JgarbofcQXkuhnus0xu3iJ/w4uyKTrZhQF4RMXP7TiMmtb4uKC';
CREATE USER 'admin'@'localhost' IDENTIFIED BY  '$2y$10$hbGMK1VpH2BTMw0G3o7ps.EFm.jNUq4QZzuyVr6zu8SBNeKiK.V4q';

GRANT ALL PRIVILEGES  ON 'eval-studi-sql'.* TO 'admin'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON `eval-studi-sql`.* TO 'user'@'localhost';

FLUSH PRIVILEGES;