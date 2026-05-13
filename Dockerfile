# --- Etapa 1: Constructor (Builder) ---
FROM python:3.9-slim AS builder

WORKDIR /build
# Aprovechamos el cache de capas de Docker copiando solo requirements primero
COPY app/requirements.txt .
RUN pip install --user --no-cache-dir -r requirements.txt

# --- Etapa 2: Producción (Final) ---
FROM python:3.9-slim AS runner

WORKDIR /app
# Copiamos solo las librerías instaladas desde la etapa anterior (Separación de etapas)
COPY --from=builder /root/.local /root/.local
COPY app/ .

# Aseguramos que Python encuentre las librerías
ENV PATH=/root/.local/bin:$PATH
# Evita que Python genere archivos .pyc innecesarios
ENV PYTHONDONTWRITEBYTECODE=1

EXPOSE 8000

# Usuario no-root por seguridad (Best Practice)
RUN useradd -m myuser
USER myuser

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]