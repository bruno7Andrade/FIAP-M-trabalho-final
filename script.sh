pg_ctlcluster 11 main start
psql -c "CREATE USER felipe PASSWORD '123456';"
psql -c "CREATE DATABASE daas OWNER felipe;"
psql daas < /var/www/html/trabalho-final.sql
