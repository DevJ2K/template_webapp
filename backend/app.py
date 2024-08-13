from fastapi import FastAPI
from pydantic import BaseModel
from fastapi.middleware.cors import CORSMiddleware



class Item(BaseModel):
    name: str
    description: str | None = None
    price: float
    tax: float | None = None

class Test(BaseModel):
     name: str

app = FastAPI()

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

@app.get("/")
async def root():
	return {
		"response": 200,
		"message": "API is working !"
	}

@app.post("/items/")
async def create_item(item: Item):
    return item

@app.post("/test")
async def test_post(test: Test):
     print(test)
     return {
          "response": 200,
          "message": test.name
	 }

# curl -s -H 'Content-Type: application/json' -d '{ "name":"foo"}' -X POST http://127.0.0.1:8000/test/ | jq
