CREATE DATABASE IF NOT EXISTS BD_Atenciones_UEH;

USE BD_Atenciones_UEH;

CREATE TABLE Previsiones (
  Prev_Id INT PRIMARY KEY,
  Prev_Glosa VARCHAR(200)
);

CREATE TABLE Comunas (
  Comu_Id INT PRIMARY KEY,
  Comu_Glosa VARCHAR(200)
);

CREATE TABLE Pacientes (
  Pac_id INT PRIMARY KEY,
  Pac_Nombres VARCHAR(500),
  Pac_Apellido_Paterno VARCHAR(500),
  Pac_Apellido_Materno VARCHAR(500),
  Pac_Edad INT,
  Prev_Id INT,
  Comu_Id INT,
  FOREIGN KEY(Prev_Id) REFERENCES Previsiones(Prev_Id),
  FOREIGN KEY(Comu_Id) REFERENCES Comunas(Comu_Id)
);

CREATE TABLE Especialidades (
  Esp_Id INT PRIMARY KEY,
  Esp_Glosa VARCHAR(1000)
);

CREATE TABLE Medicos (
  Med_Id INT PRIMARY KEY,
  Med_Nombres VARCHAR(500),
  Med_Apellido_Paterno VARCHAR(500),
  Med_Apellido_Materno VARCHAR(500),
  Med_Edad INT,
  Esp_Id INT,
  FOREIGN KEY(Esp_Id) REFERENCES Especialidades(Esp_Id)
);

CREATE TABLE Prestaciones (
  Prest_Id INT PRIMARY KEY,
  Prest_Fonasa CHAR(7),
  Prest_Glosa VARCHAR(2500),
  Prest_Valor DECIMAL(19,2)
);

CREATE TABLE Atenciones (
  Ate_Id INT PRIMARY KEY,
  Ate_Folio INT,
  Ate_Fecha DATE,
  Med_Id INT,
  Prest_Id INT,
  Pac_Id INT,
  FOREIGN KEY(Med_Id) REFERENCES Medicos(Med_Id),
  # FOREIGN KEY(Prest_Id) REFERENCES Prestaciones(Prest_Id),
  FOREIGN KEY(Pac_Id) REFERENCES Pacientes(Pac_Id)  
);