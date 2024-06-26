create schema if not exists Cinema default character set utf8mb4;
use Cinema;

create table if not exists Espectadores(
Cod_espectador INT not null primary key,
telefone varchar(20) not null,
email varchar(30) not null,
nome varchar(100) not null,
data_nasc date not null );

create table if not exists Filmes(
Id_filme INT not null primary key,
nome varchar(50) not null,
distribuidora varchar(70) not null,
tempo INT not null,
diretor varchar(50) not null );

create table if not exists Sala(
Id_sala INT not null primary key,
nome varchar(45) not null,
capacidade INT not null );

create table if not exists Ingressos(
Id_ingresso INT not null primary key,
data_ingresso date not null,
hora time not null,
espectador INT not null,
constraint esp_ing foreign key(espectador) references Espectadores(Cod_espectador) );

create table if not exists Sessoes(
Id_sessao INT not null,
ingressos INT not null,
Sala INT not null,
FIlmes INT not null,
primary key(Id_sessao, Ingressos, Sala, Filmes),
constraint ing_ses foreign key(Ingressos) references Ingressos(Id_ingresso),
constraint sal_ses foreign key(Sala) references Sala(Id_sala),
constraint fil_ses foreign key(Filmes) references Filmes(Id_filme) )