# Указываем базовый образ с нужной версией Python
FROM python:3.9-slim-buster

# Устанавливаем переменные окружения
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Создаем рабочую директорию
WORKDIR /app

# Копируем файл с зависимостями
COPY requirements.txt /app/

# Устанавливаем зависимости
RUN pip install --no-cache-dir -r requirements.txt

# Копируем остальной код приложения
COPY . /app/

# Выставляем порт, который будет слушать Django приложение
EXPOSE 8000

# Команда для запуска сервера Django (например, для локальной разработки)
# Для продакшена лучше использовать Gunicorn или uWSGI
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
