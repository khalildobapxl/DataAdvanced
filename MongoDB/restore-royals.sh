# restore-royals.sh
#!/usr/bin/env bash
#
# Give mongod a few seconds to fully start up
sleep 2

echo "Starting mongorestore of royals.bson into database 'royals'..."
mongorestore \
  --username "$MONGO_INITDB_ROOT_USERNAME" \
  --password "$MONGO_INITDB_ROOT_PASSWORD" \
  --authenticationDatabase admin \
  --db royals \
  --collection royals \
  /docker-entrypoint-initdb.d/royals/royals.bson

echo "mongorestore finished."
