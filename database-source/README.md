# Backup of SQLite3 database
It is important that the database is fully backed up and committed to git.
These are guidance notes on how to dump the database and its schema to file(s).

## Dump the entire database into a file using the SQLite dump command
To dump a database into a file, use the .dump command.
The `.dump` command converts the entire structure and data of an SQLite database into a single text file.

By default, the `.dump` command outputs the SQL statements on screen. To issue the output to a file, you use the `.output FILENAME` command.

The following commands specify the output of the dump file to `vacuumasset-schema-and-data.sql` and dump the `vacuumasset database into the vacuumasset-schema-and-data.sql` file.
```
sqlite> .output database-source/vacuumasset-schema-and-data.sql
sqlite> .dump
sqlite> .exit
```
## Dump tables structure only using schema command
To dump the table structures in a database, use the `.schema` command.

The following commands set the output file to `vacuumasset-schema.sql` file and save the table structures into the `vacuumasset-schema.sql` file:
```
sqlite> .output database-source/vacuumasset-schema.sql
sqlite> .schema
sqlite> .quit
```

## Restoring the database from dump file
Very simply:
```
sqlite3 vac-restored.db < vacuumasset-schema-and-data.sql
```

