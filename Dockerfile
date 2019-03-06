FROM python:3.6.6-stretch
MAINTAINER code0gm@gmail.com

#VOLUME ["/e/docker django workspace/frontweb/","/usr/src/app/frontWeb/front/"]

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        postgresql-client \
    && rm -rf /var/lib/apt/lists/*
	
WORKDIR /usr/src/app
ADD ./requirements.txt ./
RUN pip install -r ./requirements.txt
RUN django-admin startproject frontWeb

WORKDIR /usr/src/app/frontWeb
RUN python manage.py migrate

EXPOSE 8000

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
#docker run -it -p 8000:8000 -v "/e/docker django workspace/":/usr/src/app testweb5 /bin/bash
#docker run -it -p 8000:8000 --volume "/e/docker django workspace/":/usr/src/app testweb5
#docker run -it -p 8000:8000 testweb4 /bin/bash
#docker run -it -d --name djangoweb -p 8000:8000 -v "/e/docker django workspace/frontweb/":/usr/src/app/frontWeb/front/ djangoweb
#docker run -it -d --name web -p 8000:8000 -v "/e/docker django workspace/frontweb/":/usr/src/app/frontWeb/ web