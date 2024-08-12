from fastapi import FastAPI

app = FastAPI()

@app.get("/")
async def root():
	return {
		"response": 200,
		"message": "API is working !"
	}
