from fastapi import FastAPI


app = FastAPI(
    title="Recipe App"
)

@app.get("/")
def get_hello():
    return "Hello world!"