#!/bin/bash

if [ -f .env ]; then
    source .env
fi

# Authenticate with Turso CLI
turso auth token "$TURSO_TOKEN"

# Apply migrations using Turso CLI
for file in sql/schema/*.sql; do
  turso db shell "$TURSO_DB_NAME" < "$file"
done