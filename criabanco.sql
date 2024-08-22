CREATE DATABASE PRATICANDO;

USE PRATICANDO;

CREATE TABLE Clientes (
    Cadastro INT(20) PRIMARY KEY NOT NULL,
    Nome VARCHAR(40),
    DataNasc DATE,
    Telefone VARCHAR(30),
    Cidade VARCHAR(100),
    Sexo CHAR(1) CHECK (Sexo IN ('M', 'F'))
);

CREATE TABLE Servicos (
    NumServ INT(20) PRIMARY KEY NOT NULL,
    NomeServ VARCHAR(100),
    Valor VARCHAR(10)
);

CREATE TABLE Utilizacoes (
    Ordem INT(20) PRIMARY KEY NOT NULL,
    Cliente INT(20),
    Servico INT(20),
    FOREIGN KEY (Cliente) REFERENCES Clientes(Cadastro),
    FOREIGN KEY (Servico) REFERENCES Servicos(NumServ)
);