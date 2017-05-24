FROM python:3

RUN set -x \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
    bash \
    unzip \
    && rm -rf /var/lib/apt/lists/* \
    && pip install virtualenv \
    && pip install pyyaml \
    && mkdir -p /work

RUN mkdir /app

ADD https://github.com/ImmobilienScout24/yamlreader/archive/master.zip /app/

WORKDIR /app

RUN unzip master.zip

WORKDIR /app/yamlreader-master

ADD wrapper-build.sh .

RUN bash ./wrapper-build.sh

WORKDIR /app/yamlreader-master/target/dist/yamlreader-3.0.4/

RUN python setup.py install

# Set the docker entry point script.
COPY "docker-entrypoint.sh" "/"
ENTRYPOINT ["/docker-entrypoint.sh"]

VOLUME /work

WORKDIR /work
