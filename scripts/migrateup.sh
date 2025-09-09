#!/bin/bash

if [ -f .env ]; then
    source .env
fi

# Ensure Turso CLI is available in PATH
export PATH="$HOME/.turso/bin:$PATH"

# Extract DB name from DATABASE_URL
DB_NAME=notely-db

# Apply migrations using Turso CLI
for file in sql/schema/*.sql; do
  turso db shell "$DB_NAME" < "$file"
done
