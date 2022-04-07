#!/usr/bin/env bash

HOSTNAME=$(eval drush status --field db-hostname);
USERNAME=$(eval drush status --field db-username);
PASSWORD=$(eval drush status --field db-password);

for i in `seq 1 10`; do
  echo "Attempting to connect to the database."

  if php -r "mysqli_connect (\"$HOSTNAME\", \"$USERNAME\", \"$PASSWORD\") && exit(0) || exit(1);" &> /dev/null; then
    echo "Successfully connected to the database."
    eval drush status;
    eval drush cache:rebuild;
    eval drush updatedb;
    eval drush config:import;
    echo "Successfully updated.";
    break;
  elseif [[ i = 1 ]]
    echo "Failed to connect to the database.";
    exit 1;
  else
    echo "Failed to connect to the database. Retrying."
  fi;

  sleep 5;
done;