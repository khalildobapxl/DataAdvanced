FROM mongo:latest

ENV MONGO_INITDB_ROOT_USERNAME=student
ENV MONGO_INITDB_ROOT_PASSWORD=pxl


COPY ./royals /docker-entrypoint-initdb.d/royals
COPY ./Movies /docker-entrypoint-initdb.d/movies
COPY ./MoveisScratch /docker-entrypoint-initdb.d/movies
COPY ./MovieDetails /docker-entrypoint-initdb.d/movies
COPY ./reviews /docker-entrypoint-initdb.d/movies



# COPY initializing script for the database royals
COPY ./restore-royals.sh /docker-entrypoint-initdb.d 

EXPOSE 27017

# (Optional)
HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
  CMD mongosh --quiet --eval "db.adminCommand({ ping: 1 })" || exit 1
