CREATE DATABASE abrigo_animais;

USE abrigo_animais;

-- Tabela para informações gerais dos animais
CREATE TABLE animais (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(50) NOT NULL,
  especie VARCHAR(50) NOT NULL,
  raca VARCHAR(50),
  genero ENUM('Macho', 'Fêmea') NOT NULL,
  idade INT NOT NULL,
  tamanho ENUM('Pequeno', 'Médio', 'Grande') NOT NULL,
  observacoes TEXT,
  data_entrada DATE NOT NULL,
  data_saida DATE,
  status ENUM('Disponível', 'Adotado', 'Indisponível') NOT NULL,
  foto_url VARCHAR(200)
);

-- Tabela para informações sobre os adotantes
CREATE TABLE adotantes (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(50) NOT NULL,
  email VARCHAR(50) NOT NULL,
  telefone VARCHAR(20),
  endereco VARCHAR(100),
  cidade VARCHAR(50),
  estado VARCHAR(50),
  cep VARCHAR(10)
);

-- Tabela de associação entre animais e adotantes
CREATE TABLE animais_adotantes (
  id INT PRIMARY KEY AUTO_INCREMENT,
  animal_id INT NOT NULL,
  adotante_id INT NOT NULL,
  data_adocao DATE NOT NULL,
  FOREIGN KEY (animal_id) REFERENCES animais(id),
  FOREIGN KEY (adotante_id) REFERENCES adotantes(id)
);

-- Tabela para informações sobre os voluntários do abrigo
CREATE TABLE voluntarios (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(50) NOT NULL,
  email VARCHAR(50) NOT NULL,
  telefone VARCHAR(20),
  endereco VARCHAR(100),
  cidade VARCHAR(50),
  estado VARCHAR(50),
  cep VARCHAR(10)
);

-- Tabela de associação entre animais e voluntários
CREATE TABLE animais_voluntarios (
  id INT PRIMARY KEY AUTO_INCREMENT,
  animal_id INT NOT NULL,
  voluntario_id INT NOT NULL,
  data_trabalho DATE NOT NULL,
  FOREIGN KEY (animal_id) REFERENCES animais(id),
  FOREIGN KEY (voluntario_id) REFERENCES voluntarios(id)
);