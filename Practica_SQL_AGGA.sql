-- create schema practica_SQL_AGGA;

set schema 'practica_sql_agga';

-- Crear tabla Socio
create table if not exists Socio (
    ID_Socio SERIAL primary key not null,
    Nombre VARCHAR(10) not null,
    Apellidos VARCHAR(20) not null,
    Fecha_Nacimiento DATE not null,
    Telefono INT not null,
    Numero_Identificacion VARCHAR(9) not null 
);

-- Crear tabla Dirección
create table if not exists Direccion (
	ID_Direccion INT primary key not null,
    Codigo_Postal VARCHAR(5)not null,
    Calle VARCHAR(20) not null,
    Numero VARCHAR(4) not null,
    Piso VARCHAR(2) not null,
    ID_Socio INT
);

-- Crear tabla Película
create table if not exists Pelicula(
    Titulo VARCHAR(25) primary key not null,
    Anyo_Publicacion INT not null,
    Genero VARCHAR(20) not null,
    Director VARCHAR(25) not null,
    Sinopsis TEXT not null
);

-- Crear tabla Copias
create table if not exists Copia_Pelicula (
    ID_Copia SERIAL primary key not null,
    Titulo VARCHAR(25) not null
);

-- tabla Préstamo
create table if not exists Prestamo (
    ID_Prestamo SERIAL primary key not null,
    ID_Copia INT not null,
    ID_Socio INT not null,
    Fecha_Prestamo DATE not null,
    Fecha_Devolucion DATE
);

/*

-- Direcciones a socios y viceversa
-- alter table (Socio) add constraint fk_socio_direccion foreign key (ID_Direccion) references Direccion(ID_Direccion); Cambio de opinion
alter table Direccion
add constraint fk_direccion_socio
foreign key (ID_Socio)
references Socio(ID_Socio);

-- Copias pelicuas a películas
alter table Copia_Pelicula
add constraint fk_copia_pelicula
foreign key (Titulo)
references Pelicula(Titulo);

-- Prestamos a copas película
alter table Prestamo
add constraint fk_prestamo_copia
foreign key (ID_Copia)
references Copia_Pelicula(ID_Copia);

-- Prestamos a socio
alter table Prestamo
add constraint fk_prestamo_socio
foreign key (ID_Socio)
references Socio(ID_Socio);

-- */

-- DATOS:

INSERT INTO Socio VALUES (1, 'Juan', 'Pérez', '1980-01-01', '123456789', 'DNI123');
INSERT INTO Socio VALUES (2, 'Ana', 'García', '1990-02-02', '987654321', 'DNI456');
INSERT INTO Socio VALUES (3, 'Carlos', 'Martínez', '1985-03-03', '111222333', 'DNI789');
INSERT INTO Socio VALUES (4, 'Lucía', 'Fernández', '1992-04-04', '444555666', 'DNI012');
INSERT INTO Socio VALUES (5, 'David', 'González', '1979-05-05', '777888999', 'DNI345');
INSERT INTO Socio VALUES (6, 'Sara', 'López', '1988-06-06', '333444555', 'DNI678');
INSERT INTO Socio VALUES (7, 'Mario', 'Rodríguez', '1993-07-07', '666777888', 'DNI901');

INSERT INTO Direccion VALUES (1, '28080', 'Calle Falsa', '123', '1',2);
INSERT INTO Direccion VALUES (2, '28081', 'Avenida Siempre Viva', '456', '2',3);
INSERT INTO Direccion VALUES (3, '28082', 'Calle Inventada', '789', '3',7);
INSERT INTO Direccion VALUES (4, '28083', 'Ronda Principal', '101', '4');
INSERT INTO Direccion VALUES (5, '28084', 'Avenida Secundaria', '202', '5',4);
INSERT INTO Direccion VALUES (6, '28085', 'Travesía Imaginaria', '303', '6');
INSERT INTO Direccion VALUES (7, '28086', 'Camino Real', '404', '7');

INSERT INTO Pelicula VALUES ('Titanic', '1997', 'Drama', 'James Cameron', 'Un barco se hunde');
INSERT INTO Pelicula VALUES ('Matrix', '1999', 'Ciencia Ficcion', 'Lana & Lilly Wachowski', 'Somos pilas en el futuro');
INSERT INTO Pelicula VALUES ('Inception', '2010', 'Ciencia Ficcion', 'Christopher Nolan', 'Sueños dentro de sueños');
INSERT INTO Pelicula VALUES ('El Señor de los Anillos', '2001', 'Fantasia', 'Peter Jackson', 'Un anillo para gobernarlos a todos');
INSERT INTO Pelicula VALUES ('Gladiator', '2000', 'Drama', 'Ridley Scott', 'Esposo romano busca venganza');
INSERT INTO Pelicula VALUES ('Interstellar', '2014', 'Ciencia Ficcion', 'Christopher Nolan', 'Sobrevalorado viaje al espacio');
INSERT INTO Pelicula VALUES ('El Padrino', '1972', 'Crimen', 'Francis Ford Coppola', 'La vida de un jefe de la mafia por ejemplo');

INSERT INTO Copia_Pelicula VALUES (1, 'Titanic');
INSERT INTO Copia_Pelicula VALUES (2, 'Titanic');
INSERT INTO Copia_Pelicula VALUES (3, 'Inception');
INSERT INTO Copia_Pelicula VALUES (4, 'El Señor de los Anillos');
INSERT INTO Copia_Pelicula VALUES (5, 'Gladiator');
INSERT INTO Copia_Pelicula VALUES (6, 'Interstellar');
INSERT INTO Copia_Pelicula VALUES (7, 'El Padrino');
INSERT INTO Copia_Pelicula VALUES (8, 'El Padrino');
INSERT INTO Copia_Pelicula VALUES (9, 'El Padrino');
INSERT INTO Copia_Pelicula VALUES (10, 'Interstellar');

INSERT INTO Prestamo VALUES (1, 2, 4, '2024-01-01', null);
INSERT INTO Prestamo VALUES (2, 5, 4, '2024-01-02', '2024-01-10');
INSERT INTO Prestamo VALUES (3, 1, 1, '2024-01-03', null);
INSERT INTO Prestamo VALUES (4, 8, 3, '2024-01-04', '2024-02-01');
INSERT INTO Prestamo VALUES (5, 10, 6, '2024-01-05', null);
INSERT INTO Prestamo VALUES (6, 7, 5, '2024-01-06', null);
INSERT INTO Prestamo VALUES (7, 3, 6,'2024-01-07', null);


-- Querys:

