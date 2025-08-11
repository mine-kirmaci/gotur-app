from fastapi import FastAPI
from .database import Base, engine
from . import models
from .routers import auth

app = FastAPI(title="Getir Clone API - Auth Only")

# İlk çalıştırmada tabloları oluştur (MVP için Alembic yok)
Base.metadata.create_all(bind=engine)

app.include_router(auth.router)

@app.get("/health")
def health():
    return {"status": "ok"}
