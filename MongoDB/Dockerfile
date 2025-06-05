FROM mongo:latest

ENV MONGO_INITDB_ROOT_USERNAME=student
ENV MONGO_INITDB_ROOT_PASSWORD=pxl


# The official entrypoint will run: mongorestore /docker-entrypoint-initdb.d/royals.bson
COPY ./royals /docker-entrypoint-initdb.d/royals

EXPOSE 27017

# (Optional)
HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
  CMD mongosh --quiet --eval "db.adminCommand({ ping: 1 })" || exit 1
