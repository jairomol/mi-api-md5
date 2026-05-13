#!/bin/bash
echo "🔍 Iniciando monitoreo de salud (Ctrl+C para detener)..."
while true; do
  STATUS=$(curl -s -o /dev/null -w "%{http_code}" http://localhost/health)
  if [ "$STATUS" -eq 200 ]; then
    echo "$(date +%H:%M:%S) - ❤️ API SALUDABLE (200 OK)"
  else
    echo "$(date +%H:%M:%S) - ⚠️ API NO RESPONDE (Status: $STATUS)"
  fi
  sleep 5
done