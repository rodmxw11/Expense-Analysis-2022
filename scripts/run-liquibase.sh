#!/bin/sh

liquibase=~/JavaPrograms/liquibase-4.6.1/
PATH=$liquibase:$PATH

liquibase --defaultsFile=../src/database-config/liquibase.properties $*

