CREATE TABLE dbo.cliente (
  id        int IDENTITY(0, 1) NOT NULL, 
  nombres   varchar(50) NOT NULL, 
  apellidos varchar(50) NOT NULL, 
  correo    varchar(50) NOT NULL, 
  usuario   varchar(50) NOT NULL, 
  pass      varchar(50) NOT NULL, 
  CONSTRAINT PK__cliente__3213E83F00551192 
    PRIMARY KEY (id));
CREATE TABLE dbo.contacto (
  id        int IDENTITY(0, 1) NOT NULL, 
  nombres   varchar(50) NOT NULL, 
  apellidos varchar(50) NOT NULL, 
  correo    varchar(50) NOT NULL, 
  precio    decimal(18, 0) NOT NULL, 
  baja      bit NOT NULL, 
  idc       int NOT NULL, 
  CONSTRAINT PK__contacto__3213E83F07F6335A 
    PRIMARY KEY (id));
CREATE TABLE dbo.evento (
  id          int IDENTITY(0, 1) NOT NULL, 
  nombre      varchar(50) NOT NULL, 
  precio      decimal(18, 0) NOT NULL, 
  direccion   varchar(50) NOT NULL, 
  fechainicio bigint NOT NULL, 
  fechafinal  bigint NOT NULL, 
  cancelado   bit NOT NULL, 
  idc         int NOT NULL, 
  CONSTRAINT PK__evento__3213E83F0425A276 
    PRIMARY KEY (id));
CREATE TABLE dbo.invitacion (
  ide            int NOT NULL, 
  idc            int NOT NULL, 
  contacto       varchar(50) NOT NULL, 
  evento         int NOT NULL, 
  personasextras int NOT NULL, 
  CONSTRAINT PK__invitaci__11951BAB0BC6C43E 
    PRIMARY KEY (ide, 
  idc));
CREATE TABLE dbo.tarifa (
  contacto decimal(18, 0) NOT NULL, 
  evento   decimal(18, 0) NOT NULL);
ALTER TABLE dbo.contacto ADD CONSTRAINT FK__contacto__idc__0EA330E9 FOREIGN KEY (idc) REFERENCES dbo.cliente (id) ON UPDATE Cascade ON DELETE Cascade;
ALTER TABLE dbo.evento ADD CONSTRAINT FK__evento__idc__0DAF0CB0 FOREIGN KEY (idc) REFERENCES dbo.cliente (id) ON UPDATE Cascade ON DELETE Cascade;
ALTER TABLE dbo.invitacion ADD CONSTRAINT FK__invitacion__ide__0F975522 FOREIGN KEY (ide) REFERENCES dbo.evento (id) ON UPDATE Cascade ON DELETE Cascade;
ALTER TABLE dbo.invitacion ADD CONSTRAINT FK__invitacion__idc__108B795B FOREIGN KEY (idc) REFERENCES dbo.contacto (id) ON UPDATE No action ON DELETE No action;
