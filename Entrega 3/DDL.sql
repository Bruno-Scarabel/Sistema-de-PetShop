CREATE DATABASE IF NOT EXISTS ClinicaVeterinaria;
USE ClinicaVeterinaria;

SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS Execucao_Servico;
DROP TABLE IF EXISTS Produto_Estoque;
DROP TABLE IF EXISTS Produto_Fornec;
DROP TABLE IF EXISTS Especialidade_Veterinario;
DROP TABLE IF EXISTS Exame_Encaminha;
DROP TABLE IF EXISTS Medicamento;
DROP TABLE IF EXISTS Item_Compra;
DROP TABLE IF EXISTS Compra;
DROP TABLE IF EXISTS Pagamento;
DROP TABLE IF EXISTS Receita;
DROP TABLE IF EXISTS Exame;
DROP TABLE IF EXISTS Consulta;
DROP TABLE IF EXISTS Agendamento;
DROP TABLE IF EXISTS Clinica_Externa;
DROP TABLE IF EXISTS Estoque_Loja;
DROP TABLE IF EXISTS Fornecedor;
DROP TABLE IF EXISTS Produto;
DROP TABLE IF EXISTS Suprimentos;
DROP TABLE IF EXISTS Servico;
DROP TABLE IF EXISTS Veterinario;
DROP TABLE IF EXISTS Atendente;
DROP TABLE IF EXISTS Funcionario;
DROP TABLE IF EXISTS Casa;
DROP TABLE IF EXISTS Animal;
DROP TABLE IF EXISTS Cliente;

SET FOREIGN_KEY_CHECKS = 1;

CREATE TABLE Cliente(
    cpf CHAR(11) PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(20),
    email VARCHAR(100)
);

CREATE TABLE Casa(
    id INT PRIMARY KEY,
    rua VARCHAR(100) NOT NULL,
    numero VARCHAR(10) NOT NULL,
    bairro VARCHAR(60) NOT NULL,
    cpf_cliente_FK CHAR(11) NOT NULL,
    FOREIGN KEY(cpf_cliente_FK)
        REFERENCES Cliente(cpf)
);

CREATE TABLE Animal(
    id_animal INT PRIMARY KEY,
    nome_animal VARCHAR(80) NOT NULL,
    porte VARCHAR(30) NOT NULL,
    especie VARCHAR(50) NOT NULL,
    cpf_cliente_FK CHAR(11) NOT NULL,
    FOREIGN KEY(cpf_cliente_FK)
        REFERENCES Cliente(cpf)
);
CREATE TABLE Funcionario(
    id_funcionario INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf CHAR(11) UNIQUE NOT NULL,
    salario DECIMAL(10,2) NOT NULL
);

CREATE TABLE Atendente(
    id_funcionario_FK INT PRIMARY KEY,
    turno VARCHAR(30) NOT NULL,
    setor VARCHAR(50) NOT NULL,
    FOREIGN KEY(id_funcionario_FK)
        REFERENCES Funcionario(id_funcionario)
);

CREATE TABLE Veterinario(
    id_funcionario_FK INT PRIMARY KEY,
    crmv VARCHAR(20) UNIQUE NOT NULL,
    especialidade VARCHAR(100),
    FOREIGN KEY(id_funcionario_FK)
        REFERENCES Funcionario(id_funcionario)
);

CREATE TABLE Agendamento(
    id_agendamento INT PRIMARY KEY,
    data DATE NOT NULL,
    hora TIME NOT NULL,
    status VARCHAR(30) NOT NULL,
    observacao_agendamento VARCHAR(255),
    id_animal_FK INT NOT NULL,
    id_atendente_FK INT,
    FOREIGN KEY(id_animal_FK)
        REFERENCES Animal(id_animal),
    FOREIGN KEY(id_atendente_FK)
        REFERENCES Atendente(id_funcionario_FK)
);
CREATE TABLE Consulta(
    id_consulta INT PRIMARY KEY,
    data DATE NOT NULL,
    diagnostico VARCHAR(255) NOT NULL,
    valor DECIMAL(10,2) NOT NULL,
    observacoes VARCHAR(255),
    id_agendamento_FK INT NOT NULL,
    id_veterinario_FK INT NOT NULL,
    FOREIGN KEY(id_agendamento_FK)
        REFERENCES Agendamento(id_agendamento),
    FOREIGN KEY(id_veterinario_FK)
        REFERENCES Veterinario(id_funcionario_FK)
);

CREATE TABLE Clinica_Externa(
    id_clinica INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(20),
    endereco VARCHAR(150),
    especialidade VARCHAR(80)
);

CREATE TABLE Exame(
    id_exame INT PRIMARY KEY,
    tipo_exame VARCHAR(100) NOT NULL,
    resultado VARCHAR(255),
    data_realizacao DATE NOT NULL,
    status VARCHAR(30) NOT NULL,
    id_consulta_FK INT NOT NULL,
    id_clinica_FK INT,
    FOREIGN KEY(id_consulta_FK)
        REFERENCES Consulta(id_consulta),
    FOREIGN KEY(id_clinica_FK)
        REFERENCES Clinica_Externa(id_clinica)
);

CREATE TABLE Receita(
    id_receita INT PRIMARY KEY,
    data_emissao DATE NOT NULL,
    descricao VARCHAR(255) NOT NULL,
    validade DATE NOT NULL,
    id_consulta_FK INT NOT NULL,
    FOREIGN KEY(id_consulta_FK)
        REFERENCES Consulta(id_consulta)
);
CREATE TABLE Produto(
    id_produto INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    validade DATE
);

CREATE TABLE Medicamento(
    id_produto_FK INT PRIMARY KEY,
    FOREIGN KEY(id_produto_FK)
        REFERENCES Produto(id_produto)
);

CREATE TABLE Suprimentos(
    id_produto_FK INT PRIMARY KEY,
    FOREIGN KEY(id_produto_FK)
        REFERENCES Produto(id_produto)
);

CREATE TABLE Fornecedor(
    id_fornecedor INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cnpj CHAR(14) UNIQUE NOT NULL,
    telefone VARCHAR(20),
    endereco VARCHAR(150)
);

CREATE TABLE Produto_Fornec(
    id_produto_FK INT,
    id_fornecedor_FK INT,
    PRIMARY KEY(id_produto_FK, id_fornecedor_FK),
    FOREIGN KEY(id_produto_FK)
        REFERENCES Produto(id_produto),
    FOREIGN KEY(id_fornecedor_FK)
        REFERENCES Fornecedor(id_fornecedor)
);

CREATE TABLE Estoque_Loja(
    id_estoque INT PRIMARY KEY,
    tipo_estoque VARCHAR(50),
    capacidade INT,
    localizacao VARCHAR(100)
);

CREATE TABLE Produto_Estoque(
    id_produto_FK INT,
    id_estoque_FK INT,
    quantidade INT NOT NULL,
    PRIMARY KEY(id_produto_FK, id_estoque_FK),
    FOREIGN KEY(id_produto_FK)
        REFERENCES Produto(id_produto),
    FOREIGN KEY(id_estoque_FK)
        REFERENCES Estoque_Loja(id_estoque)
);
CREATE TABLE Compra(
    id_compra INT PRIMARY KEY,
    data DATE NOT NULL,
    forma_pagamento VARCHAR(30) NOT NULL,
    valor_total DECIMAL(10,2) NOT NULL,
    cpf_cliente_FK CHAR(11) NOT NULL,
    FOREIGN KEY(cpf_cliente_FK)
        REFERENCES Cliente(cpf)
);

CREATE TABLE Item_Compra(
    id_item INT PRIMARY KEY,
    quantidade INT NOT NULL,
    preco_unitario DECIMAL(10,2) NOT NULL,
    id_compra_FK INT NOT NULL,
    id_produto_FK INT NOT NULL,
    FOREIGN KEY(id_compra_FK)
        REFERENCES Compra(id_compra),
    FOREIGN KEY(id_produto_FK)
        REFERENCES Produto(id_produto)
);

CREATE TABLE Pagamento(
    id_pagamento INT PRIMARY KEY,
    valor DECIMAL(10,2) NOT NULL,
    data DATE NOT NULL,
    metodo VARCHAR(30) NOT NULL,
    id_compra_FK INT,
    id_consulta_FK INT,
    FOREIGN KEY(id_compra_FK)
        REFERENCES Compra(id_compra),
    FOREIGN KEY(id_consulta_FK)
        REFERENCES Consulta(id_consulta)
);
CREATE TABLE Servico(
    id_servico INT PRIMARY KEY,
    tipo VARCHAR(50) NOT NULL,
    descricao VARCHAR(255) NOT NULL,
    preco DECIMAL(10,2) NOT NULL
);

CREATE TABLE Item_Servico(
    id_item_servico INT PRIMARY KEY,
    valor DECIMAL(10,2),
    observacao VARCHAR(255),
    data_execucao DATE,
    id_servico_FK INT NOT NULL,
    FOREIGN KEY(id_servico_FK)
        REFERENCES Servico(id_servico)
);

CREATE TABLE Execucao_Servico(
    id_servico_FK INT,
    id_funcionario_FK INT,
    id_animal_FK INT,
    PRIMARY KEY(id_servico_FK,id_funcionario_FK,id_animal_FK),
    FOREIGN KEY(id_servico_FK)
        REFERENCES Servico(id_servico),
    FOREIGN KEY(id_funcionario_FK)
        REFERENCES Funcionario(id_funcionario),
    FOREIGN KEY(id_animal_FK)
        REFERENCES Animal(id_animal)
);

CREATE TABLE Medicamento_Receita(
    id_receita_FK INT,
    id_produto_FK INT,
    PRIMARY KEY(id_receita_FK,id_produto_FK),
    FOREIGN KEY(id_receita_FK)
        REFERENCES Receita(id_receita),
    FOREIGN KEY(id_produto_FK)
        REFERENCES Medicamento(id_produto_FK)
);

CREATE TABLE Exame_Encaminha(
    id_exame_FK INT,
    id_clinica_FK INT,
    PRIMARY KEY(id_exame_FK,id_clinica_FK),
    FOREIGN KEY(id_exame_FK)
        REFERENCES Exame(id_exame),
    FOREIGN KEY(id_clinica_FK)
        REFERENCES Clinica_Externa(id_clinica)
);
