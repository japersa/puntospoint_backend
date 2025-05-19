# Puntospoint Backend - Desafío Técnico

Este proyecto ofrece una solución integral al desafío técnico de **Puntospoint**, desarrollada con Ruby on Rails y siguiendo las mejores prácticas de desarrollo backend.

---

## Tecnologías utilizadas

- **Ruby** 3.2+
- **Rails** 7.1+
- **PostgreSQL** como base de datos
- **Sidekiq** + Redis para procesamiento en segundo plano
- **JWT** para autenticación de administradores
- **RSpec** para pruebas
- **Postman** para pruebas de API (archivo incluido)

---

## Instalación y configuración

### 1. Clonar el repositorio

```bash
git clone git@github.com:japersa/puntospoint-backend.git
cd puntospoint-backend
```

### 2. Instalar dependencias

```bash
bundle install
```

### 3. Configurar base de datos

```bash
rails db:create db:migrate db:seed
```

### 4. Levantar el servidor

```bash
rails s
```

### 5. Iniciar Sidekiq

```bash
brew services start redis
redis-server             
bundle exec sidekiq
```

### Autenticación

**Endpoint de login:** `POST /api/v1/auth/login`

**Autenticación por JWT:** se debe incluir en el header de cada request:

```http
Authorization: Bearer <jwt>
```

### Endpoints

| Método | Ruta                             | Descripción                                                 |
|--------|----------------------------------|-------------------------------------------------------------|
| `POST` | `/api/v1/auth/login`            | Autenticación y obtención de token                          |
| `GET`  | `/api/v1/products/most_purchased` | Productos más comprados por categoría                       |
| `GET`  | `/api/v1/products/top_revenue`   | Top 3 productos con mayor recaudación por categoría         |
| `GET`  | `/api/v1/purchases/filter`       | Listado filtrado de compras                                 |
| `GET`  | `/api/v1/purchases/granularity`  | Cantidad de compras por granularidad (hora, día, etc.) |
| `POST` | `/api/v1/purchases`             | Crear una nueva compra                                      |