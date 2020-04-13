#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------


#------------------------------------------------------------
# Table: patient
#------------------------------------------------------------

CREATE TABLE patient(
        pat_id        Int  Auto_increment  NOT NULL ,
        pat_nom       Varchar (72) NOT NULL ,
        pat_prenom    Varchar (72) NOT NULL ,
        pat_sexe      Varchar (72) NOT NULL ,
        pat_adresse   Varchar (128) NOT NULL ,
        pat_naissance Date NOT NULL ,
        pat_mdp       Varchar (128) NOT NULL ,
        pat_allergie  Varchar (255) NOT NULL ,
        pat_email     Varchar (128) NOT NULL
	,CONSTRAINT patient_Idx INDEX (pat_email)
	,CONSTRAINT patient_PK PRIMARY KEY (pat_id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Ordonnance
#------------------------------------------------------------

CREATE TABLE Ordonnance(
        ord_id         Int  Auto_increment  NOT NULL ,
        ord_medicament Varchar (255) NOT NULL ,
        ord_date       Date NOT NULL
	,CONSTRAINT Ordonnance_PK PRIMARY KEY (ord_id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Praticien
#------------------------------------------------------------

CREATE TABLE Praticien(
        pra_id         Int  Auto_increment  NOT NULL ,
        pra_nom        Varchar (72) NOT NULL ,
        pra_prenom     Varchar (72) NOT NULL ,
        pra_adresse    Varchar (72) NOT NULL ,
        pra_telephone  Varchar (72) NOT NULL ,
        pra_specialite Varchar (72) NOT NULL ,
        pra_mdp        Varchar (72) NOT NULL ,
        pra_email      Varchar (72) NOT NULL ,
        ord_id         Int NOT NULL
	,CONSTRAINT Praticien_Idx INDEX (pra_email)
	,CONSTRAINT Praticien_PK PRIMARY KEY (pra_id)

	,CONSTRAINT Praticien_Ordonnance_FK FOREIGN KEY (ord_id) REFERENCES Ordonnance(ord_id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: consulter
#------------------------------------------------------------

CREATE TABLE consulter(
        pat_id Int NOT NULL ,
        pra_id Int NOT NULL
	,CONSTRAINT consulter_PK PRIMARY KEY (pat_id,pra_id)

	,CONSTRAINT consulter_patient_FK FOREIGN KEY (pat_id) REFERENCES patient(pat_id)
	,CONSTRAINT consulter_Praticien0_FK FOREIGN KEY (pra_id) REFERENCES Praticien(pra_id)
)ENGINE=InnoDB;

