from pydantic import BaseModel, EmailStr

class LoginRequest(BaseModel):#Hatalıysa 422 döner
    email: EmailStr
    password: str

class TokenResponse(BaseModel):
    access_token: str
    token_type: str = "bearer"

class UserOut(BaseModel):
    id: int
    name: str
    email: EmailStr
    model_config = {"from_attributes": True}
