CREATE DATABASE bd_clientes_1e;
USE bd_clientes_1e;

CREATE TABLE tbl_clientes2 (
id int not null primary key auto_increment,
nome varchar(100) not null,
idade int not null,
sexo char(1) not null,
email varchar(100) not null,
telefone varchar(15) not null,
endereco varchar(255) not null
);

insert into tbl_clientes2(nome,idade,sexo,email,telefone,endereco)
	values
		("Lucas",17,"M","luc4sgbsoar3s@gmail.com","(15)997051907","Sla"),
        ("Veronica",17,"F","veron@gmail.com","(55)996767676","Nsei"),
        ("Alberto",72,"M","Albs78@gmail.com","(15)5454545464","Em algum lugar"),
        ("Luzia",12,"F","luz@gmail.com","(15)9898989898","N sei"),
        ("Batata",55,"F","batata@gmail.com","(15)994343433","IDK");
        
SELECT * FROM tbl_clientes2;

DELIMITER $$
	CREATE PROCEDURE sp_maiores_18(IN idade2 INT)
    BEGIN
    IF idade2 > 18 THEN
    SELECT * FROM tbl_clientes2 WHERE idade > 18;
    ELSEIF idade2 < 18 THEN
    SELECT * FROM tbl_clientes2 WHERE idade < 18;
    END IF;
	END $$
DELIMITER ;

drop procedure sp_maiores_18;

#LISTA MAIORES DE 18
CALL sp_maiores_18 (12);
#LISTA MENORES 18
CALL sp_maiores_18(19);