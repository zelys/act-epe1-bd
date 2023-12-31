## Desarrollo de la Actividad

1. Se solicita generar script de una base de datos de nombre “BD_Atenciones_UEH” que contenga las presentes tablas y campos para poder almacenar la información de las atenciones a pacientes.

```sql
CREATE DATABASE IF NOT EXISTS bd_atenciones_ueh;

USE bd_atenciones_ueh;

CREATE TABLE previsiones (
 prev_id INT PRIMARY KEY,
 prev_glosa VARCHAR(200)
);

CREATE TABLE comunas (
 comu_id INT PRIMARY KEY,
 comu_glosa VARCHAR(200)
);

CREATE TABLE pacientes (
 pac_id INT PRIMARY KEY,
 pac_nombres VARCHAR(500),
 pac_apellido_Paterno VARCHAR(500),
 pac_apellido_Materno VARCHAR(500),
 pac_edad INT,
 prev_id INT,
 comu_id INT,
 FOREIGN KEY(prev_id) REFERENCES previsiones(prev_id),
 FOREIGN KEY(comu_id) REFERENCES comunas(comu_id)
);

CREATE TABLE especialidades (
 esp_id INT PRIMARY KEY,
 esp_glosa VARCHAR(1000)
);

CREATE TABLE medicos (
 med_id INT PRIMARY KEY,
 med_nombres VARCHAR(500),
 med_apellido_paterno VARCHAR(500),
 med_apellido_materno VARCHAR(500),
 med_edad INT,
 esp_id INT,
 FOREIGN KEY(esp_id) REFERENCES especialidades(esp_id)
);

CREATE TABLE prestaciones (
 prest_id INT PRIMARY KEY,
 prest_fonasa CHAR(7),
 prest_glosa VARCHAR(2500),
 prest_valor DECIMAL(19,2)
);

CREATE TABLE atenciones (
 ate_id INT PRIMARY KEY,
 ate_folio INT,
 ate_fecha DATE,
 med_id INT,
 prest_id INT,
 pac_id INT,
 FOREIGN KEY(med_id) REFERENCES medicos(med_id),
 # Existe un error en la cantidad de registros de la tabla prestaciones y 
 # los registros de prestaciones inexistentes en la tabla antenciones.
 # FOREIGN KEY(prest_id) REFERENCES Prestaciones(prest_id),
 FOREIGN KEY(pac_id) REFERENCES pacientes(pac_id)
);
```

2. Una vez generada la base de datos y sus respectivas tablas se necesita poblar con información de atenciones dicha base de datos con los siguientes registros, en base a lo expuesto favor generar script en lenguaje MYSQL.

```sql
INSERT INTO previsiones (prev_id, prev_glosa)
VALUES
(1,"FONASA A"),
(2,"FONASA B"),
(3,"FONASA C"),
(4,"FONASA D"),
(5,"ISAPRE COLMENA"),
(6,"ISAPRE ING"),
(7,"ISAPRE MAS VIDA S.A."),
(8,"ISAPRE SAN LORENZO"),
(9,"ISAPRE VIDA TRES S.A."),
(10,"SIN PREVISION");

INSERT INTO comunas (comu_id, comu_glosa)
VALUES
(1,"COQUIMBO"),
(2,"LA SERENA"),
(3,"OVALLE"),
(4,"VINA DEL MAR"),
(5,"SANTIAGO");

INSERT INTO pacientes (pac_id, pac_nombres, pac_apellido_paterno, pac_apellido_materno, pac_edad, prev_id, comu_id) 
VALUES
(1,"RICARDO AGUSTO","MEJIAS","DEVIA",35,1,1),
(2,"YONATHAN ENRIQUE","VALDIVIA","CORDOBA",26,8,1),
(3,"JORGE MANUEL","GUERRERO","CESTINA",59,3,4),
(4,"VITALIA","ESPANA","CASTELLANOS",36,1,1),
(5,"JAIME ANDRES","PANACUAR","MONTENEGRO",19,6,3),
(6,"JHON FERNANDO","DONADIOS","SANCHEZ",53,4,2),
(7,"VICENTE IGNACIO","RAMOS","CORTES",56,8,1),
(8,"SOFIA ANDREA","BERNAL","VEGA",25,2,1),
(9,"DAVID PATRICIO","LAUREL","RAMIREZ",42,4,1),
(10,"LAURA","BAEZA","SALINAS",70,1,2),
(11,"KARIME","ROJAS","GONZALEZ",25,2,1),
(12,"MARCELA ANDREA","LOBOS","VALDIVIA",41,10,1),
(13,"JOSE ANGEL","CORONA","RIVEROS",30,4,3),
(14,"VICTORIA ELIZABETH","CABRERA","ALARCON",76,1,1),
(15,"ANDREA DEL CARMEM","ALARCON","ARRIAGADA",81,3,1),
(16,"ALAN JUVEY","GUERRERO","MANSILLA",23,9,4),
(17,"MANUEL ANIVAL","ARAOS","ALVAREZ",77,1,1),
(18,"RONALD ANTONIO","PIMILLA","GUERRERO",58,1,2),
(19,"ISLE ELGE","PEREIRA","PUEYE",56,10,1),
(20,"JOSLENE","SALAS","ARANCIBIA",33,3,1),
(21,"MIGUEL ANGEL","NARANJO","ASTUDILLO",40,4,4),
(22,"RICHARD JONATHAN","ANDRADE","BRINEZ",36,10,1),
(23,"RITCHIE","FLORES","CORTES",48,5,1),
(24,"ANA CRISTINA","FUENTEALBA","GONZALEZ",21,10,3),
(25,"CESAR ARMANDO","CAMPIÑO","RESTREPO",29,8,1),
(26,"MARTA","GARCIA","GALVEZ",70,10,1),
(27,"SAMUEL FRANCISCO","GALADAMES","CAYULAO",57,4,2),
(28,"MARIA JOSE","TAPIA","GUTIERREZ",35,6,4),
(29,"YOHARI ALEJANDRA","NUÑEZ","ALCERRECA",33,4,2),
(30,"ROCIO ELENA","DE ROLDAN","FUSI",21,7,2),
(31,"PAMELA IVONNE","ESPINOZA","DONOSO",44,4,5),
(32,"ALVARO ALEJANDRO","GUAJARDO","TAPIA",41,1,2),
(33,"ROSSANA JACQUELINE","HERRERA","RIVAS",52,9,4),
(34,"JACQUELINE IVETTE","PIZARRO","HERRERA",55,4,2),
(35,"YEISON ANIBAL","PIZARRO","PIZARRO",31,3,5),
(36,"YENIFFER ALEXANDRA","HUEMUAN","MEJIAS",22,7,3),
(37,"ESTEBAN LUIS","VASQUEZ","OCARANZA",29,4,2),
(38,"SILVANA KARINA","GUTIERREZ","MORENO",39,2,3),
(39,"MARLENE CAROL","IBARRA","VASCO",53,4,4),
(40,"SEBASTIAN ARTURO","PIZARRO","LAGUERRE",25,10,2);

INSERT INTO especialidades (esp_id, esp_glosa)
VALUES
(1,"MEDICINA INTERNA"),
(2,"NEUROLOGÍA ADULTOS"),
(3,"NEUROLOGÏA PEDIÁTRICA"),
(4,"OBSTETRICIA Y GINECOLOGÍA"),
(5,"OFTALMOLOGÍA"),
(6,"OTORRINOLARINGOLOGÍA"),
(7,"PEDIATRÍA"),
(8,"TRAUMATOLOGÍA Y ORTOPEDIA"),
(9,"NEUROCIRUGÍA"),
(10, "PSIQUIATRÍA ADULTOS"),
(11,"PSIQUIATRÍA PEDIÁTRICA  Y ADOLESCENTES"),
(12,"UROLOGÍA"),
(13,"URGENCIÓLOGO"),
(14,"CIRUGÍA VASCULAR PERIFÉRICA"),
(15,"CIRUGÍA GENERAL"),
(16,"CIRUGÍA PEDIÁTRICA"),
(17,"CARDIOLOGÍA"),
(18,"ANESTESIOLOGÍA"),
(19,"CIRUGÍA DE CABEZA, CUELLO Y MAXILOFACIAL");

INSERT INTO medicos (med_id, med_nombres, med_apellido_paterno, med_apellido_materno, med_edad, esp_id) 
VALUES
(1,"OSCAR PATRICIO","BASTIAS","FIGUEROA",55,17),
(2,"LENNIS ALEXI","BARBA","CAVERO",45,14),
(3,"TABATHA NICOLE","TAPIA","PARRA",31,10),
(4,"JOSE LUIS","PASTEN","FLORES",42,10),
(5,"SANDY DIONICIA","RODRIGUEZ","DIAZ",41,3),
(6,"EMILY ANTONIA","UBILLA","BELTRAN",28,11),
(7,"LUISA ANJELKA","VEAS","RAMOS",27,2),
(8,"PABLO GERMAN ENRIQUE","TORRES","MORAN",30,7),
(9,"ULISES ANTONIO","AVENDANO","VILLARROEL",49,9),
(10,"ELIENNER JOSE","GRANADOS","CASAS",30,18),
(11,"VALERIA ALEJANDRA","BORGHERESI","CRUZ",22,1),
(12,"SANTIAGO ALONSO","HUERTA","PARRA",45,12),
(13,"VIERA","LILLO","SEGURA",26,12),
(14,"YASNA MARGARITA","VILLALOBOS","CACERES",43,12),
(15,"NATALIA BELEN","VILLALOBOS","HERNANDEZ",23,18),
(16,"MARGARITA DEL CARMEN","CORTES","GARCIA",75,1),
(17,"ESTEBAN RODORIGO","ANGULO","PAEZ",33,2),
(18,"HECTOR","FRITIS","ARAYA",42,18),
(19,"MATIAS ALEJANDRO","AVALOS","BOZZO",45,17);

INSERT INTO prestaciones (prest_id, prest_fonasa, prest_glosa, prest_valor) 
VALUES
(1,2104033,"BIOPSIA ÓSEA POR PUNCIÓN",34550),
(2,2104034,"BIOPSIA ÓSEA QUIRÚRGICA",146560),
(3,2104035,"BIOPSIA SINOVIAL O MUSCULAR POR PUNCIÓN",32690),
(4,2104036,"BIOPSIA SINOVIAL O MUSCULAR QUIRÚRGICA",49540),
(5,2104037,"BIOPSIA VERTEBRAL POR PUNCIÓN",66840),
(6,2104038,"MUÑÓN DE AMPUTACIÓN, REGULARIZACIÓN DE",164340),
(7,2104039,"OSTEOCONDROSIS O EPIFISITIS, TRAT. QUIR.",174640),
(8,2104040,"AMPUTACIÓN INTERESCÁPULO-TORÁCICA",496590),
(9,2104041,"DESARTICULACIÓN ESCÁPULO-HUMERAL",346080),
(10,2104042,"ENDOPRÓTESIS TOTAL DE HOMBRO, CUALQUIER TÉCNICA",355740),
(11,2104043,"FIJACIÓN DE ESCÁPULA",264290),
(12,2104044,"FRACTURA CUELLO HUMERAL, TRAT. QUIR.",264290),
(13,2104045,"FRACTURA DE CLAVÍCULA, OSTEOSÍNTESIS",146630),
(14,2104046,"FRACTURA ESCÁPULA, OSTEOSÍNTESIS",187510),
(15,2104048,"LUXACIÓN RECIDIVANTE DE HOMBRO TRAT. QUIR.",246310),
(16,2104049,"LUXACIÓN TRAUMÁTICA DE HOMBRO, REDUCCIÓN CRUENTA",174640),
(17,2104050,"LUXOFRACTURA, REDUCCIÓN Y OSTEOSÍNTESIS HOMBRO",264290),
(18,2104051,"RUPTURA MANGUITO ROTADORES, TRAT. QUIR. C/S ACROMIECTOMÍA",264290),
(19,2104052,"TRANSPOSICIONES MUSCULARES",187510),
(20,2104053,"AMPUTACIÓN BRAZO",212200),
(22,2104055,"OSTEOSÍNTESIS DIAFISIARIA DE HUMERO (CUALQUIER TÉCNICA)",187510),
(23,2104056,"OSTEOSÍNTESIS SUPRA O INTERCONDÍLEA (CUALQUIER TÉCNICA)",194210),
(24,2104057,"OSTEOTOMÍA HUMERO (CUALQUIER TÉCNICA)",187510),
(25,2104058,"PSEUDOARTROSIS C/S OSTEOSÍNTESIS C/S YESO HUMERO",187510),
(26,2104059,"ARTROPLASTÍA CON FASCIA CODO",212190),
(27,2104060,"CÚPULA RADIAL, RESECCIÓN",187460),
(28,2104061,"CÚPULA RADIAL, (RESECCIÓN CON IMPLANTE DE PRÓTESIS) ARTROPLASTIA",205410),
(29,2104062,"ENDOPRÓTESIS TOTAL (CUALQUIER TÉCNICA)",355740),
(30,2104063,"EPICONDILITIS, TRAT. QUIR. (CUALQUIER TÉCNICA)",194200),
(31,2104064,"LUXACIÓN DE CODO, REDUCCIÓN CRUENTA",174670),
(32,2104065,"LUXOFRACTURA DE CODO, REDUCCIÓN CRUENTA C/S RESECCIÓN CÚPULA RADIAL",187520),
(33,2104066,"OSTEOSÍNTESIS EPITROCLEA-EPICÓNDILO (CUALQUIER TÉCNICA)",187510),
(34,2104068,"TRASLOCACIÓN NERVIO CUBITAL (PROC. AUT.)",235380),
(35,2104069,"OPERACIÓN DE SALVATAJE RADIO-PROCÚBITO",212200),
(36,2104070,"AMPUTACIÓN ANTEBRAZO",212200),
(37,2104071,"EXTIRPACIÓN METÁFISIS DISTAL DEL CÚBITO Y ARTRODESIS RADIOCUBITAL INFERIOR",187510),
(38,2104072,"LUXOFRACTURAS (MONTEGGIA-GALEAZZI), REDUCC. Y OSTEOSÍNTESIS",187510),
(39,2104073,"OSTEOSÍNTESIS, FRACT. CERRADA CUBITO Y/O RADIO (CUALQ. TÉCN.)",187510),
(40,2104075,"PSEUDOARTROSIS CÚBITO Y/O RADIO C/S OSTEOSÍNTESIS C/S YESO",187510),
(41,2104076,"SINOSTOSIS RADIO-CUBITAL, TRAT. QUIR., C/S INJERTO",194210),
(42,2104077,"TRASPLANTES MÚSCULO-TENDINOSOS ANTEBRAZO",246310),
(43,2104078,"CONTRACTURA ISQUEM. DE VOLKMANN: DESCENSO MUSCULAR, NEUROLISIS",246310),
(44,2104079,"ENDOPRÓTESIS TOTAL (CUALQUIER TÉCNICA)",355740),
(45,2104080,"ESTILOIDES CUBITAL, RADIAL, RESECCIÓN DE.",174640),
(46,2104081,"FRACTURA O PSEUDOARTROSIS ESCAFOIDES, TRAT. QUIR. CUALQ. TÉCN.",174670),
(47,2104082,"IMPLANTE SILASTIC O SIMILARES (ESCAFOIDES, SEMILUNAR)",187520),
(48,2104083,"LUXACIÓN RADIOCARPIANA, TRAT. QUIR.",174640),
(50,2104085,"OSTEOSÍNTESIS RADIO, (CUALQUIER TÉCNICA)",187510),
(51,2104086,"TENDOVAGINOSIS DE DE QUERVAIN, TRAT. QUIR.",187510),
(52,2104087,"AMPUTACIÓN DEDOS (TRES O MÁS)",189020),
(53,2104088,"AMPUTACIÓN DEDOS (UNO O DOS)",138510),
(54,2104089,"AMPUTACIÓN MANO O DEL PULGAR",217410),
(55,2104090,"AMPUTACIÓN PULPEJOS (PLASTÍA KUTLER O SIMILARES)",164340),
(56,2104091,"CONTRACTURA DUPUYTREN, TRAT. QUIR., CADA TIEMPO",174640),
(57,2104093,"DEDOS EN GATILLO, TRAT. QUIR., CUALQUIER NÚMERO",164340),
(58,2104094,"FLEGMÓN MANO, TRAT. QUIR.",155220),
(59,2104095,"LUXOFRACTURA METACARPOFALÁNGICA O INTERFALÁNGICA, TRAT. QUIR.",164340),
(60,2104097,"MANO REUMÁTICA: IMPLANT. SILASTIC, CUALQ. NÚMERO (PROC. AUT.)",216060);

INSERT INTO atenciones (ate_id, ate_folio, ate_fecha, med_id, prest_id, pac_id) 
VALUES
(1, 1001, '2021-03-09', 2, 95, 7),
(2, 1002, '2021-02-11', 8, 23, 25),
(3, 1003, '2021-06-07', 7, 109, 40),
(4, 1004, '2021-03-11', 19, 51, 18),
(5, 1005, '2021-02-14', 13, 154, 7),
(6, 1006, '2021-01-23', 13, 168, 31),
(7, 1007, '2021-05-30', 6, 157, 32),
(8, 1008, '2021-05-19', 11, 78, 34),
(9, 1009, '2021-02-08', 18, 85, 19),
(10, 1010, '2021-02-20', 16, 153, 27),
(11, 1011, '2021-04-04', 13, 98, 8),
(12, 1012, '2021-05-06', 9, 170, 31),
(13, 1013, '2021-02-19', 17, 117, 8),
(14, 1014, '2021-03-12', 14, 90, 24),
(15, 1015, '2021-02-14', 10, 69, 17),
(16, 1016, '2021-01-08', 4, 80, 14),
(17, 1017, '2021-06-26', 13, 60, 21),
(18, 1018, '2021-02-12', 10, 149, 14),
(19, 1019, '2021-03-11', 19, 115, 31),
(20, 1020, '2021-05-15', 2, 126, 12),
(21, 1021, '2021-02-18', 8, 159, 38),
(22, 1022, '2021-06-24', 15, 40, 18),
(23, 1023, '2021-04-18', 19, 2, 17),
(24, 1024, '2021-06-10', 2, 44, 35),
(25, 1025, '2021-01-14', 10, 89, 15),
(26, 1026, '2021-01-26', 14, 5, 5),
(27, 1027, '2021-01-03', 9, 103, 40),
(28, 1028, '2021-03-20', 4, 143, 30),
(29, 1029, '2021-01-25', 14, 140, 16),
(30, 1030, '2021-03-19', 2, 140, 17),
(31, 1031, '2021-02-12', 13, 107, 23),
(32, 1032, '2021-04-20', 14, 13, 12),
(33, 1033, '2021-04-13', 9, 113, 7),
(34, 1034, '2021-02-14', 6, 110, 31),
(35, 1035, '2021-03-08', 16, 135, 6),
(36, 1036, '2021-02-04', 3, 23, 22),
(37, 1037, '2021-04-06', 12, 52, 21),
(38, 1038, '2021-06-09', 13, 55, 17),
(39, 1039, '2021-05-05', 10, 158, 26),
(40, 1040, '2021-02-17', 2, 125, 32),
(41, 1041, '2021-06-15', 4, 89, 34),
(42, 1042, '2021-06-08', 8, 29, 22),
(43, 1043, '2021-06-23', 11, 168, 13),
(44, 1044, '2021-04-15', 6, 57, 14),
(45, 1045, '2021-04-16', 4, 146, 11),
(46, 1046, '2021-06-19', 1, 8, 23),
(47, 1047, '2021-04-18', 12, 34, 6),
(48, 1048, '2021-03-24', 5, 143, 35),
(49, 1049, '2021-05-30', 8, 4, 3),
(50, 1050, '2021-02-27', 17, 110, 33),
(51, 1051, '2021-03-16', 1, 111, 15),
(52, 1052, '2021-04-27', 15, 24, 38),
(53, 1053, '2021-03-18', 15, 50, 8),
(54, 1054, '2021-04-18', 18, 24, 5),
(55, 1055, '2021-03-10', 16, 94, 19),
(56, 1056, '2021-02-07', 6, 110, 19),
(57, 1057, '2021-02-06', 3, 154, 16),
(58, 1058, '2021-01-06', 9, 33, 9),
(59, 1059, '2021-02-12', 9, 70, 18),
(60, 1060, '2021-04-06', 4, 86, 30),
(61, 1061, '2021-02-12', 2, 12, 35),
(62, 1062, '2021-03-28', 9, 164, 35),
(63, 1063, '2021-04-11', 13, 151, 21),
(64, 1064, '2021-04-25', 9, 90, 27),
(65, 1065, '2021-04-17', 10, 138, 25),
(66, 1066, '2021-03-11', 2, 127, 32),
(67, 1067, '2021-03-15', 5, 115, 6),
(68, 1068, '2021-04-25', 2, 10, 19),
(69, 1069, '2021-02-18', 17, 57, 3),
(70, 1070, '2021-05-27', 14, 104, 5),
(71, 1071, '2021-04-22', 5, 144, 27),
(72, 1072, '2021-02-18', 9, 20, 16),
(73, 1073, '2021-04-25', 15, 124, 17),
(74, 1074, '2021-01-22', 17, 10, 26),
(75, 1075, '2021-04-26', 9, 88, 38),
(76, 1076, '2021-05-01', 10, 145, 14),
(77, 1077, '2021-03-23', 5, 64, 33),
(78, 1078, '2021-01-24', 10, 84, 6),
(79, 1079, '2021-02-03', 10, 135, 8),
(80, 1080, '2021-03-10', 7, 3, 12),
(81, 1081, '2021-03-06', 19, 30, 7),
(82, 1082, '2021-05-16', 5, 124, 2),
(83, 1083, '2021-03-10', 19, 39, 12),
(84, 1084, '2021-01-15', 4, 49, 22),
(85, 1085, '2021-03-02', 7, 9, 32),
(86, 1086, '2021-02-13', 9, 139, 4),
(87, 1087, '2021-04-02', 19, 155, 31),
(88, 1088, '2021-03-09', 9, 24, 19),
(89, 1089, '2021-01-24', 10, 48, 23),
(90, 1090, '2021-03-30', 1, 40, 26),
(91, 1091, '2021-01-09', 7, 22, 6),
(92, 1092, '2021-02-17', 5, 132, 26),
(93, 1093, '2021-06-30', 14, 100, 8),
(94, 1094, '2021-01-29', 6, 124, 11),
(95, 1095, '2021-06-12', 12, 1, 26),
(96, 1096, '2021-06-18', 16, 157, 17),
(97, 1097, '2021-03-21', 15, 83, 17),
(98, 1098, '2021-02-22', 10, 53, 5),
(99, 1099, '2021-04-03', 17, 113, 10),
(100, 1100, '2021-03-07', 4, 144, 36);
```

3. Dado que ya se cuenta con información en la base de datos de atenciones UEH, se necesita hacer uso de este recurso para la toma correcta de decisiones, por lo cual se solicita pueda dar respuesta a las siguientes solicitudes mediante consultas SQL a la base de datos:

- Cantidad de Atenciones por medico especialidad.

  - Esp_Id
  - Esp_Glosa
  - Cantidad

  ```sql
  SELECT e.esp_id, e.esp_glosa, COUNT(*) AS cantidad_atenciones 
  FROM atenciones a 
  INNER JOIN medicos m ON a.med_id = m.med_id 
  INNER JOIN especialidades e ON m.esp_id = e.esp_id 
  GROUP BY m.esp_id; 
  ```

- Listar médico y su especialidad con menor y mayor cantidades de atenciones entre el 15/01/2021 al 30/04/2021:

  - Med_Id
  - Med_Nombres
  - Med_Apellido_Paterno
  - Med_Apelliedo_Mataterno
  - Esp_Glosa
  - Min
  - Max

  ```sql
  # Primero realice la consulta para mostrar al médico y su especialidad, 
  # en orden de menor a mayor cantidad de atenciones entre las fechas indicadas.

  SELECT m.med_id, m.med_nombres, m.med_apellido_paterno, m.med_apellido_materno, e.esp_glosa, 
  COUNT(*) AS cantidad_atenciones
  FROM atenciones a
  INNER JOIN medicos m ON a.med_id = m.med_id
  INNER JOIN especialidades E ON M.Esp_Id = E.esp_Id
  WHERE a.ate_fecha BETWEEN '2021-01-15' AND '2021-04-30'
  GROUP BY a.med_id ORDER BY cantidad_atenciones ASC;

  # En la siguiente consulta realizo una subconsulta para mostrar 
  # el mínimo y máximo de atenciones entre las fechas que se indican.

  SELECT MAX(cantidad) AS maxima_cantidad, MIN(cantidad) AS minima_cantidad
  FROM atenciones, (
  SELECT COUNT(*) AS cantidad
  FROM atenciones
  WHERE ate_fecha BETWEEN '2021-01-15' AND '2021-04-30'
  GROUP BY med_id
  ) AS subconsulta;
  ```

- Total valor de prestaciones entre las fechas 01/01 2021 al 31/03/2021.

  - Comu_Id
  - Comu_Glosa
  - Total

  ```sql
  SELECT c.comu_id, c.comu_glosa, SUM(p.prest_valor) AS total
  FROM atenciones a
  INNER JOIN prestaciones p ON a.prest_id = p.prest_id
  INNER JOIN pacientes pa ON pa.pac_id = a.pac_id
  INNER JOIN comunas c ON pa.comu_id = c.comu_id
  WHERE a.ate_fecha BETWEEN '2021-01-01' AND '2021-03-31'
  GROUP BY c.comu_id;
  ```

- Promedio de atenciones por profesional médico.

  - Med_Id
  - Med_Nombres
  - Med_Apellido_Paterno
  - Med_Apellido_Materno
  - Promedio

  ```sql
  SELECT m.med_id, m.med_nombres, m.med_apellido_paterno, m.med_apellido_materno,
  COUNT(*) AS promedio
  FROM atenciones a
  INNER JOIN medicos m ON m.med_id = a.med_id
  GROUP BY a.med_id ORDER BY promedio DESC;
  ```
