FROM python:3.9-slim

LABEL maintainer="Boris Ivanov <galacticborey@gmail.com>"

ENV LANG=C.UTF-8 \
    PYTHONUNBUFFERED=1

WORKDIR /app

COPY requirements.txt .

#Project's requirements
RUN pip3 install gunicorn
RUN pip3 install -r requirements.txt

#Target project
COPY . .

EXPOSE 8000

CMD ["gunicorn", "config.wsgi", "-w", "4", "-t", "600", "-b", "0.0.0.0:8000"]