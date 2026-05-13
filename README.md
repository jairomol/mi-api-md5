# MD5 Validator API 🚀

![CI Status](https://github.com/jairomol/mi-api-md5/actions/workflows/ci.yml/badge.svg)

Esta es una API REST profesional desarrollada con **FastAPI**, protegida por un proxy inverso **Nginx** y totalmente automatizada con **Docker** y **GitHub Actions**.

---

## 🛠️ Tecnologías utilizadas

*   **Lenguaje:** Python 3.9
*   **Framework:** FastAPI (Elegido por su alto rendimiento y generación automática de OpenAPI/Swagger).
*   **Servidor Web:** Nginx (Proxy inverso para manejo de carga y seguridad).
*   **Contenerización:** Docker & Docker Compose.
*   **CI/CD:** GitHub Actions (Validación automática de cada cambio).

---

## 🚀 Cómo levantar el entorno local

Para ejecutar este proyecto en tu notebook (requiere Docker Desktop instalado):

1.  **Clonar el repositorio:**
    ```bash
    git clone [https://github.com/jairomol/mi-api-md5.git](https://github.com/jairomol/mi-api-md5.git)
    cd mi-api-md5
    ```

2.  **Levantar con Docker Compose:**
    ```bash
    docker compose up --build

---

## 📜 Scripts de Automatización

El proyecto incluye scripts en Bash para facilitar la gestión. Ejecútalos desde la raíz:

*   **Construir imágenes:**
    ```bash
    bash scripts/build.sh
    ```
*   **Iniciar el sistema:**
    ```bash
    bash scripts/start.sh
    ```
*   **Detener el sistema:**
    ```bash
    bash scripts/stop.sh
    ```
*   **Monitoreo de salud (Healthcheck cada 5s):**
    ```bash
    bash scripts/healthcheck.sh
    ```
    
---

