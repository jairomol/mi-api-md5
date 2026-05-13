# --- Etapa 1: Constructor ---
FROM python:3.9-slim AS builder
WORKDIR /build
COPY app/requirements.txt .
# Instalamos globalmente en esta etapa para copiarlo fácil después
RUN pip install --no-cache-dir -r requirements.txt

# --- Etapa 2: Producción ---
FROM python:3.9-slim AS runner
WORKDIR /app

# Copiamos las librerías del sitio de Python directamente
COPY --from=builder /usr/local/lib/python3.9/site-packages /usr/local/lib/python3.9/site-packages
COPY --from=builder /usr/local/bin /usr/local/bin

# Copiamos el código y damos permisos al usuario
RUN useradd -m myuser
COPY --chown=myuser:myuser app/ .

# Variables de entorno críticas
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

USER myuser
EXPOSE 8000

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]