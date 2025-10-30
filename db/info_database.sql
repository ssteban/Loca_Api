"CREACION TABLA departamento"
CREATE TABLE departamento (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    divipola VARCHAR(10),
    cantidad_personas INTEGER,
    fecha_actualizacion TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    fecha_creacion TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);
"CREACION TABLA municipio"
CREATE TABLE municipio (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    divipola VARCHAR(10),
    cantidad_personas INTEGER,
    fecha_actualizacion TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    fecha_creacion TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);
"CRECAION TABLE localidad"
CREATE TABLE localidad (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);
"CREACION TABLA municipio_localidad"
CREATE TABLE municipio_localidad (
    id SERIAL PRIMARY KEY,
    municipio_id INTEGER REFERENCES municipio(id),
    localidad_id INTEGER REFERENCES localidad(id)
);
"CREAR TRIGGER municipio_localidad"
CREATE OR REPLACE FUNCTION asignar_localidades()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO municipio_localidad (municipio_id, localidad_id)
    SELECT NEW.id, l.id FROM localidad l;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;
------------------------------------------------
CREATE TRIGGER trigger_asignar_localidades
AFTER INSERT ON municipio
FOR EACH ROW
EXECUTE FUNCTION asignar_localidades();

"CREAR VISTA vista_municipio_localidad"
CREATE VIEW vista_municipio_localidad AS
SELECT m.nombre AS municipio,
       d.nombre AS departamento,
       l.nombre AS localidad
FROM municipio_localidad ml
JOIN municipio m ON ml.municipio_id = m.id
JOIN departamento d ON m.departamento_id = d.id
JOIN localidad l ON ml.localidad_id = l.id;

"CREAR VISTA vista_departamento_municipio_localidad"
SELECT d.nombre AS departamento,
       COUNT(DISTINCT m.id) AS total_municipios,
       COUNT(ml.id) AS total_localidades
FROM municipio_localidad ml
JOIN municipio m ON ml.municipio_id = m.id
JOIN departamento d ON m.departamento_id = d.id
GROUP BY d.nombre
ORDER BY total_municipios DESC;





"INSERTAR DATOS EN TABLA departamento"
INSERT INTO departamento (nombre, divipola, cantidad_personas)
VALUES
('Amazonas', NULL, NULL),
('Antioquia', NULL, NULL),
('Arauca', NULL, NULL),
('Atlántico', NULL, NULL),
('Bolívar', NULL, NULL),
('Boyacá', NULL, NULL),
('Caldas', NULL, NULL),
('Caquetá', NULL, NULL),
('Casanare', NULL, NULL),
('Cauca', NULL, NULL),
('Cesar', NULL, NULL),
('Chocó', NULL, NULL),
('Córdoba', NULL, NULL),
('Cundinamarca', NULL, NULL),
('Guainía', NULL, NULL),
('Guaviare', NULL, NULL),
('Huila', NULL, NULL),
('La Guajira', NULL, NULL),
('Magdalena', NULL, NULL),
('Meta', NULL, NULL),
('Nariño', NULL, NULL),
('Norte de Santander', NULL, NULL),
('Putumayo', NULL, NULL),
('Quindío', NULL, NULL),
('Risaralda', NULL, NULL),
('San Andrés y Providencia', NULL, NULL),
('Santander', NULL, NULL),
('Sucre', NULL, NULL),
('Tolima', NULL, NULL),
('Valle del Cauca', NULL, NULL),
('Vaupés', NULL, NULL),
('Vichada', NULL, NULL);





"INSERTAR DATOS EN TABLA municipio"
INSERT INTO municipio (nombre, divipola, departamento_id)
VALUES
('Leticia', NULL, 1),
('El Encanto', NULL, 1),
('La Chorrera', NULL, 1),
('La Pedrera', NULL, 1),
('La Victoria', NULL, 1),
('Miriti - Paraná', NULL, 1),
('Puerto Alegría', NULL, 1),
('Puerto Arica', NULL, 1),
('Puerto Nariño', NULL, 1),
('Puerto Santander', NULL, 1),
('Tarapacá', NULL, 1);

('Aberrojal', NULL, 2),
('Abriaquí', NULL, 2),
('Alejandría', NULL, 2),
('Amagá', NULL, 2),
('Amalfi', NULL, 2),
('Andes', NULL, 2),
('Angelópolis', NULL, 2),
('Angostura', NULL, 2),
('Anorí', NULL, 2),
('Antioquia', NULL, 2),
('Anzá', NULL, 2),
('Apartadó', NULL, 2),
('Arboletes', NULL, 2),
('Argelia', NULL, 2),
('Armenia', NULL, 2),
('Barbosa', NULL, 2),
('Bello', NULL, 2),
('Belmira', NULL, 2),
('Betania', NULL, 2),
('Betulia', NULL, 2),
('Briceño', NULL, 2),
('Buriticá', NULL, 2),
('Cáceres', NULL, 2),
('Caicedo', NULL, 2),
('Caldas', NULL, 2),
('Campamento', NULL, 2),
('Cañasgordas', NULL, 2),
('Caracolí', NULL, 2),
('Caramanta', NULL, 2),
('Carepa', NULL, 2),
('Carolina del Príncipe', NULL, 2),
('Caucasia', NULL, 2),
('Chigorodó', NULL, 2),
('Cisneros', NULL, 2),
('Ciudad Bolívar', NULL, 2),
('Cocorná', NULL, 2),
('Concepción', NULL, 2),
('Concordia', NULL, 2),
('Copacabana', NULL, 2),
('Dabeiba', NULL, 2),
('Donmatías', NULL, 2),
('Ebéjico', NULL, 2),
('El Bagre', NULL, 2),
('El Carmen de Viboral', NULL, 2),
('El Peñol', NULL, 2),
('El Retiro', NULL, 2),
('El Santuario', NULL, 2),
('Entrerríos', NULL, 2),
('Envigado', NULL, 2),
('Fredonia', NULL, 2),
('Frontino', NULL, 2),
('Giraldo', NULL, 2),
('Girardota', NULL, 2),
('Gómez Plata', NULL, 2),
('Granada', NULL, 2),
('Guadalupe', NULL, 2),
('Guarne', NULL, 2),
('Guatapé', NULL, 2),
('Heliconia', NULL, 2),
('Hispania', NULL, 2),
('Itagüí', NULL, 2),
('Ituango', NULL, 2),
('Jardín', NULL, 2),
('Jericó', NULL, 2),
('La Ceja', NULL, 2),
('La Estrella', NULL, 2),
('La Pintada', NULL, 2),
('La Unión', NULL, 2),
('Liborina', NULL, 2),
('Maceo', NULL, 2),
('Marinilla', NULL, 2),
('Medellín', NULL, 2),
('Montebello', NULL, 2),
('Murindó', NULL, 2),
('Mutatá', NULL, 2),
('Nariño', NULL, 2),
('Nechí', NULL, 2),
('Necoclí', NULL, 2),
('Olaya', NULL, 2),
('Peque', NULL, 2),
('Pueblorrico', NULL, 2),
('Puerto Berrío', NULL, 2),
('Puerto Nare', NULL, 2),
('Puerto Triunfo', NULL, 2),
('Remedios', NULL, 2),
('Rionegro', NULL, 2),
('Sabanalarga', NULL, 2),
('Sabaneta', NULL, 2),
('Salgar', NULL, 2),
('San Andrés de Cuerquia', NULL, 2),
('San Carlos', NULL, 2),
('San Francisco', NULL, 2),
('San Jerónimo', NULL, 2),
('San José de la Montaña', NULL, 2),
('San Juan de Urabá', NULL, 2),
('San Luis', NULL, 2),
('San Pedro de los Milagros', NULL, 2),
('San Pedro de Urabá', NULL, 2),
('San Rafael', NULL, 2),
('San Roque', NULL, 2),
('San Vicente', NULL, 2),
('Santa Bárbara', NULL, 2),
('Santa Rosa de Osos', NULL, 2),
('Santo Domingo', NULL, 2),
('Segovia', NULL, 2),
('Sonsón', NULL, 2),
('Sopetrán', NULL, 2),
('Támesis', NULL, 2),
('Tarazá', NULL, 2),
('Tarso', NULL, 2),
('Titiribí', NULL, 2),
('Toledo', NULL, 2),
('Turbo', NULL, 2),
('Uramita', NULL, 2),
('Urrao', NULL, 2),
('Valdivia', NULL, 2),
('Valparaíso', NULL, 2),
('Vegachí', NULL, 2),
('Venecia', NULL, 2),
('Vigía del Fuerte', NULL, 2),
('Yalí', NULL, 2),
('Yarumal', NULL, 2),
('Yolombó', NULL, 2),
('Yondó', NULL, 2),
('Zaragoza', NULL, 2);

('Arauca', NULL, 3),
('Saravena', NULL, 3),
('Arauquita', NULL, 3),
('Tame', NULL, 3),
('Fortul', NULL, 3),
('Puerto Rondón', NULL, 3),
('Cravo Norte', NULL, 3);

('Baranoa', NULL, 4),
('Barranquilla', NULL, 4),
('Campo de la Cruz', NULL, 4),
('Candelaria', NULL, 4),
('Galapa', NULL, 4),
('Juan de Acosta', NULL, 4),
('Luruaco', NULL, 4),
('Malambo', NULL, 4),
('Manatí', NULL, 4),
('Palmar de Varela', NULL, 4),
('Piojó', NULL, 4),
('Polonuevo', NULL, 4),
('Ponedera', NULL, 4),
('Puerto Colombia', NULL, 4),
('Repelón', NULL, 4),
('Sabanagrande', NULL, 4),
('Sabanalarga', NULL, 4),
('Santa Lucía', NULL, 4),
('Santo Tomás', NULL, 4),
('Soledad', NULL, 4),
('Suan', NULL, 4),
('Tubará', NULL, 4),
('Usiacurí', NULL, 4);

















"INSERTAR DATOS EN TABLA localidad"
INSERT INTO localidad (nombre)
VALUES
('Norte'),
('Sur'),
('Oriente'),
('Occidente'),
('Centro'),
('Suroccidente'),
('Suroriente'),
('Metropolitana'),
('Rural'),
('Cabecera');

