SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;


CREATE TABLE adresse (
  id int(11) NOT NULL,
  adresse varchar(255) NOT NULL,
  code_postal int(11) NOT NULL,
  ville varchar(50) NOT NULL,
  latitude decimal(10,8) NOT NULL,
  longitude decimal(11,8) NOT NULL,
  description varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO adresse (id, adresse, code_postal, ville, latitude, longitude, description) VALUES
(1, '150 impasse des arnaves', 30340, 'MONS', '43.69140000', '6.71444000', 'Au bout du chemin à droite'),
(2, '259 avenue monceau', 30000, 'NIMES', '43.83330000', '4.35000000', 'Au bout de la rue'),
(3, '192 rue des alouettes', 30100, 'ALES', '44.13330000', '4.08330000', NULL);

CREATE TABLE commande (
  id int(11) NOT NULL,
  id_client int(11) NOT NULL,
  id_livreur int(11) DEFAULT NULL,
  date_commande datetime NOT NULL,
  date_livraison datetime DEFAULT NULL,
  id_statut_commande smallint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO commande (id, id_client, id_livreur, date_commande, date_livraison, id_statut_commande) VALUES
(1, 2, 1, '2020-12-29 19:25:46', NULL, 1),
(2, 3, 4, '2020-12-29 19:25:46', '2020-12-29 19:45:46', 3),
(3, 2, NULL, '2020-12-29 19:25:46', NULL, 2);

CREATE TABLE ligne_commande (
  id_commande int(11) NOT NULL,
  id_plat int(11) NOT NULL,
  quantite int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO ligne_commande (id_commande, id_plat, quantite) VALUES
(1, 1, 3),
(1, 2, 2),
(2, 1, 1),
(2, 2, 1),
(3, 1, 10),
(3, 2, 10);

CREATE TABLE plat (
  id int(11) NOT NULL,
  nom varchar(20) NOT NULL,
  type varchar(20) NOT NULL,
  prix_ht decimal(6,2) NOT NULL,
  tva smallint(2) NOT NULL,
  date datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO plat (id, nom, `type`, prix_ht, tva, `date`) VALUES
(1, 'Jambon grillé', 'plats', '9.99', 20, '2020-12-29 19:23:53'),
(2, 'choux à la crème', 'desserts', '5.99', 20, '2020-12-29 19:23:53');

CREATE TABLE role (
  id smallint(2) NOT NULL,
  nom varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO role (id, nom) VALUES
(1, 'Livreur'),
(2, 'Client'),
(3, 'Chef');

CREATE TABLE statut_commande (
  id smallint(2) NOT NULL,
  nom varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO statut_commande (id, nom) VALUES
(1, 'En cours de livraison'),
(2, 'Paiement valide'),
(3, 'Livraison effectuée'),
(4, 'Annulée');

CREATE TABLE statut_livreur (
  id smallint(2) NOT NULL,
  nom varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO statut_livreur (id, nom) VALUES
(1, 'Disponible'),
(2, 'En livraison'),
(3, 'Non disponible');

CREATE TABLE utilisateur (
  id int(11) NOT NULL,
  nom varchar(50) NOT NULL,
  prenom varchar(50) NOT NULL,
  mail varchar(100) NOT NULL,
  password varchar(20) NOT NULL,
  telephone varchar(20) NOT NULL,
  latitude decimal(10,8) DEFAULT NULL,
  longitude decimal(11,8) DEFAULT NULL,
  id_adresse int(11) DEFAULT NULL,
  id_role smallint(2) NOT NULL,
  id_statut_livreur smallint(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO utilisateur (id, nom, prenom, mail, `password`, telephone, latitude, longitude, id_adresse, id_role, id_statut_livreur) VALUES
(1, 'Livreur25', 'Jerome', 'Livreur25.jerome@gmail.com', '1558a99a6@', '0600055555', '59.09855400', '57.09855400', NULL, 1, 1),
(2, 'Client', 'Test', 'client.test@gmail.com', '115a5aaà!-adad', '0260000000', NULL, NULL, 1, 2, NULL),
(3, 'Client24', 'Test', 'client24.test@gmail.com', '1@@a5aaà!-adad', '0260000000', NULL, NULL, 2, 2, NULL),
(4, 'Livreur', 'Jerome', 'Livreur.jerome@gmail.com', '1558a99a6@', '0600000000', '57.09855400', '57.09855400', NULL, 1, 1),
(5, 'Chef', 'Admin', 'chef.admin@gmail.com', 'iaiaiia@@ap', '0700000000', NULL, NULL, NULL, 3, NULL);


ALTER TABLE adresse
  ADD PRIMARY KEY (id);

ALTER TABLE commande
  ADD PRIMARY KEY (id),
  ADD KEY id_client (id_client),
  ADD KEY id_livreur (id_livreur),
  ADD KEY id_statut_commande (id_statut_commande);

ALTER TABLE ligne_commande
  ADD PRIMARY KEY (id_commande,id_plat),
  ADD KEY id_plat (id_plat);

ALTER TABLE plat
  ADD PRIMARY KEY (id);

ALTER TABLE role
  ADD PRIMARY KEY (id);

ALTER TABLE statut_commande
  ADD PRIMARY KEY (id);

ALTER TABLE statut_livreur
  ADD PRIMARY KEY (id);

ALTER TABLE utilisateur
  ADD PRIMARY KEY (id),
  ADD KEY id_adresse (id_adresse),
  ADD KEY id_role (id_role),
  ADD KEY id_statut_livreur (id_statut_livreur);


ALTER TABLE adresse
  MODIFY id int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE commande
  MODIFY id int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE plat
  MODIFY id int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE role
  MODIFY id smallint(2) NOT NULL AUTO_INCREMENT;

ALTER TABLE statut_commande
  MODIFY id smallint(2) NOT NULL AUTO_INCREMENT;

ALTER TABLE statut_livreur
  MODIFY id smallint(2) NOT NULL AUTO_INCREMENT;

ALTER TABLE utilisateur
  MODIFY id int(11) NOT NULL AUTO_INCREMENT;


ALTER TABLE commande
  ADD CONSTRAINT commande_ibfk_1 FOREIGN KEY (id_client) REFERENCES utilisateur (id),
  ADD CONSTRAINT commande_ibfk_2 FOREIGN KEY (id_livreur) REFERENCES utilisateur (id),
  ADD CONSTRAINT commande_ibfk_3 FOREIGN KEY (id_statut_commande) REFERENCES statut_commande (id);

ALTER TABLE ligne_commande
  ADD CONSTRAINT ligne_commande_ibfk_1 FOREIGN KEY (id_commande) REFERENCES commande (id),
  ADD CONSTRAINT ligne_commande_ibfk_2 FOREIGN KEY (id_plat) REFERENCES plat (id);

ALTER TABLE utilisateur
  ADD CONSTRAINT utilisateur_ibfk_1 FOREIGN KEY (id_adresse) REFERENCES adresse (id),
  ADD CONSTRAINT utilisateur_ibfk_2 FOREIGN KEY (id_role) REFERENCES role (id),
  ADD CONSTRAINT utilisateur_ibfk_3 FOREIGN KEY (id_statut_livreur) REFERENCES statut_livreur (id);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
