FROM python:3.10

WORKDIR /app

COPY app.py ./
COPY requirements.txt ./
COPY project_name ./project_name

RUN pip install -r requirements.txt

EXPOSE 4000

CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "4000"]
