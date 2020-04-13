DROP TABLE IF EXISTS Patient;
DROP TABLE IF EXISTS Ordonnance;
DROP TABLE IF EXISTS Praticien;
DROP TABLE IF EXISTS Agenda;


CREATE TABLE Patient(
        Pat_id        INT UNSIGNED AUTO_INCREMENT,
        Pat_nom       VARCHAR (100) NOT NULL ,
        Pat_prenom    VARCHAR (100) NOT NULL ,
        Pat_sexe      CHAR(1) NOT NULL ,
        Pat_adresse   VARCHAR (128) NOT NULL ,
        Pat_naissance DATE NOT NULL ,
        Pat_mdp       VARCHAR (128) NOT NULL ,
        Pat_allergie  VARCHAR (255) NOT NULL ,
        Pat_email     VARCHAR (128) UNIQUE NOT NULL,
        PRIMARY KEY (Pat_id)
);


CREATE TABLE Praticien(
        Pra_id         INT UNSIGNED AUTO_INCREMENT,
        Pra_nom        VARCHAR (100) NOT NULL,
        Pra_prenom     VARCHAR (100) NOT NULL,
        Pra_adresse    VARCHAR (100) NOT NULL,
        Pra_telephone  VARCHAR (100) NOT NULL,
        Pra_specialite VARCHAR (100) NOT NULL,
        Pra_mdp        VARCHAR (100) NOT NULL,
        Pra_email      VARCHAR (100) NOT NULL,
        Id_ord         INT NOT NULL,
        PRIMARY KEY (Pra_id)


);



CREATE TABLE Agenda(
        Agenda_ID  INT UNSIGNED,
        Date_rdv DATETIME NOT NULL, 
        Id_Pra INT UNSIGNED NOT NULL,
        Id_Pat INT UNSIGNED NOT NULL,

        CONSTRAINT fk_numero_Praticien
        FOREIGN KEY (Id_Pra)
        REFERENCES Praticien(Pra_id),

        CONSTRAINT fk_numero_Patient
        FOREIGN KEY (Id_Pat)
        REFERENCES Patient(Pat_id)

);



CREATE TABLE Ordonnance(
    Ord_id  INT UNSIGNED AUTO_INCREMENT,
    Ord_traitement VARCHAR (255),
    Ord_date DATE NOT NULL,
    Ord_patient INT UNSIGNED NOT NULL,
    PRIMARY KEY (Ord_id),

    CONSTRAINT fk_numero_Patient_Ord
    FOREIGN KEY (Ord_patient)
    REFERENCES Patient(Pat_id)

);
