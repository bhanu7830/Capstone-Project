FROM python:3.11-slim

WORKDIR /app

COPY . .

RUN pip install --no-cache-dir pandas numpy scikit-learn

EXPOSE 8000

CMD ["python", "nutrition_engine.py"]
