# restore-royals.sh
#!/usr/bin/env bash
#
# Give mongod a few seconds to fully start up
sleep 5

echo "Starting MongoDB data import..."

# Import royals collection
echo "Importing royals collection..."
mongorestore \
  --username "$MONGO_INITDB_ROOT_USERNAME" \
  --password "$MONGO_INITDB_ROOT_PASSWORD" \
  --authenticationDatabase admin \
  --db university \
  --collection royals \
  /docker-entrypoint-initdb.d/royals/royals.bson

# Import moviescratch collection
echo "Importing moviesScratch collection..."
mongorestore \
  --username "$MONGO_INITDB_ROOT_USERNAME" \
  --password "$MONGO_INITDB_ROOT_PASSWORD" \
  --authenticationDatabase admin \
  --db university \
  --collection moviesScratch \
  /docker-entrypoint-initdb.d/movies/moviesScratch.bson

# Import movies collection
echo "Importing movies collection..."
mongorestore \
  --username "$MONGO_INITDB_ROOT_USERNAME" \
  --password "$MONGO_INITDB_ROOT_PASSWORD" \
  --authenticationDatabase admin \
  --db university \
  --collection movies \
  /docker-entrypoint-initdb.d/movies/movies.bson

# Import moviedetails collection
echo "Importing moviedetails collection..."
mongorestore \
  --username "$MONGO_INITDB_ROOT_USERNAME" \
  --password "$MONGO_INITDB_ROOT_PASSWORD" \
  --authenticationDatabase admin \
  --db university \
  --collection moviedetails \
  /docker-entrypoint-initdb.d/movies/movieDetails.bson

# Import reviews collection
echo "Importing reviews collection..."
mongorestore \
  --username "$MONGO_INITDB_ROOT_USERNAME" \
  --password "$MONGO_INITDB_ROOT_PASSWORD" \
  --authenticationDatabase admin \
  --db university \
  --collection reviews \
  /docker-entrypoint-initdb.d/movies/reviews.bson

echo "All MongoDB imports completed successfully!"

# Show collections in the database
echo "Collections created in university database:"
mongosh --username "$MONGO_INITDB_ROOT_USERNAME" --password "$MONGO_INITDB_ROOT_PASSWORD" --authenticationDatabase admin --eval "
  use university;
  db.getCollectionNames().forEach(function(collection) {
    print('- ' + collection + ': ' + db[collection].countDocuments() + ' documents');
  });
"
