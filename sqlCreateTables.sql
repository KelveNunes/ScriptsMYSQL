

CREATE TABLE Presidente (
Cpf VARCHAR(14) PRIMARY KEY,
Numero integer NOT NULL,
Bairro VARCHAR(50)  NOT NULL,
Rua VARCHAR(50)  NOT NULL,
Nome VARCHAR(50) NOT NULL
);

CREATE TABLE Sede (
Codigo BIGINT PRIMARY KEY,
Nome VARCHAR(50) NOT NULL,
FK_CpfPresidente VARCHAR(14),
FOREIGN KEY(FK_CpfPresidente) REFERENCES Presidente(Cpf)
);

CREATE TABLE Titulo (
Codigo bigint PRIMARY KEY,
Fk_CodSede bigint, 
Preco double,
foreign key(Fk_CodSede) references Sede(Codigo)
);

CREATE TABLE Titular (
Nome VARCHAR(50) NOT NULL,
Cpf VARCHAR(14) PRIMARY KEY,
Numero integer NOT NULL,
Bairro VARCHAR(50)  NOT NULL,
Rua VARCHAR(50)  NOT NULL,
Telefone VARCHAR(15),
Fk_CodTitulo  bigint,
foreign key(Fk_CodTitulo) references Titulo(Codigo)
);

CREATE TABLE Departamento (
Codigo bigint primary key,
Fk_CodSede bigint, 
Nome VARCHAR(50) not null,
foreign key(Fk_CodSede) references Sede(Codigo)
);


CREATE TABLE Funcionario (
Nome VARCHAR(50) NOT NULL,
Cpf VARCHAR(14) PRIMARY KEY,
Numero integer NOT NULL,
Bairro VARCHAR(50)  NOT NULL,
Rua VARCHAR(50)  NOT NULL,
Telefone VARCHAR(15) NOT NULL,
Salario double not null,
FK_CodDepartamento  bigint,
foreign key(FK_CodDepartamento) references Departamento(Codigo)
);


CREATE TABLE Projeto (
Nome VARCHAR(50) NOT NULL,
Codigo BIGINT PRIMARY KEY,
FK_CodDepartamento  bigint,
foreign key(FK_CodDepartamento) references Departamento(Codigo)
);

CREATE TABLE Trabalha (
Horas int,
FK_CodProjeto bigint,
FK_CpfFuncionario VARCHAR(14),
foreign key(FK_CodProjeto) references Projeto(Codigo),
foreign key(FK_CpfFuncionario) references Funcionario(Cpf),
primary key(FK_CodProjeto,FK_CpfFuncionario)
);

CREATE TABLE Telefones (
Fk_CodSede bigint, 
Telefone VARCHAR(15),
foreign key(Fk_CodSede) references Sede(Codigo),
primary key(Fk_CodSede, Telefone)
);

CREATE TABLE Dependente (
Nome VARCHAR(50) NOT NULL,
Cpf_Titular VARCHAR(14),
Cpf_Funcionario VARCHAR(14),
primary key(Nome),
foreign key(Cpf_Titular) references Titular(Cpf),
foreign key(Cpf_Funcionario) references Funcionario(Cpf),
constraint verifi check((Cpf_Funcionario is not null and Cpf_Titular is null)
						or (Cpf_Funcionario is null and Cpf_Titular is not null))
);






