-- Cria tablespace p/ dados
--drop tablespace tbs_dados;

create tablespace tbs_dados
datafile 'C:\oraclexe\app\oracle\oradata\tbd_dados.dbf' size 100M reuse
autoextend on next 10M maxsize 200M
online;


-- Cria usuario (dono das tabelas)
create user linda --usuario
identified by "senha123"  --senha
default tablespace tbs_dados
temporary tablespace temp;

-- Cria e define a "role" de privilegios (perfil)
create role perfil_desenv;

grant
create cluster,
create database link,
create procedure,
create session,
create sequence,
create synonym,
create table,
create any type,
create trigger,
create view
to perfil_desenv;


grant alter session to perfil_desenv;	 -- adcicionar alguma permissão



grant create trigger to linda;		 //


grant perfil_desenv to linda;	 -- todas as permissões do perfil são atribuidas ao usuário


grant unlimited tablespace to linda;

