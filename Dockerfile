FROM python:3.14-slim
WORKDIR /app
COPY backend/requirements-postgres.txt ./requirements.txt
RUN pip install --no-cache-dir -r requirements.txt
COPY backend/ ./
EXPOSE 8000
CMD ["sh","-c","python -m alembic -c alembic.ini upgrade head && python -m uvicorn app.api.main:app --host 0.0.0.0 --port 8000"]
