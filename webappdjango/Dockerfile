FROM python:3.6

ARG DJANGO_ENV

ENV PYTHONUNBUFFERED=1
ENV WEBAPP_DIR=/webappdjango

RUN mkdir $WEBAPP_DIR

WORKDIR $WEBAPP_DIR

ADD requirements/base.txt $WEBAPP_DIR/
ADD requirements/$DJANGO_ENV.txt $WEBAPP_DIR/

RUN pip3 install -r $DJANGO_ENV.txt

ADD . $WEBAPP_DIR/
