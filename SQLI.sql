create database SQLI
CREATE TABLE Utilisateur (
    UserID INT PRIMARY KEY,
    NomUtilisateur VARCHAR(50),
    Email VARCHAR(100), 
    position VARCHAR(20) CHECK (position IN ('leader', 'member', 'chef de projet', 'admin')),
    squad INT,
    CONSTRAINT FK_squad_id FOREIGN KEY (squad) REFERENCES squad(squadID) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Project (
    ProjectID INT PRIMARY KEY,
    NomProjet VARCHAR(100),
    Description varchar(100),
    DateDebut DATE,
    DateFin DATE
);

CREATE TABLE Squad (
    SquadID INT PRIMARY KEY,
    squad_name varchar(25),
    ProjectID int ,
    CONSTRAINT FK_Project_id FOREIGN KEY (ProjectID) REFERENCES Project(ProjectID) on delete cascade On update cascade
);

create table Ressource (
    ressource_Id int primary key,  
	nom_res varchar(30),
    Squad_id int, 
    project_id int, 
    CONSTRAINT FK_squad_ID_res FOREIGN KEY (Squad_id) REFERENCES Squad(SquadID) on delete cascade On update cascade,
    CONSTRAINT FK_ProjectID FOREIGN KEY (Project_id) REFERENCES Project(ProjectID) on delete cascade On update cascade
    
);
 create table  category (
   	category_id int primary key ,
    category_name varchar(20) ,
    ressource_Id int,
    CONSTRAINT FK_resource_ID FOREIGN KEY (ressource_Id) REFERENCES ressource (ressource_Id) on delete cascade On update cascade
    
);

create table sub_category (
       	subCategory_id int primary key ,
        subcategory_name varchar(20) ,
    	category_id int ,
    	CONSTRAINT FK_category_ID FOREIGN KEY (category_id) REFERENCES category (category_id) on delete cascade On update cascade
    ); 
--------------------------------------------------------------------
DELIMITER $$

CREATE PROCEDURE add_user (
	 IN `userID` INT,
	 IN `username` VARCHAR(50),
	 IN `user_mail` VARCHAR(50),
	 IN `position` VARCHAR(50),
	 IN `squad` INT
)
BEGIN
    INSERT INTO utilisateur VALUES (userId, username, user_mail, position,squad);
END $$

DELIMITER ;


CREATE PROCEDURE `add_squad`(
    IN squad_id VARCHAR(50),
    IN squad_name VARCHAR(50),
    IN Project_id VARCHAR(50)
)
BEGIN
    INSERT INTO utilisateur VALUES (squad_id, squad_name, Project_id);
END


---------------------------------------------------------------------
insert into project values (1 , 'breif' , 'learn SQL' , CURDATE() , CURDATE() );

select * from squad NATURAL join project where squadId=1 ; 

INSERT INTO ressource VALUES (1, 'SQL ', 1, 1);

INSERT INTO category VALUES (1, 'learn', 1);

INSERT INTO sub_category VALUES (1, 'added', 1);
