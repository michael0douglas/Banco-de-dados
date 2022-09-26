create database AlunoProjeto;
use AlunoProjeto;
-- Criar as tabelas equivalentes à modelagem. 
create table 
aluno (
	IDaluno int primary key auto_increment,
    nome varchar (45),
    tell varchar (16),
    fksuper int ,
    constraint fksuper foreign key (fksuper)
			references aluno (IDaluno)
);

 create table
 acompanhate (
	idacom int,
    fkaluno int,
    nome varchar (45),
    parentesco varchar (45),
    foreign key (fkaluno) references aluno (idaluno),
    primary key (idacom,fkaluno)
    
);

 create table 
 projeto (
	IDpro int,
    fkaluno int,
    nome varchar (45),
    descP varchar (45),
    foreign key (fkaluno) references aluno(idaluno),
    primary key (IDpro,fkaluno)
    
);

-- Inserir dados nas tabelas.
insert into aluno values
	(1, "michael", 40028922, 1),
    (2, "martelão", 83658922, 2),
    (3, "pastor", 93848922, 3);
    
insert into projeto values
	 (1,1,"portugues","quimica avançada"),
     (2,1,"ti","manobras radicais"),
     (3,2,"youtube","discurso em igreja");
     
insert into acompanhate values
	(1,1,"lari","prima"),
    (2,2,"marcelo","pai"),
    (3,1,"mariz","vó");
    
    -- Exibir todos os dados de cada tabela criada, separadamente
    select * from aluno;
    select * from projeto;
    select * from acompanhate;
    
    -- Exibir os dados dos alunos e dos projetos correspondentes.
   SELECT * FROM aluno JOIN projeto
	ON idaluno = fkaluno;
    
    -- - Exibir os dados dos alunos e dos seus acompanhantes
select * from aluno join acompanhate	
	on idaluno = fkaluno;
    
    -- Exibir os dados dos alunos e dos seus representantes.
    select * from aluno join aluno  -- não consegu realizar essa função
		on idaluno = fksuper;
        
   -- Exibir os dados dos alunos e dos projetos correspondentes, mas somente de um determinado projeto (indicar o nome do projeto na consulta).
   select * from aluno a join projeto p on p.IDpro = p.fkaluno where a.nome = 'michael'; -- =c deu certo mas tenho certeza que está errado kk
   
   -- Exibir os dados dos alunos, dos projetos correspondentes e dos seus acompanhantes.
   select * from aluno a join projeto p on a.idaluno = p.fkaluno join acompanhate ac on a.idaluno = ac.fkaluno; -- ;-;
   
   -- atividade 2
   create database campanha;
   use campanha;
create table organizador (
idorgao int primary key auto_increment,
nome varchar (45),
rua varchar (45),
barrio varchar (45),
email varchar (60),
fkexp int,
constraint fkexp foreign key (fkexp) references organizador (idorgao)
) auto_increment = 30;

CREATE TABLE campanha(
    idCamp INT PRIMARY KEY AUTO_INCREMENT, 
    categoria VARCHAR(45), 
    dataFinal DATE, 
    primeiraInstituicao VARCHAR(45), 
    segundaInstituicao VARCHAR(45), 
    fkOrga INT, FOREIGN KEY (fkOrga) REFERENCES organizador(idorgao)
) AUTO_INCREMENT = 500;
 drop database campanha;
-- d) Inserir dados nas tabelas, de forma que exista mais de uma campanha para
-- algum organizador, e mais de um organizador novato sendo orientado por algum
-- organizador mais experiente.
INSERT INTO organizador VALUES
    (null, 'Vivian', 'Rua do banco', 'Jardim Dados', 'ilove_bd@gmail.com', null);

INSERT INTO organizador VALUES
    (null, 'michael', 'Rua', 'Itaquera', 'mike@hotmail.com',30), 
    (null, 'douglas', 'Av. euclides', 'Jardim estela', 'doudou@gmail.com', 30), 
    (null, 'vivian', 'Av. Paulista', 'Bairro de São Paulo', 'vivi@gmail.com', null); 

INSERT INTO campanha VALUES
    (null, 'alimento','2022-12-01','Bradesco','SPTech',30), 
    (null, 'manifesto padroso','2024-10-20','SPTech', null, 31),
    (null, 'cachorros dogosos', '2029-08-08', 'ETEC', 'FATEC', 32); -- não entendi o erro que está dando
 
   -- e) Exibir todos os dados de cada tabela criada, separadamente.
SELECT * FROM campanha; 
SELECT * FROM organizador; 

-- g) Exibir os dados dos organizadores e os dados de suas respectivas campanhas.
SELECT * FROM organizador
 JOIN campanha ON idorgao = fkOrga;  

-- h) Exibir os dados de um determinado organizador (informar o nome do
-- organizador na consulta) e os dados de suas respectivas campanhas.
SELECT * FROM organizador o
 JOIN campanha ON idorgao = fkorga
  WHERE o.nome = 'michael';

-- i) Exibir os dados dos organizadores novatos e os dados dos respectivos
-- organizadores orientadores.
SELECT * FROM organizador n JOIN organizador o ON o.idorgao = n.fkexp; -- <3



-- j) Exibir os dados dos organizadores novatos e os dados dos respectivos
-- organizadores orientadores, porém somente de um determinado organizador
-- orientador (informar o nome do organizador orientador na consulta).
SELECT * FROM organizador n JOIN organizador o ON o.idorgao = n.fkexp WHERE n.nome = 'michael';


-- l) Exibir os dados dos organizadores novatos, os dados das respectivas
-- campanhas organizadas e os dados dos respectivos organizadores orientadores.
SELECT * FROM organizador n JOIN organizador o ON o.idOrgao = n.fkexp JOIN campanha c ON n.idOrgao = c.fkOrga;


-- m)
SELECT * FROM organizador n JOIN organizador o ON o.idOrgao = n.fkexp
	JOIN campanha c ON n.idOrgao = c.fkorga WHERE n.nome = 'michael';

