# LocaApi

API RESTful para selección progresiva de ubicación geográfica en Colombia.

## Descripción

LocaApi es una API diseñada para facilitar la selección de ubicaciones en Colombia de manera jerárquica, permitiendo a los usuarios especificar su ubicación desde el nivel de departamento hasta el de barrio. Esta API es ideal para aplicaciones que requieren personalización de servicios basada en el contexto geográfico del usuario.

## Características

- Selección de ubicación por niveles: Departamento, Ciudad, Localidad y Barrio.
- Endpoints para obtener listas de departamentos, municipios, localidades y barrios.
- Integración con Supabase para la gestión de datos geográficos.

## Instalación

1. Clona este repositorio:
   ```bash
   git clone https://github.com/ssteban/Loca_Api.git
   ```
2. Instala las dependencias:
   ```bash
   npm install
   ```

## Configuración

1. Crea un archivo `.env` en la raíz del proyecto.
2. Agrega las siguientes variables de entorno a tu archivo `.env`:
   ```
   SUPERBASE_URL=tu_superbase_url
   SUPABASE_KEY=tu_supabase_key
   ```

## Uso

Para iniciar la aplicación en modo de desarrollo, ejecuta:

```bash
npm run dev
```

Para iniciar la aplicación en modo de producción, ejecuta:

```bash
npm start
```

La API estará disponible en `http://localhost:3000`.

## Endpoints

- `GET /auth/info-api`: Obtiene información detallada sobre la API.
- `GET /auth/status`: Verifica el estado de la API.
- `GET /users/getDepartamento`: Obtiene la lista de departamentos.
- `GET /users/getMunicipio`: Obtiene la lista de todos los municipios.
- `GET /users/getMunicipioByDepartamento/:departamentoId`: Obtiene los municipios de un departamento específico.
- `GET /users/getLocalidadesByMunicipio/:municipioId`: Obtiene las localidades de un municipio específico.

## Base de Datos

La base de datos está gestionada en Supabase. A continuación se detalla el esquema de la base de datos:

### Tablas

- **`departamento`**: Almacena los departamentos de Colombia.
  - `id`: SERIAL PRIMARY KEY
  - `nombre`: VARCHAR(100) NOT NULL
  - `divipola`: VARCHAR(10)
  - `cantidad_personas`: INTEGER
  - `fecha_actualizacion`: TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
  - `fecha_creacion`: TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP

- **`municipio`**: Almacena los municipios de Colombia.
  - `id`: SERIAL PRIMARY KEY
  - `nombre`: VARCHAR(100) NOT NULL
  - `divipola`: VARCHAR(10)
  - `cantidad_personas`: INTEGER
  - `fecha_actualizacion`: TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
  - `fecha_creacion`: TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP

- **`localidad`**: Almacena las localidades.
  - `id`: SERIAL PRIMARY KEY
  - `nombre`: VARCHAR(100) NOT NULL

- **`municipio_localidad`**: Tabla de unión para relacionar municipios y localidades.
  - `id`: SERIAL PRIMARY KEY
  - `municipio_id`: INTEGER REFERENCES municipio(id)
  - `localidad_id`: INTEGER REFERENCES localidad(id)

## Contribuciones

Las contribuciones son bienvenidas. Si deseas contribuir, por favor, abre un issue o envía un pull request.

## Licencia

Este proyecto está bajo la Licencia MIT.
