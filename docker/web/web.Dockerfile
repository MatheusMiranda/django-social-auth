FROM python:3.6

ENV PYTHONUNBUFFERED 1

RUN mkdir /web
RUN mkdir /web/django_social_auth_app

WORKDIR /web

COPY ./requirements.txt /web/
COPY ./manage.py /web/

RUN pip install -r requirements.txt

COPY ./django_social_auth_app /web/django_social_auth_app

ENV PORT=8000                             \
    ALLOWED_HOSTS=localhost               \
    PREFIX_URL=

CMD ["gunicorn", "--chdir", "django_social_auth_app","--bind", ":8000", "wsgi:application"]


