#! /bin/sh
wait-for-it postgres:5432 -t 60
wait-for-it elasticsearch:9200 -t 60
wait-for-it redis:6379 -t 60
bootstrap --config schema.json
pgsync --config schema.json --daemon