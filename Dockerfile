#FROM python:3.8.19-slim-bullseye
FROM python@sha256:e87cbda2ad77070742458632973529100bef57859139fa025c7d6d50dd6c3caf

#Make app folder on root
RUN mkdir -p /app

#Set working directory for application
WORKDIR /app

#Copy installation direction file and perform packages installation
COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt

#Copy application to working directoy
COPY *.py ./
COPY Procfile ./

#Run app with gunicorn 
CMD ["gunicorn",  "-b", "0.0.0.0:5000", "app:app"]

EXPOSE 5000
