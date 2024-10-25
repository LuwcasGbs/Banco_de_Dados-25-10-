CREATE DATABASE bd_clientes_1e;
USE bd_clientes_1e;

CREATE TABLE tbl_clientes (
	codigo int not null primary key auto_increment,
	nome varchar(40) not null,
	sexo char(1) not null
);

INSERT INTO tbl_clientes(nome,sexo)
	values
		("Humberto","M"),
        ("Ayrton Sena","M"),
        ("Xuxa","F");
        
SELECT * FROM tbl_clientes;



#STORED PROCEDURE 
DELIMITER $$
	CREATE PROCEDURE sp_lista_clientes(IN opcao INT)
    BEGIN
		IF opcao = 0 THEN 
			SELECT * FROM tbl_clientes WHERE sexo = 'F';
        ELSEIF opcao = 1 THEN 
			SELECT * FROM tbl_clientes WHERE sexo = 'M';
		ELSE 
			SELECT * FROM tbl_clientes;
        END IF;
	END $$
DELIMITER ;

SHOW PROCEDURE STATUS;


#LISTA SEXO FEMININO
CALL sp_lista_clientes(0);
#LISTA SEXO MASCULINO
CALL sp_lista_clientes(1);
#LISTA TODOS
CALL sp_lista_clientes(2);

DELIMITER $$

	CREATE PROCEDURE sp_busca_por_nome(IN nome_parcial VARCHAR(100))
    BEGIN
		SELECT * FROM tbl_clientes
        WHERE nome LIKE CONCAT('%', nome_parcial, '%');
	END $$
        
DELIMITER ;

CALL sp_busca_por_nome('A');