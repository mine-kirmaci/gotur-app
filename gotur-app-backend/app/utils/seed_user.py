from sqlalchemy.orm import Session
from ..database import Base, engine, SessionLocal
from ..models import User
from ..security import hash_password

def run():
    Base.metadata.create_all(bind=engine)
    db: Session = SessionLocal()
    try:
        email = "mine@example.com"
        user = db.query(User).filter(User.email == email).first()
        if not user:
            u = User(
                name="Test User",
                email=email,
                phone="5550000000",
                password_hash=hash_password("Password123!"),
                is_email_verified=True,  # şimdilik doğrulanmış varsay
            )
            db.add(u)
            db.commit()
            print("Seed user created:", email, "Password123!")
        else:
            print("Seed user already exists.")
    finally:
        db.close()

if __name__ == "__main__":
    run()
#deneme