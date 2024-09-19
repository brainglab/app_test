# App test

Bienvenido al repositorio oficial del proyecto de ejemplo Flutter presentado en mi canal de YouTube Brainglab. 🚀 Aquí encontrarás todo el código fuente revisado y explicado en los videos, incluyendo la configuración del entorno, la creación de pantallas, la modificación de `main.dart`, y mucho más. Este repositorio está diseñado para ayudarte a seguir paso a paso el desarrollo de una aplicación Flutter desde cero. Ya seas un principiante o un desarrollador experimentado, este recurso te proporcionará una base sólida para tus propios proyectos. ¡No olvides suscribirte al canal para más tutoriales y actualizaciones!

## Script para creación de ejemplo en Supabase
```mysql
-- tabla countries
CREATE TABLE countries (
  idx varchar(255) PRIMARY KEY,
  country_name varchar(255),
  country_code_letter varchar(255),
  country_code varchar(255),
  country_flag_url varchar(255),
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW(),
  UNIQUE (idx)
);

-- Asegúrate de que la extensión uuid-ossp esté habilitada
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- Crear la función generate_uuid
CREATE OR REPLACE FUNCTION generate_uuid()
RETURNS TRIGGER AS $$
BEGIN
  NEW.idx := uuid_generate_v4()::text || '-' || to_char(NOW(), 'YYYYMMDDHH24MISS') || '-' || lpad(floor(random() * 1000000)::text, 6, '0');
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Añadir triggers para cada tabla
CREATE TRIGGER set_uuid_countries
BEFORE INSERT ON countries
FOR EACH ROW
EXECUTE FUNCTION generate_uuid();

```
