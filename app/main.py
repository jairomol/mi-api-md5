import hashlib, json
from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
from typing import Any

app = FastAPI()

class DataModel(BaseModel):
    data: Any
    md5: str

@app.get("/health")
def health():
    return {"status": "ok"}

@app.post("/validate-md5")
def validate(payload: DataModel):
    # Si es un diccionario (JSON), lo normalizamos
    if isinstance(payload.data, dict):
        content = json.dumps(payload.data, sort_keys=True, separators=(',', ':'))
    else:
        # Si es texto simple, lo usamos tal cual sin comillas extra
        content = str(payload.data)
        
    hash_calculado = hashlib.md5(content.encode()).hexdigest()
    
    if hash_calculado == payload.md5:
        return {"md5": hash_calculado}
    
    # Truco para debug: te dice qué está intentando procesar la API
    raise HTTPException(status_code=400, detail=f"No coincide. La API procesó: {content}")