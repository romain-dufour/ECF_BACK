CREATE DATABASE IF NOT EXISTS Data_Base ;
USE Data_Base;

DROP DATABASE Data_Base;
#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------


#------------------------------------------------------------
# Table: Departement
#------------------------------------------------------------

CREATE TABLE Departement(
        Id_departement  Int  Auto_increment  NOT NULL ,
        Nom_departement Varchar (50) NOT NULL
	,CONSTRAINT Departement_PK PRIMARY KEY (Id_departement)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Matiere
#------------------------------------------------------------

CREATE TABLE Matiere(
        Id_matiere          Int  Auto_increment  NOT NULL ,
        Intitule_matiere    Varchar (50) NOT NULL ,
        Description_matiere Varchar (250) NOT NULL ,
        Duree_matiere       Int NOT NULL ,
        Coefficient_matiere Int NOT NULL
	,CONSTRAINT Matiere_PK PRIMARY KEY (Id_matiere)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Enseignant
#------------------------------------------------------------

CREATE TABLE Enseignant(
        Matricule               Int  Auto_increment  NOT NULL ,
        Nom_enseignant          Varchar (50) NOT NULL ,
        Prenom_enseignant       Varchar (50) NOT NULL ,
        Age_enseignant          Int NOT NULL ,
        Grade_enseignant        Int NOT NULL ,
        Prof_principal          Bool NOT NULL ,
        Responsable_departement Bool NOT NULL ,
        Id_departement          Int NOT NULL
	,CONSTRAINT Enseignant_PK PRIMARY KEY (Matricule)

	,CONSTRAINT Enseignant_Departement_FK FOREIGN KEY (Id_departement) REFERENCES Departement(Id_departement)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Classe
#------------------------------------------------------------

CREATE TABLE Classe(
        Id_classe      Int  Auto_increment  NOT NULL ,
        Nom_classe     Varchar (50) NOT NULL ,
        Niveau_classe  Varchar (50) NOT NULL ,
        Id_departement Int NOT NULL
	,CONSTRAINT Classe_PK PRIMARY KEY (Id_classe)

	,CONSTRAINT Classe_Departement_FK FOREIGN KEY (Id_departement) REFERENCES Departement(Id_departement)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Etudiant
#------------------------------------------------------------

CREATE TABLE Etudiant(
        Id_etudiant     Int  Auto_increment  NOT NULL ,
        Nom_etudiant    Varchar (50) NOT NULL ,
        Prenom_etudiant Varchar (50) NOT NULL ,
        Date_naissance  Date NOT NULL ,
        Email           Varchar (50) NOT NULL ,
        Id_classe       Int NOT NULL
	,CONSTRAINT Etudiant_PK PRIMARY KEY (Id_etudiant)

	,CONSTRAINT Etudiant_Classe_FK FOREIGN KEY (Id_classe) REFERENCES Classe(Id_classe)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Emploi_du_temps
#------------------------------------------------------------


CREATE TABLE Emploi_du_temps(
    Id_emploi_du_temps INT AUTO_INCREMENT NOT NULL,
    Jour DATETIME NOT NULL,
    Id_etudiant INT NOT NULL,
    PRIMARY KEY (Id_emploi_du_temps),
    FOREIGN KEY (Id_etudiant) REFERENCES Etudiant(Id_etudiant)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Note
#------------------------------------------------------------

CREATE TABLE Note(
        Id_note          Int  Auto_increment  NOT NULL ,
        Valeur_note      Float NOT NULL ,
        Commentaire_note Varchar (50) NOT NULL ,
        Id_matiere       Int NOT NULL ,
        Id_etudiant      Int NOT NULL
	,CONSTRAINT Note_PK PRIMARY KEY (Id_note)

	,CONSTRAINT Note_Matiere_FK FOREIGN KEY (Id_matiere) REFERENCES Matiere(Id_matiere)
	,CONSTRAINT Note_Etudiant0_FK FOREIGN KEY (Id_etudiant) REFERENCES Etudiant(Id_etudiant)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Enseigne
#------------------------------------------------------------

CREATE TABLE Enseigne(
        Id_matiere Int NOT NULL ,
        Matricule  Int NOT NULL
	,CONSTRAINT Enseigne_PK PRIMARY KEY (Id_matiere,Matricule)

	,CONSTRAINT Enseigne_Matiere_FK FOREIGN KEY (Id_matiere) REFERENCES Matiere(Id_matiere)
	,CONSTRAINT Enseigne_Enseignant0_FK FOREIGN KEY (Matricule) REFERENCES Enseignant(Matricule)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: inculque
#------------------------------------------------------------

CREATE TABLE inculque(
        Id_classe Int NOT NULL ,
        Matricule Int NOT NULL
	,CONSTRAINT inculque_PK PRIMARY KEY (Id_classe,Matricule)

	,CONSTRAINT inculque_Classe_FK FOREIGN KEY (Id_classe) REFERENCES Classe(Id_classe)
	,CONSTRAINT inculque_Enseignant0_FK FOREIGN KEY (Matricule) REFERENCES Enseignant(Matricule)
)ENGINE=InnoDB;

INSERT INTO Departement (Nom_departement) VALUES
('Informatique'),
('Mathématiques'),
('Physique'),
('Chimie'),
('Langues'),
('Histoire'),
('Géographie'),
('Biologie'),
('Économie'),
('Arts');


INSERT INTO Matiere (Intitule_matiere, Description_matiere, Duree_matiere, Coefficient_matiere) VALUES
('Algorithmique', 'Introduction aux algorithmes', 60, 4),
('Calcul Différentiel', 'Les bases du calcul différentiel', 45, 3),
('Physique Quantique', 'Introduction à la physique quantique', 75, 5),
('Chimie Organique', 'Les composés organiques', 50, 4),
('Anglais', 'Cours danglais avancé', 30, 2),
('Histoire Ancienne', 'Étude des civilisations anciennes', 60, 4),
('Géographie Humaine', 'Étude des populations et des territoires', 45, 3),
('Biologie Cellulaire', 'Introduction à la biologie cellulaire', 60, 4),
('Microéconomie', 'Principes de microéconomie', 45, 3),
('Art Visuel', 'Exploration des arts visuels', 60, 4);

INSERT INTO Enseignant (Nom_enseignant, Prenom_enseignant, Age_enseignant, Grade_enseignant, Prof_principal, Responsable_departement, Id_departement) VALUES
('Dupont', 'Jean', 35, 2, 1, 1, 1),
('Martin', 'Sophie', 40, 3, 0, 0, 2),
('Lefevre', 'Paul', 32, 1, 0, 0, 2),
('Dubois', 'Isabelle', 45, 3, 0, 0, 1),
('Leclerc', 'Pierre', 38, 2, 1, 0, 2),
('Girard', 'Marie', 42, 3, 0, 0, 2),
('Moreau', 'François', 36, 2, 0, 0, 1),
('Leroy', 'Cécile', 41, 3, 0, 1, 2),
('Roux', 'Michel', 37, 2, 1, 0, 1),
('Lemoine', 'Aurélie', 39, 2, 0, 0, 1);

INSERT INTO Classe (Nom_classe, Niveau_classe, Id_departement) VALUES
('SIO1', 'BTS', 1),
('L3 Mathématiques', 'Licence', 2),
('M1 Physique', 'Master', 1),
('L2 Chimie', 'Licence', 2),
('LLCE Anglais', 'Licence', 1),
('L1 Histoire', 'Licence', 2),
('L2 Géographie', 'Licence', 1),
('L3 Biologie', 'Licence', 2),
('L2 Économie', 'Licence', 1),
('L1 Arts Plastiques', 'Licence', 2);


INSERT INTO Etudiant (Nom_etudiant, Prenom_etudiant, Date_naissance, Email, Id_classe) VALUES
('Dupuis', 'Alice', '1995-03-15', 'alice.dupuis@gmail.com', 1),
('Martin', 'Thomas', '1994-06-20', 'thomas.martin@gmail.com', 2),
('Lefevre', 'Emma', '1996-01-10', 'emma.lefevre@gmail.com', 1),
('Dubois', 'Lucas', '1993-08-05', 'lucas.dubois@gmail.com', 2),
('Leclerc', 'Chloé', '1997-04-25', 'chloe.leclerc@gmail.com', 1),
('Girard', 'Louis', '1992-11-30', 'louis.girard@gmail.com', 2),
('Moreau', 'Camille', '1998-07-12', 'camille.moreau@gmail.com', 1),
('Leroy', 'Arthur', '1991-09-18', 'arthur.leroy@gmail.com', 2),
('Roux', 'Sophie', '1999-02-08', 'sophie.roux@gmail.com', 1),
('Lemoine', 'Hugo', '1990-12-03', 'hugo.lemoine@gmail.com', 2);


INSERT INTO Emploi_du_temps (Jour, Id_etudiant) VALUES
('2024-02-01 08:00:00', 1),
('2024-02-02 09:30:00', 2),
('2024-02-03 11:00:00', 3),
('2024-02-04 13:30:00', 4),
('2024-02-05 15:00:00', 5),
('2024-02-06 16:30:00', 6),
('2024-02-07 18:00:00', 7),
('2024-02-08 08:30:00', 8),
('2024-02-09 10:00:00', 9),
('2024-02-10 11:30:00', 10);




INSERT INTO Note (Valeur_note, Commentaire_note, Id_matiere, Id_etudiant) VALUES
(14.5, 'Très bien', 1, 1),
(12.3, 'Bien', 2, 2),
(16.8, 'Excellent', 3, 3),
(10.5, 'Assez bien', 4, 4),
(18.2, 'Parfait', 5, 5),
(13.7, 'Très bien', 6, 6),
(11.0, 'Bien', 7, 7),
(15.9, 'Excellent', 8, 8),
(9.8, 'Assez bien', 9, 9),
(17.4, 'Parfait', 10, 10),
-- Pour id_etudiant = 1
(11.2, 'Bien', 1, 1),
(13.8, 'Très bien', 2, 1),
(14.7, 'Excellent', 3, 1),
(9.5, 'Assez bien', 4, 1),
(16.0, 'Parfait', 5, 1),

-- Pour id_etudiant = 2
(15.3, 'Très bien', 1, 2),
(10.8, 'Assez bien', 2, 2),
(14.0, 'Bien', 3, 2),
(12.5, 'Excellent', 4, 2),
(17.2, 'Parfait', 5, 2),

-- Pour id_etudiant = 3
(13.0, 'Parfait', 1, 3),
(11.5, 'Bien', 2, 3),
(15.8, 'Très bien', 3, 3),
(9.7, 'Assez bien', 4, 3),
(16.5, 'Excellent', 5, 3),

-- Pour id_etudiant = 4
(12.7, 'Très bien', 1, 4),
(14.2, 'Bien', 2, 4),
(10.9, 'Assez bien', 3, 4),
(16.8, 'Excellent', 4, 4),
(11.5, 'Parfait', 5, 4),

-- Pour id_etudiant = 5
(14.0, 'Excellent', 1, 5),
(12.5, 'Très bien', 2, 5),
(10.3, 'Assez bien', 3, 5),
(16.2, 'Bien', 4, 5),
(13.8, 'Parfait', 5, 5),

-- Pour id_etudiant = 6
(11.9, 'Parfait', 1, 6),
(14.5, 'Bien', 2, 6),
(12.0, 'Très bien', 3, 6),
(16.7, 'Excellent', 4, 6),
(9.8, 'Assez bien', 5, 6),

-- Pour id_etudiant = 7
(16.2, 'Excellent', 1, 7),
(11.4, 'Parfait', 2, 7),
(13.7, 'Très bien', 3, 7),
(10.5, 'Assez bien', 4, 7),
(14.0, 'Bien', 5, 7),

-- Pour id_etudiant = 8
(12.8, 'Assez bien', 1, 8),
(15.5, 'Bien', 2, 8),
(13.0, 'Très bien', 3, 8),
(11.2, 'Parfait', 4, 8),
(17.1, 'Excellent', 5, 8),

-- Pour id_etudiant = 9
(14.6, 'Très bien', 1, 9),
(10.9, 'Excellent', 2, 9),
(12.3, 'Assez bien', 3, 9),
(16.0, 'Bien', 4, 9),
(9.5, 'Parfait', 5, 9),

-- Pour id_etudiant = 10
(11.8, 'Assez bien', 1, 10),
(15.0, 'Très bien', 2, 10),
(13.2, 'Bien', 3, 10),
(17.5, 'Parfait', 4, 10),
(9.4, 'Excellent', 5, 10);



INSERT INTO Enseigne (Id_matiere, Matricule) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);



INSERT INTO inculque (Id_classe, Matricule) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);



-- Requete SQL

-- Afficher la liste des classes (sans les eleves).

SELECT Id_classe, Nom_classe, Niveau_classe, Id_departement
FROM Classe;


-- Afficher le nombre de matière d'un élève.

SELECT e.Nom_etudiant, COUNT(DISTINCT n.Id_matiere) AS Nombre_de_matieres
FROM Etudiant e
JOIN Note n ON e.Id_etudiant = n.Id_etudiant
WHERE e.Id_etudiant = 1;


-- Afficher la liste des notes d'un eleve (avec les détails).

SELECT
    e.Nom_etudiant,
    n.Valeur_note,
    n.Commentaire_note,
    m.Intitule_matiere
FROM
    Etudiant e
JOIN
    Note n ON e.Id_etudiant = n.Id_etudiant
JOIN
    Matiere m ON n.Id_matiere = m.Id_matiere
WHERE
    e.Id_etudiant = 1;


-- Aficher la moyenne d'un eleve.

SELECT
    e.Nom_etudiant,
    ROUND(AVG(n.Valeur_note), 2) AS Moyenne
FROM
    Etudiant e
JOIN
    Note n ON e.Id_etudiant = n.Id_etudiant
WHERE
    e.Id_etudiant = 1;


-- Afficher le nombre d'eleve d'un département.

SELECT
    d.Nom_departement,
    COUNT(DISTINCT e.Id_etudiant) AS Nombre_d_eleves
FROM
    Departement d
JOIN
    Classe c ON d.Id_departement = c.Id_departement
JOIN
    Etudiant e ON c.Id_classe = e.Id_classe
WHERE
    d.Id_departement = 1;


-- Afficher tous les noms des eleves d'un niveau.

SELECT
    e.Nom_etudiant,
    e.Prenom_etudiant
FROM
    Etudiant e
JOIN
    Classe c ON e.Id_classe = c.Id_classe
WHERE
    c.Niveau_classe = 'Licence';


-- Suppression d'un eleve, supprimera sa note mais pas sa classe.

START TRANSACTION;

-- Supprimer les notes de l'élève
DELETE FROM Note WHERE Id_etudiant = 1;

-- Supprimer l'élève
DELETE FROM Etudiant WHERE Id_etudiant = 1;

COMMIT;



-- Suppression classe => supprime uniquement les éléves de cette classe.

START TRANSACTION;

-- Supprimer les élèves de la classe
DELETE FROM Etudiant WHERE Id_classe IN (SELECT Id_classe FROM Classe WHERE Id_classe = 1);

-- Supprimer la classe
DELETE FROM Classe WHERE Id_classe = 1;

COMMIT;



-- Suppression d'un departement => Supprime toutes les classes et tous les professeurs.

START TRANSACTION;

-- Supprimer les classes du département
DELETE FROM Classe WHERE Id_departement = 1;

-- Supprimer tous les enseignants des classes supprimées
DELETE FROM Enseignant WHERE Matricule NOT IN (SELECT Matricule FROM Classe);

-- Supprimer le département
DELETE FROM Departement WHERE Id_departement = 1;

COMMIT;




