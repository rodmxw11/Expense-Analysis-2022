#!/bin/sh

liquibase=~/JavaPrograms/liquibase-4.6.1/
PATH=$liquibase:$PATH

dbpath=../database

rm $dbpath/*.db

liquibase --defaultsFile=../src/main/resources/sqlite-liquibase/liquibase.properties update


