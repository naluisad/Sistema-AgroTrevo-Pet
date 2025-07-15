create table tutor (
   cpf varchar(11) NOT NULL,
   nome varchar(30) not null,
   email varchar(30) not null,
   ender varchar(40) not null,
   ntel varchar(15) not null,
   constraint pk_tutor primary key (cpf),
   constraint uk_email_tutor unique (email));

create table  pet (
   codpet varchar(5) not null,
   cpf varchar(11) not null,
   nomepet varchar(20) not null,
   idade integer not null,
   tipo varchar(8) not null,
   porte varchar(10) not null,
   raca varchar(25) not null,
   comorb varchar(40),
   infoadd varchar(40),
   constraint pk_pet primary key (codpet, cpf),
   constraint fk_pet_tutor foreign key (cpf) references tutor(cpf));

create table pacote (
   codpac varchar(5) not null,
   numtosas varchar(4) not null,
   numbanhos varchar(4) NOT NULL,
   valor numeric (10,2) not null,
   tipopac varchar(3) not null,
   constraint pk_pacote primary key (codpac));
--
create table pagamento (
   codpag varchar(5) not null,
   formapag varchar(10) not null,
   stpag varchar(10),
   constraint pk_pagamento primary key (codpag));

create table agenda (
   codagenda varchar(5) not null,
   dtagenda date not null,
   horario time not null,
   constraint pk_agenda primary key (codagenda));

create table servico(
    codserv varchar(5) not null,
    dtexe date not null,
    obs varchar(20) not null,
    taxi varchar(3) not null,
    constraint pk_servico primary key (codserv));


create table contrato(
    codcont varchar(5) not null,
    cpf varchar(11) not null,
    codpac varchar(5) not null,
    codpet varchar(5) not null,
    dtcont date not null, 
    dtfim date,
    constraint pk_contrato primary key (codcont, cpf, codpac, codpet),
    constraint fk_contrato_tutor foreign key (cpf) references tutor(cpf),
    constraint fk_contrato_pacote foreign key (codpac) references pacote(codpac));
   
   
INSERT INTO tutor (cpf, nome, email, ender, ntel) VALUES
('11111111111', 'Ana Rocha', 'anaro@gmail.com', 'Rua 1, Bairro Centro, nº 111', '111111111'),
('22222222222', 'Juliana Mota', 'ju@gmail.com', 'Rua 2, Bairro Saic, nº 222', '222222222'),
('33333333333', 'Camila Mendes', 'cami@gmail.com', 'Rua 3, Bairro Bormain, nº 333', '333333333'),
('44444444444', 'Jorge Furtado', 'jorge@gmail.com', 'Rua 4, Jardim Italia, nº 444', '444444444'),
('55555555555', 'Claudio Werner', 'cla@gmail.com', 'Rua 5, Jardim America nº 555', '555555555'),
('66666666666', 'Bruno Carvalho', 'bcarvalho@gmail.com', 'Rua 6, Bairro Nova Esperança, nº 666', '666666666'),
('77777777777', 'Fernanda Martins', 'fer@gmail.com', 'Rua 7, Bairro Bom Retiro nº 777', '777777777'),
('88888888888', 'Patricia Gomes', 'pati@gmail.com', 'Rua 8, Bairro Cincuentenario, nº 888', '888888888'),
('99999999999', 'Marcela Almeida', 'mar@gmail.com', 'Rua 9, Bairro Passo dos Fortes, nº 999', '999999999'),
('10101010101', 'Neusa Santos', 'neusa@gmail.com', 'Rua 10, Bairro Santa Luzia, nº 1010', '101010101');   
 
INSERT INTO pet (codpet, nomepet, idade, tipo, porte, raca, comorb, infoadd) VALUES
('A0001', 'mimosa', 3, 'gato', 'pequeno', 'persa', 'ansiedade de separação', NULL),
('A0002', 'baltazar', 4, 'gato', 'pequeno', 'vira lata', NULL, NULL),
('A0003', 'olivia', 5, 'gato', 'pequeno', 'vira lata', NULL, NULL),
('A0004', 'pandora', 8, 'cachorro', 'grande', 'golden retriever', NULL, 'não tolera o secador, deve secar naturalmente'),
('A0005', 'peregrino', 7, 'cachorro', 'medio', 'vira lata', NULL, 'necessita de focinheira para atendimento'),
('A0006', 'bob', 2, 'cachorro', 'pequeno', 'pug', 'problemas respiratorios', NULL),
('A0007', 'mel', 2, 'gato', 'pequeno', 'siames', 'obeso', NULL),
('A0008', 'jujuba', 1, 'cachorro', 'medio', 'beagle', NULL, NULL),
('A0009', 'dora', 6, 'cachorro', 'pequeno', 'lulu da pomerânia', NULL, 'alergia a talco'),
('A0010', 'pingo', 4, 'cachorro', 'pequeno', 'pinscher', 'cega', 'late bastante');


INSERT INTO pacote (codpac, numtosas, numbanhos, valor, tipopac) VALUES
('PC001', 4, 4, 40, 'B'),
('PC002', 4, 4, 60, 'BTH'),
('PC003', 4, 4, 80, 'BTG'),
('PC004', 4, 4, 150, 'BTH'),
('PC005', 4, 4, 50, 'BCU'),
('PC006', 4, 4, 90, 'BT'),
('PC007', 4, 4, 85, 'BAP'),
('PC008', 4, 4, 60, 'BTB'),
('PC009', 4, 4, 80, 'BAP'),
('PC010', 4, 4, 90, 'BT');

INSERT INTO pagamento (codpag, formapag, stpag) VALUES
('PG001', 'crédito', 'pago'),
('PG002', 'débito', 'pago'),
('PG003', 'dinheiro', 'pago'),
('PG004', 'crédito', 'pendente'),
('PG005', 'débito', 'pago'),
('PG006', 'crédito', 'cancelado'),
('PG007', 'dinheiro', 'pago'),
('PG008', 'débito', 'pendente'),
('PG009', 'dinheiro', 'pago'),
('PG010', 'crédito', 'pago');

INSERT INTO agenda (codagenda, dtagenda, horario) VALUES
('AG001', '2025-07-15', '09:00'),
('AG002', '2025-07-15', '10:30'),
('AG003', '2025-07-15', '13:00'),
('AG004', '2025-07-15', '14:30'),
('AG005', '2025-07-16', '09:00'),
('AG006', '2025-07-16', '10:30'),
('AG007', '2025-07-16', '13:00'),
('AG008', '2025-07-17', '09:00'),
('AG009', '2025-07-17', '10:30'),
('AG010', '2025-07-17', '13:00');

INSERT INTO servico (codserv, dtexe, obs, taxi) VALUES
('SV001', '2025-06-18', 'Atendimento com presença do tutor', 'sim'),
('SV002', '2025-02-14', 'Utilizado shampoo hipoalergênico', 'não'),
('SV003', '2025-06-20', NULL, 'sim'),
('SV004', '2025-06-21', NULL, 'sim'),
('SV005', '2025-04-29', 'animal agressivo, manipulação difícil', 'não'),
('SV006', '2025-06-22', NULL, 'sim'),
('SV007', '2025-06-25', NULL, 'não'),
('SV008', '2025-06-30', NULL, 'não'),
('SV009', '2025-06-28', NULL, 'sim'),
('SV010', '2025-06-19', NULL, 'não');
