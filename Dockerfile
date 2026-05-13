# --- Etapa 1: Constructor (Builder) ---
FROM python:3.9-slim AS builder

WORKDIR /build
# Aprovechamos el cache de capas de Docker copiando solo requirements primero
COPY app/requirements.txt .
RUN pip install --user --no-cache-dir -r requirements.txt

# --- Etapa 2: Producción (Final) ---
# --- Etapa 2: Producción (Final) ---
FROM python:3.9-slim AS runner

# Creamos el usuario primero
RUN useradd -m myuser
WORKDIR /app

# Copiamos las librerías desde el builder
COPY --from=builder /root/.local /home/myuser/.local
# Copiamos el código y le damos la propiedad al usuario (Clave para seguridad)
COPY --chown=myuser:myuser app/ .

# Ajustamos las rutas para el nuevo usuario
ENV PATH=/home/myuser/.local/bin:$PATH
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

EXPOSE 8000

# Cambiamos al usuario
USER myuser

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]